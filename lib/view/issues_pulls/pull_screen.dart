import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/app_scroll_view.dart';
import 'package:dio_hub/common/misc/scaffold_body.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/graphql/graphql.dart' hide IssueState;
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/providers/issue_pulls/pull_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/view/issues_pulls/discussion.dart';
import 'package:dio_hub/view/issues_pulls/issue_screen.dart';
import 'package:dio_hub/view/issues_pulls/pull_information.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:dio_hub/view/issues_pulls/widgets/pull_changed_files_list.dart';
import 'package:dio_hub/view/issues_pulls/widgets/pulls_commits_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class PullScreen extends StatefulWidget {
  final String? pullURL;
  final DateTime? commentsSince;
  final int initialIndex;
  const PullScreen(this.pullURL,
      {this.initialIndex = 0, this.commentsSince, Key? key})
      : super(key: key);
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PullProvider(
              widget.pullURL,
              Provider.of<CurrentUserProvider>(context, listen: false)
                  .currentUserInfo
                  ?.login),
        ),
        ChangeNotifierProvider(
          create: (context) => CommentProvider(),
        ),
      ],
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
                        childrenColor: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .background,
                        scrollViewAppBar: ScrollViewAppBar(
                          tabController: tabController,
                          url: value.pullModel!.htmlUrl,
                          tabs: const [
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
                              const SizedBox(
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
                                        ? Provider.of<PaletteSettings>(context)
                                            .currentSetting
                                            .green
                                        : value.pullModel!.merged!
                                            ? Colors.deepPurpleAccent
                                            : Provider.of<PaletteSettings>(
                                                    context)
                                                .currentSetting
                                                .red,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '#${value.pullModel!.number}',
                                style: TextStyle(
                                    color: Provider.of<PaletteSettings>(context)
                                        .currentSetting
                                        .faded3,
                                    fontSize: 14),
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
                                  const SizedBox(
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
                                            ? Provider.of<PaletteSettings>(
                                                    context)
                                                .currentSetting
                                                .green
                                            : value.pullModel!.merged!
                                                ? Colors.deepPurpleAccent
                                                : Provider.of<PaletteSettings>(
                                                        context)
                                                    .currentSetting
                                                    .red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '#${value.pullModel!.number}',
                                    style: TextStyle(
                                        color: Provider.of<PaletteSettings>(
                                                context)
                                            .currentSetting
                                            .faded3,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Icon(
                                    Octicons.comment,
                                    color: Provider.of<PaletteSettings>(context)
                                        .currentSetting
                                        .faded3,
                                    size: 11,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '${value.pullModel!.comments} comments',
                                    style: TextStyle(
                                        color: Provider.of<PaletteSettings>(
                                                context)
                                            .currentSetting
                                            .faded3,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                value.pullModel!.title!,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
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
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                value.pullModel!.state == IssueState.CLOSED
                                    ? 'By ${value.pullModel!.user!.login}, closed ${getDate(value.pullModel!.closedAt.toString(), shorten: false)}.'
                                    : 'Opened ${getDate(value.pullModel!.createdAt.toString(), shorten: false)} by ${value.pullModel!.user!.login}',
                                style: TextStyle(
                                    color: Provider.of<PaletteSettings>(context)
                                        .currentSetting
                                        .faded3,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        tabController: tabController,
                        tabViews: [
                          const PullInformation(),
                          Discussion(
                              scrollController: scrollController,
                              pullNodeID: value.pullModel!.nodeId,
                              number: value.pullModel!.number!,
                              owner: value.repoURL!
                                  .replaceFirst(
                                      'https://api.github.com/repos/', '')
                                  .split('/')
                                  .first,
                              repoName: value.repoURL!
                                  .replaceFirst(
                                      'https://api.github.com/repos/', '')
                                  .split('/')
                                  .last,
                              isPull: true,
                              commentsSince: widget.commentsSince,
                              isLocked: value.pullModel!.locked! &&
                                  !value.editingEnabled,
                              createdAt: value.pullModel!.createdAt,
                              issueUrl: value.pullModel!.issueUrl!,
                              initComment: BaseComment(
                                  isMinimized: false,
                                  reactions: null,
                                  onQuote: () {},
                                  viewerCanDelete: false,
                                  viewerCanMinimize: false,
                                  viewerCannotUpdateReasons: null,
                                  viewerCanReact: false,
                                  viewerCanUpdate: false,
                                  viewerDidAuthor: false,
                                  createdAt: value.pullModel!.createdAt!,
                                  author: Author(
                                      Uri.parse(
                                          value.pullModel!.user!.avatarUrl!),
                                      value.pullModel!.user!.login!),
                                  body: '',
                                  lastEditedAt: null,
                                  description:
                                      value.pullModel!.bodyHtml!.isEmpty
                                          ? 'No description provided.'
                                          : null,
                                  bodyHTML: value.pullModel!.bodyHtml!,
                                  authorAssociation:
                                      CommentAuthorAssociation.none)),
                          const PullsCommitsList(),
                          const PullChangedFilesList(),
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
        if (merged) {
          return Icon(
            Octicons.git_merge,
            color: Colors.deepPurpleAccent,
            size: size,
          );
        } else {
          return Icon(
            Octicons.git_pull_request,
            color: Provider.of<PaletteSettings>(context).currentSetting.red,
            size: size,
          );
        }
      case IssueState.OPEN:
        return Icon(
          Octicons.git_pull_request,
          color: Provider.of<PaletteSettings>(context).currentSetting.green,
          size: size,
        );
      default:
        return null;
    }
  }
}
