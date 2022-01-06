import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
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
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/view/issues_pulls/discussion.dart';
import 'package:dio_hub/view/issues_pulls/issue_information.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class IssueScreen extends StatefulWidget {
  const IssueScreen(this.issueURL,
      {this.initialIndex = 0, this.commentsSince, Key? key})
      : super(key: key);
  final String issueURL;
  final DateTime? commentsSince;
  final int initialIndex;

  @override
  _IssueScreenState createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
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
                .data
                .login!,
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
                  child: ProviderLoadingProgressWrapper<IssueProvider>(
                    childBuilder: (context, value) {
                      return AppScrollView(
                        nestedScrollViewController: scrollController,
                        childrenColor: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .primary,
                        scrollViewAppBar: ScrollViewAppBar(
                          tabController: tabController,
                          url: value.data.htmlUrl,
                          tabs: const [
                            'Information',
                            'Discussion',
                          ],
                          collapsedHeight: 120,
                          expandedHeight: 250,
                          appBarWidget: Row(
                            children: [
                              getIcon(value.data.state, 15)!,
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                value.data.state == IssueState.OPEN
                                    ? 'Open'
                                    : 'Closed',
                                style: TextStyle(
                                    color: value.data.state == IssueState.OPEN
                                        ? Provider.of<PaletteSettings>(context)
                                            .currentSetting
                                            .green
                                        : Provider.of<PaletteSettings>(context)
                                            .currentSetting
                                            .red,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '#${value.data.number}',
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
                                  getIcon(value.data.state, 20)!,
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    value.data.state == IssueState.OPEN
                                        ? 'Open'
                                        : 'Closed',
                                    style: TextStyle(
                                        color:
                                            value.data.state == IssueState.OPEN
                                                ? Provider.of<PaletteSettings>(
                                                        context)
                                                    .currentSetting
                                                    .green
                                                : Provider.of<PaletteSettings>(
                                                        context)
                                                    .currentSetting
                                                    .red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '#${value.data.number}',
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
                                    '${value.data.comments} comments',
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
                                value.data.title!,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: medBorderRadius,
                                  onTap: () {
                                    AutoRouter.of(context).push(
                                        RepositoryScreenRoute(
                                            repositoryURL:
                                                value.data.repositoryUrl!));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      value.data.repositoryUrl!.replaceFirst(
                                          'https://api.github.com/repos/', ''),
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                value.data.state == IssueState.CLOSED
                                    ? 'By ${value.data.user!.login}, closed ${getDate(value.data.closedAt.toString(), shorten: false)}.'
                                    : 'Opened ${getDate(value.data.createdAt.toString(), shorten: false)} by ${value.data.user!.login}',
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
                          IssueInformation(),
                          Discussion(
                              commentsSince: widget.commentsSince,
                              number: value.data.number!,
                              owner: value.data.repositoryUrl!
                                  .replaceFirst(
                                      'https://api.github.com/repos/', '')
                                  .split('/')
                                  .first,
                              repoName: value.data.repositoryUrl!
                                  .replaceFirst(
                                      'https://api.github.com/repos/', '')
                                  .split('/')
                                  .last,
                              isPull: false,
                              isLocked:
                                  value.data.locked! && !value.editingEnabled,
                              nestedScrollViewController: scrollController,
                              createdAt: value.data.createdAt!,
                              issueUrl: value.data.url!,
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
                                  createdAt: value.data.createdAt!,
                                  author: Author(
                                      Uri.parse(value.data.user!.avatarUrl!),
                                      value.data.user!.login!),
                                  body: '',
                                  description:
                                      value.data.bodyHtml?.isNotEmpty == true
                                          ? null
                                          : 'No description provided.',
                                  lastEditedAt: null,
                                  bodyHTML: value.data.bodyHtml,
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
  Author(this.avatarUrl, this.login);
  @override
  Uri avatarUrl;

  @override
  String login;
}
