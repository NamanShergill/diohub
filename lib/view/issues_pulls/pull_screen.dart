import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/app_scroll_view.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/common/scaffold_body.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/issues/issue_timeline_event_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/pulls/pull_provider.dart';
import 'package:onehub/providers/users/current_user_provider.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';
import 'package:onehub/view/issues_pulls/discussion.dart';
import 'package:onehub/view/issues_pulls/pull_information.dart';
import 'package:onehub/view/issues_pulls/widgets/pull_changed_files_list.dart';
import 'package:onehub/view/issues_pulls/widgets/pulls_commits_list.dart';
import 'package:provider/provider.dart';

class PullScreen extends StatefulWidget {
  final String? pullURL;
  final DateTime? commentsSince;
  final int initialIndex;
  PullScreen(this.pullURL, {this.initialIndex = 0, this.commentsSince});
  @override
  _PullScreenState createState() => _PullScreenState();
}

class _PullScreenState extends State<PullScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(
        length: 4, initialIndex: widget.initialIndex, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PullProvider(
          widget.pullURL,
          Provider.of<CurrentUserProvider>(context, listen: false)
              .currentUserInfo!
              .login),
      builder: (context, child) {
        return SafeArea(
          child: Consumer<PullProvider>(
            builder: (context, value, _) {
              return Scaffold(
                appBar: value.status != Status.loaded
                    ? AppBar(
                        elevation: 0,
                      )
                    : null,
                body: ScaffoldBody(
                  notificationController: value.notificationController,
                  child: ProviderLoadingProgressWrapper<PullProvider>(
                    childBuilder: (context, value) {
                      return AppScrollView(
                        scrollController: scrollController,
                        childrenColor: AppColor.background,
                        scrollViewAppBar: ScrollViewAppBar(
                          tabController: tabController,
                          tabs: [
                            'Information',
                            'Discussion',
                            'Commits',
                            'Files Changed',
                          ],
                          collapsedHeight: 120,
                          expandedHeight: 250,
                          appBarWidget: Row(
                            children: [
                              getIcon(value.pullModel!.state,
                                  value.pullModel!.merged!, 15)!,
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                value.pullModel!.state == IssueState.OPEN
                                    ? 'Open'
                                    : value.pullModel!.merged!
                                        ? 'Merged'
                                        : 'Closed',
                                style: TextStyle(
                                    color: value.pullModel!.state ==
                                            IssueState.OPEN
                                        ? AppColor.green
                                        : value.pullModel!.merged!
                                            ? Colors.deepPurpleAccent
                                            : AppColor.red,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '#${value.pullModel!.number}',
                                style: TextStyle(
                                    color: AppColor.grey3, fontSize: 14),
                              ),
                            ],
                          ),
                          flexibleBackgroundWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  getIcon(value.pullModel!.state,
                                      value.pullModel!.merged!, 20)!,
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    value.pullModel!.state == IssueState.OPEN
                                        ? 'Open'
                                        : value.pullModel!.merged!
                                            ? 'Merged'
                                            : 'Closed',
                                    style: TextStyle(
                                        color: value.pullModel!.state ==
                                                IssueState.OPEN
                                            ? AppColor.green
                                            : value.pullModel!.merged!
                                                ? Colors.deepPurpleAccent
                                                : AppColor.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '#${value.pullModel!.number}',
                                    style: TextStyle(
                                        color: AppColor.grey3, fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  Icon(
                                    Octicons.comment,
                                    color: AppColor.grey3,
                                    size: 11,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '${value.pullModel!.comments} comments',
                                    style: TextStyle(
                                        color: AppColor.grey3, fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                value.pullModel!.title!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius:
                                      AppThemeBorderRadius.medBorderRadius,
                                  onTap: () {
                                    AutoRouter.of(context).push(
                                        RepositoryScreenRoute(
                                            repositoryURL: value.repoURL));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      value.repoURL!.replaceFirst(
                                          'https://api.github.com/repos/', ''),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                value.pullModel!.state == IssueState.CLOSED
                                    ? 'By ${value.pullModel!.user!.login}, closed ${getDate(value.pullModel!.closedAt.toString(), shorten: false)}.'
                                    : 'Opened ${getDate(value.pullModel!.createdAt.toString(), shorten: false)} by ${value.pullModel!.user!.login}',
                                style: TextStyle(
                                    color: AppColor.grey3, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        tabController: tabController,
                        tabViews: [
                          PullInformation(),
                          Discussion(
                            scrollController: scrollController,
                            repo: value.repoURL!.replaceFirst(
                                'https://api.github.com/repos/', ''),
                            commentsSince: widget.commentsSince,
                            isLocked: value.pullModel!.locked! &&
                                !value.editingEnabled!,
                            createdAt: value.pullModel!.createdAt,
                            issueUrl: value.pullModel!.issueUrl!,
                            initialComment: TimelineEventModel(
                                createdAt: value.pullModel!.createdAt,
                                event: Event.commented,
                                user: value.pullModel!.user,
                                url: value.pullModel!.url,
                                authorAssociation:
                                    value.pullModel!.authorAssociation,
                                body: value.pullModel!.body!.isNotEmpty
                                    ? value.pullModel!.body
                                    : "No description provided."),
                          ),
                          PullsCommitsList(),
                          PullChangedFilesList(),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget? getIcon(IssueState? state, bool merged, double size) {
    switch (state) {
      case IssueState.CLOSED:
        if (merged)
          return Icon(
            Octicons.git_merge,
            color: Colors.deepPurpleAccent,
            size: size,
          );
        else
          return Icon(
            Octicons.git_pull_request,
            color: AppColor.red,
            size: size,
          );
      case IssueState.OPEN:
        return Icon(
          Octicons.git_pull_request,
          color: AppColor.green,
          size: size,
        );
      default:
        return null;
    }
  }
}
