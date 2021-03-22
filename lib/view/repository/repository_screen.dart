import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/app/Dio/response_handler.dart';
import 'package:onehub/common/app_scroll_view.dart';
import 'package:onehub/common/profile_banner.dart';
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
import 'package:onehub/view/repository/issues/issues_list.dart';
import 'package:onehub/view/repository/pulls/pulls_list.dart';
import 'package:onehub/view/repository/readme/repository_readme.dart';
import 'package:onehub/view/repository/widgets/about_repository.dart';
import 'package:onehub/view/repository/widgets/action_button.dart';
import 'package:onehub/view/repository/widgets/branch_button.dart';
import 'package:provider/provider.dart';

class RepositoryScreen extends StatefulWidget {
  final String? repositoryURL;
  final String? branch;
  final int index;
  final String? initSHA;
  RepositoryScreen(this.repositoryURL,
      {this.branch, this.index = 0, Key? key, this.initSHA})
      : super(key: key);

  @override
  _RepositoryScreenState createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen>
    with TickerProviderStateMixin {
  bool loading = true;
  late RepoBranchProvider repoBranchProvider;
  late CodeProvider codeProvider;
  late RepoReadmeProvider readmeProvider;
  late TabController tabController;
  late RepositoryProvider repositoryProvider;
  @override
  void initState() {
    tabController =
        TabController(length: 6, vsync: this, initialIndex: widget.index);
    waitForTransition();
    repositoryProvider = RepositoryProvider(widget.repositoryURL);
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
          create: (_) => repositoryProvider,
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
                // Don't pop screen if code browsing is open and not the root tree.
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
                    final _repo = value.repositoryModel!;
                    return AppScrollView(
                      scrollViewAppBar: ScrollViewAppBar(
                        expandedHeight: 340,
                        collapsedHeight: 150,
                        appBarWidget: Row(
                          children: [
                            ProfileTile(
                              _repo.owner!.avatarUrl,
                              userLogin: _repo.owner!.login,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(fontSize: 18),
                                    children: [
                                      TextSpan(text: '${_repo.owner!.login}/'),
                                      TextSpan(
                                          text: _repo.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        flexibleBackgroundWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProfileTile(
                                  _repo.owner!.avatarUrl,
                                  userLogin: _repo.owner!.login,
                                  showName: true,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  _repo.name!,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ActionButton(
                                  count: _repo.stargazersCount,
                                  icon: Octicons.star,
                                  action: 'Star',
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                ActionButton(
                                  count: _repo.forksCount,
                                  icon: Octicons.repo_forked,
                                  action: 'Fork',
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                ActionButton(
                                  count: _repo.watchersCount,
                                  icon: Octicons.eye,
                                  action: 'Watch',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                        bottomPadding: 60,
                        tabController: tabController,
                        tabs: [
                          'About',
                          'Readme',
                          'Code',
                          'Issues',
                          'Pull Requests',
                          'More'
                        ],
                        bottomHeader: BranchButton(
                          repo: _repo,
                        ),
                      ),
                      tabController: tabController,
                      loading: loading,
                      tabViews: [
                        AboutRepository(_repo),
                        RepositoryReadme(_repo.url),
                        CodeBrowser(),
                        IssuesList(),
                        PullsList(),
                        Container(
                          child: MaterialButton(
                            child: Text('Open Wiki'),
                            onPressed: () {
                              if (Provider.of<RepositoryProvider>(context,
                                      listen: false)
                                  .repositoryModel!
                                  .hasWiki!)
                                AutoRouter.of(context).push(WikiViewerRoute(
                                    repoURL: widget.repositoryURL));
                              else
                                ResponseHandler.setErrorMessage(AppPopupData(
                                    title: 'Repository has no wiki.'));
                            },
                          ),
                        ),
                      ],
                    );
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
