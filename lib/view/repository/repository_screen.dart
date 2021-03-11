import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onehub/app/Dio/response_handler.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/common/scaffold_body.dart';
import 'package:onehub/models/popup/popup_type.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/providers/repository/code_provider.dart';
import 'package:onehub/providers/repository/issues_provider.dart';
import 'package:onehub/providers/repository/pulls_provider.dart';
import 'package:onehub/providers/repository/readme_provider.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/animDuartions.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/repository/code/code_browser.dart';
import 'package:onehub/view/repository/readme/repository_readme.dart';
import 'package:onehub/view/repository/widgets/repo_app_bar.dart';
import 'package:provider/provider.dart';

class RepositoryScreen extends StatefulWidget {
  final String repositoryURL;
  final String branch;
  final int index;
  final String initSHA;
  RepositoryScreen(this.repositoryURL,
      {this.branch, this.index = 0, Key key, this.initSHA})
      : super(key: key);

  @override
  _RepositoryScreenState createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen>
    with TickerProviderStateMixin {
  bool loading = true;
  RepoBranchProvider repoBranchProvider;
  CodeProvider codeProvider;
  RepoReadmeProvider readmeProvider;
  TabController tabController;

  @override
  void initState() {
    tabController =
        TabController(length: 6, vsync: this, initialIndex: widget.index ?? 0);
    waitForTransition();
    repoBranchProvider = RepoBranchProvider(initialBranch: widget.branch);
    codeProvider =
        CodeProvider(repoURL: widget.repositoryURL, initialSHA: widget.initSHA);
    readmeProvider = RepoReadmeProvider(widget.repositoryURL);
    super.initState();
  }

  // To stop the transition from lagging on big readme files in the repo
  // by delaying the parsing.
  void waitForTransition() async {
    await Future.delayed(AppThemeAnimDurations.transitionAnimDuration);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RepositoryProvider(widget.repositoryURL),
        ),
        ChangeNotifierProxyProvider<RepositoryProvider, RepoBranchProvider>(
          create: (_) => repoBranchProvider,
          update: (_, repo, __) => repoBranchProvider..updateProvider(repo),
        ),
        ChangeNotifierProxyProvider<RepoBranchProvider, RepoReadmeProvider>(
            create: (_) => readmeProvider,
            update: (_, branch, __) => readmeProvider..updateProvider(branch)),
        ChangeNotifierProxyProvider<RepositoryProvider, RepoIssuesProvider>(
            create: (_) => RepoIssuesProvider(),
            update: (_, repo, __) => RepoIssuesProvider()),
        ChangeNotifierProxyProvider<RepositoryProvider, RepoPullsProvider>(
            create: (_) => RepoPullsProvider(),
            update: (_, repo, __) => RepoPullsProvider()),
        ChangeNotifierProxyProvider<RepoBranchProvider, CodeProvider>(
          create: (_) => codeProvider,
          update: (_, branch, __) => codeProvider..updateProvider(branch),
        ),
      ],
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.background,
            // Show a temporary app bar until the provider loads.
            appBar:
                Provider.of<RepositoryProvider>(context).status != Status.loaded
                    ? AppBar(
                        elevation: 0,
                      )
                    : PreferredSize(
                        child: Container(),
                        preferredSize: Size(0, 0),
                      ),
            body: WillPopScope(
              onWillPop: () async {
                if ((Provider.of<CodeProvider>(context, listen: false)
                            .tree
                            .length >
                        1 &&
                    tabController.index == 1)) {
                  if (Provider.of<CodeProvider>(context, listen: false)
                          .status !=
                      Status.loading)
                    Provider.of<CodeProvider>(context, listen: false).popTree();
                  return false;
                } else
                  return true;
              },
              child: ScaffoldBody(
                notificationController: Provider.of<RepositoryProvider>(context)
                    .notificationController,
                child: ProviderLoadingProgressWrapper<RepositoryProvider>(
                  childBuilder: (context, value) {
                    final _repo = value.repositoryModel;
                    return NestedScrollView(
                        headerSliverBuilder: (context, value) {
                      return [
                        SliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                          sliver: SliverSafeArea(
                            sliver: RepoAppBar(
                              repo: _repo,
                              tabController: tabController,
                            ),
                          ),
                        )
                      ];
                    }, body: Builder(builder: (context) {
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context);

                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 50),
                        child: loading
                            ? Container(
                                color: AppColor.onBackground,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 48.0),
                                      child: LoadingIndicator(),
                                    ),
                                  ],
                                ))
                            : TabBarView(
                                controller: tabController,
                                children: [
                                  RepositoryReadme(_repo.url),
                                  CodeBrowser(),
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(
                                    child: MaterialButton(
                                      child: Text('Open Wiki'),
                                      onPressed: () {
                                        print(Provider.of<RepositoryProvider>(
                                                context,
                                                listen: false)
                                            .repositoryModel
                                            .hasWiki);
                                        if (Provider.of<RepositoryProvider>(
                                                context,
                                                listen: false)
                                            .repositoryModel
                                            .hasWiki)
                                          AutoRouter.of(context).push(
                                              WikiViewerRoute(
                                                  repoURL:
                                                      widget.repositoryURL));
                                        else
                                          ResponseHandler.setErrorMessage(
                                              AppPopupData(
                                                  title:
                                                      'Repository has no wiki.'));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                      );
                    }));
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
