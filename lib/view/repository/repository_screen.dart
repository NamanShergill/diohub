import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/common/scaffold_body.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/providers/repository/code_provider.dart';
import 'package:onehub/providers/repository/commits_provider.dart';
import 'package:onehub/providers/repository/issues_provider.dart';
import 'package:onehub/providers/repository/pulls_provider.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:onehub/style/animDuartions.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/repository/code/code_browser.dart';
import 'package:onehub/view/repository/readme/repository_readme.dart';
import 'package:onehub/view/repository/widgets/repo_app_bar.dart';
import 'package:provider/provider.dart';

class RepositoryScreen extends StatefulWidget {
  final String repositoryURL;
  final String branch;
  RepositoryScreen(this.repositoryURL, {this.branch, Key key})
      : super(key: key);

  @override
  _RepositoryScreenState createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  bool loading = true;
  RepoBranchProvider repoBranchProvider;
  CodeProvider codeProvider;

  @override
  void initState() {
    waitForTransition();
    repoBranchProvider = RepoBranchProvider(initialBranch: widget.branch);
    codeProvider = CodeProvider(repoURL: widget.repositoryURL);
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
        ChangeNotifierProxyProvider<RepoBranchProvider, RepoCommitsProvider>(
            create: (_) => RepoCommitsProvider(),
            update: (_, branch, __) => RepoCommitsProvider()),
      ],
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.background,
            body: DefaultTabController(
              length: 7,
              initialIndex: 0,
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
                                children: [
                                  RepositoryReadme(_repo.url),
                                  CodeBrowser(),
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
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
