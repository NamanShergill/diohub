import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/misc/app_scroll_view.dart';
import 'package:dio_hub/common/misc/scaffold_body.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/graphql/graphql.dart' hide IssueState;
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/providers/issue_pulls/issue_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/view/issues_pulls/discussion.dart';
import 'package:dio_hub/view/issues_pulls/issue_information.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class IssueScreen extends StatefulWidget {
  final String? issueURL;
  final DateTime? commentsSince;
  final int initialIndex;
  const IssueScreen(this.issueURL,
      {this.initialIndex = 0, this.commentsSince, Key? key})
      : super(key: key);

  @override
  _IssueScreenState createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(
        length: 2, initialIndex: widget.initialIndex, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => IssueProvider(
            widget.issueURL,
            Provider.of<CurrentUserProvider>(context, listen: false)
                .currentUserInfo
                ?.login,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CommentProvider(),
        )
      ],
      builder: (context, child) {
        return SafeArea(
          child: Consumer<IssueProvider>(
            builder: (context, value, _) {
              return Scaffold(
                appBar: value.status != Status.loaded
                    ? AppBar(
                        elevation: 0,
                      )
                    : null,
                body: ScaffoldBody(
                  notificationController: value.notificationController,
                  child: ProviderLoadingProgressWrapper<IssueProvider>(
                    childBuilder: (context, value) {
                      return AppScrollView(
                        scrollController: scrollController,
                        childrenColor: AppColor.background,
                        scrollViewAppBar: ScrollViewAppBar(
                          tabController: tabController,
                          url: value.issueModel!.htmlUrl,
                          tabs: const [
                            'Information',
                            'Discussion',
                          ],
                          collapsedHeight: 120,
                          expandedHeight: 250,
                          appBarWidget: Row(
                            children: [
                              getIcon(value.issueModel!.state, 15)!,
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                value.issueModel!.state == IssueState.OPEN
                                    ? 'Open'
                                    : 'Closed',
                                style: TextStyle(
                                    color: value.issueModel!.state ==
                                            IssueState.OPEN
                                        ? AppColor.green
                                        : AppColor.red,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '#${value.issueModel!.number}',
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
                                  getIcon(value.issueModel!.state, 20)!,
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    value.issueModel!.state == IssueState.OPEN
                                        ? 'Open'
                                        : 'Closed',
                                    style: TextStyle(
                                        color: value.issueModel!.state ==
                                                IssueState.OPEN
                                            ? AppColor.green
                                            : AppColor.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '#${value.issueModel!.number}',
                                    style: TextStyle(
                                        color: AppColor.grey3, fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Icon(
                                    Octicons.comment,
                                    color: AppColor.grey3,
                                    size: 11,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '${value.issueModel!.comments} comments',
                                    style: TextStyle(
                                        color: AppColor.grey3, fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                value.issueModel!.title!,
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
                                            repositoryURL: value
                                                .issueModel!.repositoryUrl));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      value.issueModel!.repositoryUrl!
                                          .replaceFirst(
                                              'https://api.github.com/repos/',
                                              ''),
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                value.issueModel!.state == IssueState.CLOSED
                                    ? 'By ${value.issueModel!.user!.login}, closed ${getDate(value.issueModel!.closedAt.toString(), shorten: false)}.'
                                    : 'Opened ${getDate(value.issueModel!.createdAt.toString(), shorten: false)} by ${value.issueModel!.user!.login}',
                                style: TextStyle(
                                    color: AppColor.grey3, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        tabController: tabController,
                        tabViews: [
                          IssueInformation(),
                          Discussion(
                              commentsSince: widget.commentsSince,
                              number: value.issueModel!.number!,
                              owner: value.issueModel!.repositoryUrl!
                                  .replaceFirst(
                                      'https://api.github.com/repos/', '')
                                  .split('/')
                                  .first,
                              repoName: value.issueModel!.repositoryUrl!
                                  .replaceFirst(
                                      'https://api.github.com/repos/', '')
                                  .split('/')
                                  .last,
                              isPull: false,
                              isLocked: value.issueModel!.locked! &&
                                  !value.editingEnabled,
                              scrollController: scrollController,
                              createdAt: value.issueModel!.createdAt!,
                              issueUrl: value.issueModel!.url!,
                              initComment: BaseComment(
                                  isMinimized: false,
                                  reactions: null,
                                  viewerCanDelete: false,
                                  viewerCanMinimize: false,
                                  onQuote: () {},
                                  viewerCannotUpdateReasons: null,
                                  viewerCanReact: false,
                                  viewerCanUpdate: false,
                                  viewerDidAuthor: false,
                                  createdAt: value.issueModel!.createdAt!,
                                  author: Author(
                                      Uri.parse(
                                          value.issueModel!.user!.avatarUrl!),
                                      value.issueModel!.user!.login!),
                                  body: '',
                                  description:
                                      value.issueModel!.bodyHtml!.isEmpty
                                          ? 'No description provided.'
                                          : null,
                                  lastEditedAt: null,
                                  bodyHTML: value.issueModel!.bodyHtml!,
                                  authorAssociation:
                                      CommentAuthorAssociation.none)),
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

  Widget? getIcon(IssueState? state, double size) {
    switch (state) {
      case IssueState.CLOSED:
        return Icon(
          Octicons.issue_closed,
          color: Colors.red,
          size: size,
        );
      case IssueState.OPEN:
        return Icon(
          Octicons.issue_opened,
          color: Colors.green,
          size: size,
        );
      default:
        return null;
    }
  }
}

class Author implements ActorMixin {
  @override
  Uri avatarUrl;

  @override
  String login;
  Author(this.avatarUrl, this.login);
}
