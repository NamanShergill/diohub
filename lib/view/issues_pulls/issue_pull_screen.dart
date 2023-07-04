import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/scale_expanded_widget.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
import 'package:dio_hub/common/issues/issue_label.dart';
import 'package:dio_hub/common/misc/app_bar.dart';
import 'package:dio_hub/common/misc/deep_link_widget.dart';
import 'package:dio_hub/common/misc/editable_text.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/markdown_body.dart';
import 'package:dio_hub/common/misc/nested_scroll.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/misc/reaction_bar.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/common/wrappers/dynamic_tabs_parent.dart';
import 'package:dio_hub/common/wrappers/editing_wrapper.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/main.dart';
import 'package:dio_hub/providers/issue_pulls/issue_provider.dart';
import 'package:dio_hub/routes/router.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/conditional_quanitity_value.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/utils/markdown_to_html.dart';
import 'package:dio_hub/utils/rich_text.dart';
import 'package:dio_hub/view/issues_pulls/issue_screen.dart';
import 'package:dio_hub/view/issues_pulls/pull_screen.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_tabs/flutter_dynamic_tabs.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_stack/image_stack.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

IssuePullScreenRoute issuePullScreenRoute(PathData path) {
  return getRoute<IssuePullScreenRoute>(
    path,
    onDeepLink: (path) {
      return IssuePullScreenRoute(
        ownerName: path.component(0)!,
        repoName: path.component(1)!,
        number: int.parse(path.component(3)!),
      );
    },
    onAPILink: (path) {
      return IssuePullScreenRoute(
        ownerName: path.component(1)!,
        repoName: path.component(2)!,
        number: int.parse(path.component(4)!),
      );
    },
  );
}

class IssuePullScreen extends DeepLinkWidget {
  const IssuePullScreen(
      {required this.number,
      required this.repoName,
      required this.ownerName,
      Key? key,
      this.commentsSince,
      this.initialIndex = 0})
      : super(key: key);

  final DateTime? commentsSince;
  final int initialIndex;
  final int number;
  final String ownerName;
  final String repoName;

  @override
  State<IssuePullScreen> createState() => _IssuePullScreenState();
}

class _IssuePullScreenState extends DeepLinkWidgetState<IssuePullScreen> {
  final APIWrapperController<IssuePullInfo$Query$Repository$IssueOrPullRequest>
      apiWrapperController =
      APIWrapperController<IssuePullInfo$Query$Repository$IssueOrPullRequest>();

  @override
  void handleDeepLink(PathData deepLinkData) {
    // TODO: implement handleDeepLink
  }

  @override
  Widget build(BuildContext context) {
    return APIWrapper<IssuePullInfo$Query$Repository$IssueOrPullRequest>(
      apiCall: (refresh) => IssuesService.getIssuePullInfo(widget.number,
          repo: widget.repoName, user: widget.ownerName, refresh: refresh),
      apiWrapperController: apiWrapperController,
      loadingBuilder: (context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: const LoadingIndicator(),
      ),
      responseBuilder: (context, data) {
        if (data is IssueInfoMixin) {
          return ChangeNotifierProvider(
            create: (context) => IssueProvider(data as IssueInfoMixin),
            lazy: false,
            builder: (context, child) => IssueScreen(
              data as IssueInfoMixin,
              apiWrapperController: apiWrapperController,
            ),
          );
        } else if (data is PullInfoMixin) {
          return PullScreen(data as PullInfoMixin);
        } else {
          return Container();
        }
      },
    );
  }
}

class IssuePullInfoTemplate extends StatefulWidget {
  const IssuePullInfoTemplate({
    Key? key,
    required this.number,
    required this.title,
    required this.repoInfo,
    required this.state,
    required this.bodyHTML,
    required this.labels,
    required this.createdAt,
    required this.createdBy,
    required this.apiWrapperController,
    required this.body,
    required this.commentCount,
    required this.reactionGroups,
    required this.viewerCanReact,
    required this.assigneesInfo,
    this.dynamicTabs = const [],
    required this.participantsInfo,
    required this.isPinned,
  }) : super(key: key);

  final APIWrapperController apiWrapperController;
  final AssigneeInfoMixin assigneesInfo;
  final String body;
  final String bodyHTML;
  final int commentCount;
  final DateTime createdAt;
  final ActorMixin? createdBy;
  final List<DynamicTab> dynamicTabs;
  final List<LabelMixin?> labels;
  final int number;
  final List<ReactionGroupsMixin> reactionGroups;
  final RepoInfoMixin repoInfo;
  final IssuePullState state;
  final String title;
  final bool viewerCanReact;
  final ParticipantsInfo participantsInfo;
  final bool isPinned;

  @override
  State<IssuePullInfoTemplate> createState() => _IssuePullInfoTemplateState();
}

class _IssuePullInfoTemplateState extends State<IssuePullInfoTemplate> {
  late EditingController assigneeEditingController;
  late EditingController<String> descEditingController;
  final DynamicTabsController dynamicTabsController = DynamicTabsController();
  late EditingController<List<LabelMixin?>> labelsEditingController;
  // final ScrollController scrollController = ScrollController();
  // final ScrollController scrollController2 = ScrollController();
  late EditingController<String> titleEditingController;

  @override
  void initState() {
    titleEditingController = EditingController<String>(widget.title);
    labelsEditingController = EditingController<List<LabelMixin?>>(
      widget.labels,
      onEditTap: () {},
    );
    descEditingController = EditingController<String>(
      widget.body,
      onEditTap: () {},
    );
    assigneeEditingController = EditingController(
      widget.body,
      onEditTap: () {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicTabsParent(
      controller: dynamicTabsController,
      tabs: List.from(widget.dynamicTabs)
        ..addAll(
          [
            DynamicTab(
              identifier: 'About',
              isDismissible: false,
              tabViewBuilder: (context) => _AboutTab(
                widget: widget,
                descEditingController: descEditingController,
                assigneeEditingController: assigneeEditingController,
                dynamicTabsController: dynamicTabsController,
              ),
            ),
            DynamicTab(
              identifier: 'Conversation',
              keepViewAlive: true,
              tabViewBuilder: (context) => Discussion(
                number: widget.number,
                isLocked: false,
                createdAt: widget.createdAt,
                owner: widget.repoInfo.owner.login,
                repoName: widget.repoInfo.name,
                initComment: BaseComment(
                    onQuote: () {},
                    isMinimized: false,
                    reactions: widget.reactionGroups,
                    viewerCanDelete: false,
                    viewerCanMinimize: false,
                    viewerCannotUpdateReasons: null,
                    viewerCanReact: widget.viewerCanReact,
                    viewerCanUpdate: false,
                    viewerDidAuthor: false,
                    createdAt: widget.createdAt,
                    author: widget.createdBy,
                    body: widget.body,
                    lastEditedAt: null,
                    bodyHTML: widget.bodyHTML,
                    authorAssociation: CommentAuthorAssociation.none),
                issueUrl: '',
                isPull: false,
                // nestedScrollViewController: scrollController,
              ),
            )
          ],
        ),
      builder: (context, tabBar, tabView) => EditingWrapper(
        onSave: () {},
        editingControllers: [
          titleEditingController,
          labelsEditingController,
          descEditingController,
          assigneeEditingController,
        ],
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: RefreshIndicator(
            onRefresh: () => Future.sync(
              () => widget.apiWrapperController.refresh(),
            ),
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: NestedScroll(
              header: (context, value) => [
                SliverToBoxAdapter(
                  child: _ScreenHeader(
                      widget: widget,
                      titleEditingController: titleEditingController,
                      labelsEditingController: labelsEditingController),
                ),
                SliverPinnedHeader(
                  child: SizeExpandedSection(
                    expand: dynamicTabsController.activeLength > 1,
                    child: buildTabsView(tabBar),
                  ),
                )
              ],
              body: tabView,
            ),
          ),
        ),
      ),
    );
  }

  DHAppBar buildAppBar(BuildContext context) {
    return DHAppBar(
      hasEditableChildren: true,
      title: Row(
        children: [
          widget.state.icon(),
          // const SizedBox(
          //   width: 8,
          // ),
          Expanded(
            child: richText(
              [
                TextSpan(text: ' #${widget.number} '),
                TextSpan(
                  text: widget.repoInfo.name,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: context.palette.faded3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildTabsView(PreferredSizeWidget tabBar) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        tabBar,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            height: 0,
          ),
        ),
        // const SizedBox(
        //   height: 8,
        // ),
      ],
    );
  }
}

class _AboutTab extends StatelessWidget {
  const _AboutTab({
    Key? key,
    required this.widget,
    required this.descEditingController,
    required this.dynamicTabsController,
    required this.assigneeEditingController,
  }) : super(key: key);

  final IssuePullInfoTemplate widget;
  final EditingController<String> descEditingController;
  final DynamicTabsController dynamicTabsController;
  final EditingController assigneeEditingController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Card(
                color: widget.state.color,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.state.icon(
                        color: context.palette.elementsOnColors,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(widget.state.text),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              if (widget.createdBy != null)
                ProfileTile.login(
                  avatarUrl: widget.createdBy!.avatarUrl.toString(),
                  userLogin: widget.createdBy!.login,
                  size: 16,
                ),
              Text(
                getDate(widget.createdAt.toString(), shorten: false),
                style: TextStyle(color: context.palette.faded3),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: medBorderRadius),
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                ReactionBar(
                  widget.reactionGroups,
                  viewerCanReact: widget.viewerCanReact,
                ),
                EditWidget<String>(
                  editingController: descEditingController,
                  builder: (context, newValue, tools, currentlyEditing, state) {
                    return Row(
                      children: [
                        if (widget.bodyHTML.isNotEmpty)
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: widget.body.length > 400
                                  ? ExpandChild(
                                      indicatorCollapsedHint: 'Description',
                                      expandIndicatorStyle:
                                          ExpandIndicatorStyle.both,
                                      indicatorIcon:
                                          Icons.arrow_drop_down_rounded,
                                      // hintTextStyle: TextStyle(
                                      //     color: faded3(context)),
                                      child: MarkdownBody(widget.bodyHTML),
                                    )
                                  : MarkdownBody(widget.bodyHTML),
                            ),
                          ),
                        ScaleSwitch(
                          child: widget.bodyHTML.isEmpty &&
                                  state == EditingState.editMode
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    'No Description',
                                    style: TextStyle(
                                        color: context.palette.faded3,
                                        fontStyle: FontStyle.italic),
                                  ),
                                )
                              : Container(),
                        ),
                        tools,
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Material(
                  color: context.palette.accent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: medBorderRadius.bottomLeft,
                      bottomRight: medBorderRadius.bottomRight),
                  child: InkWell(
                    onTap: () {
                      dynamicTabsController.openTab('Conversation');
                    },
                    borderRadius: BorderRadius.only(
                        bottomLeft: medBorderRadius.bottomLeft,
                        bottomRight: medBorderRadius.bottomRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: medBorderRadius.bottomLeft,
                            bottomRight: medBorderRadius.bottomRight),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Octicons.comment_discussion,
                                    size: 15,
                                  ),
                                ),
                                Text(
                                  '${widget.commentCount} replies',
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_right_rounded,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          WrappedCollection(
            children: [
              InfoCard(
                // icon: widget.state.icon(color: context.palette.faded3),
                onTap: () {
                  context.router.push(
                      RepositoryScreenRoute(repositoryURL: 'repositoryURL'));
                },
                title: '#${widget.number}',
                titleTextStyle: TextStyle(
                  color: context.palette.faded3,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileTile.avatar(
                      avatarUrl: widget.repoInfo.owner.avatarUrl.toString(),
                      size: 16,
                      padding: const EdgeInsets.all(8),
                    ),
                    Flexible(
                      child: Text(
                          '${widget.repoInfo.owner.login}/${widget.repoInfo.name}'),
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: 100,
              //   height: 30,
              //   color: Colors.red,
              // ),
              EditWidget(
                editingController: assigneeEditingController,
                builder:
                    (context, newValue, tools, currentlyEditing, currentState) {
                  final assignees = widget.assigneesInfo.edges ?? [];
                  return MinRowEditWidget(
                    tools: tools,
                    child: InfoCard(
                      title: assignees.valuesOnLengthBasic(
                        onNoItems: () => 'Assignees',
                        onOneItem: (item) => 'Assignee',
                        defaultValue: (items) => '${items.length} Assignees',
                      ),
                      trailingIcon: assignees.valuesOnLengthBasic(
                        onNoItems: () => null,
                        onOneItem: (item) => null,
                        defaultValue: (items) => const Icon(
                          Icons.arrow_drop_down_rounded,
                        ),
                      ),
                      onTap: assignees.valuesOnLengthBasic(
                        onNoItems: () => null,
                        onOneItem: (item) => () {
                          navigateToProfile(
                            login: item!.node!.login,
                            context: context,
                          );
                        },
                        defaultValue: (items) => () {
                          Future<List<AssigneeUserListMixin$Assignees$Edges?>>
                              getAssignees(String? cursor) => context
                                  .issueProvider(listen: false)
                                  .getAssignees(after: cursor);
                          showScrollableBottomSheet(
                            context,
                            headerBuilder: (context, setState) =>
                                const BottomSheetHeaderText(
                              headerText: 'Assignees',
                            ),
                            scrollableBodyBuilder:
                                (context, setState, scrollController) =>
                                    InfiniteScrollWrapper<
                                        AssigneeUserListMixin$Assignees$Edges?>(
                              future:
                                  (pageNumber, pageSize, refresh, lastItem) =>
                                      getAssignees(lastItem?.cursor),
                              scrollController: scrollController,
                              builder: (context, item, index, refresh) {
                                final node = item!.node!;
                                return ProfileTile.login(
                                  avatarUrl: node.avatarUrl.toString(),
                                  userLogin: node.login,
                                );
                              },
                            ),
                          );
                        },
                      ),
                      child: assignees.valuesOnLengthBasic<Widget>(
                        onNoItems: () => const Text('None'),
                        onOneItem: (item) => ProfileTile.login(
                          avatarUrl: item!.node!.avatarUrl.toString(),
                          userLogin: item.node!.login,
                          disableTap: true,
                        ),
                        defaultValue: (items) => ImageStack.widgets(
                          totalCount: items.length,
                          backgroundColor: context.palette.secondary,
                          widgetBorderColor: context.palette.secondary,
                          // extraCountBorderColor: faded2(context),
                          widgetCount: 3,
                          extraCountTextStyle: TextStyle(
                            color: context.palette.faded3,
                          ),
                          widgetBorderWidth: 2,
                          widgetRadius: 29,
                          children: items
                              .map(
                                (e) => ProfileTile.avatar(
                                  avatarUrl: e!.node!.avatarUrl.toString(),
                                  padding: EdgeInsets.zero,
                                  size: 25,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
              InfoCard(
                title: 'Participants',
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageStack.widgets(
                      totalCount: widget.participantsInfo.count,
                      backgroundColor: context.palette.secondary,
                      widgetBorderColor: context.palette.secondary,
                      widgetCount: 3,
                      extraCountTextStyle: TextStyle(
                        color: context.palette.faded3,
                      ),
                      widgetBorderWidth: 2,
                      widgetRadius: 29,
                      children: widget.participantsInfo.avatarURLs
                          .map(
                            (e) => ProfileTile.avatar(
                              avatarUrl: e,
                              padding: EdgeInsets.zero,
                              size: 25,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                onTap: () {
                  // showScrollableBottomSheet(
                  //   context,
                  //   headerBuilder: (context, setState) =>
                  //       const BottomSheetHeaderText(
                  //     headerText: 'Assignees',
                  //   ),
                  //   scrollableBodyBuilder:
                  //       (context, setState, scrollController) =>
                  //           InfiniteScrollWrapper<
                  //               AssigneeUserListMixin$Assignees$Edges?>(
                  //     future: (pageNumber, pageSize, refresh, lastItem) =>
                  //         getAssignees(lastItem?.cursor),
                  //     scrollController: scrollController,
                  //     builder: (context, item, index, refresh) {
                  //       final node = item!.node!;
                  //       return ProfileTile.login(
                  //         avatarUrl: node.avatarUrl.toString(),
                  //         userLogin: node.login,
                  //       );
                  //     },
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScreenHeader extends StatelessWidget {
  const _ScreenHeader({
    Key? key,
    required this.widget,
    required this.titleEditingController,
    required this.labelsEditingController,
  }) : super(key: key);

  final IssuePullInfoTemplate widget;

  final EditingController<String> titleEditingController;
  final EditingController<List<LabelMixin?>> labelsEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              if (widget.isPinned)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Octicons.pin,
                        size: 15,
                        color: context.palette.faded3,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Pinned',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.palette.faded3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              EditableTextItem(
                titleEditingController,
                builder: (context, newValue) => MarkdownBody(
                  newValue != null ? mdToHtml(newValue) : widget.title,
                  defaultBodyStyle: Style(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      fontSize: FontSize(
                        context.textTheme.headline5!.fontSize!,
                      ),
                      fontWeight: context.textTheme.headline5?.fontWeight),
                ),
              ),
              buildLabelsWidget(),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                height: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  EditWidget<Object> buildLabelsWidget() {
    return EditWidget(
      editingController: labelsEditingController,
      builder: (context, newValue, tools, currentlyEditing, state) {
        if (widget.labels.isNotEmpty == true) {
          return Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              children: [
                Flexible(
                  child: Wrap(
                    children: widget.labels
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(4),
                            child: IssueLabel.gql(e!),
                          ),
                        )
                        .toList(),
                  ),
                ),
                tools,
              ],
            ),
          );
        } else {
          return Row(
            children: [
              ScaleSwitch(
                child: state == EditingState.editMode
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'No labels',
                          style: TextStyle(
                            color: context.palette.faded3,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    : Container(),
              ),
              tools,
            ],
          );
        }
      },
    );
  }
}

class IssuePullState {
  IssuePullState(this.state, {this.isDraft = false})
      : assert(state is PullRequestState || state is IssueState,
            'Not a valid state!');

  final bool isDraft;
  final dynamic state;

  Icon icon({
    double size = 16,
    Color? color,
  }) =>
      Icon(
        iconData,
        size: size,
        color: color ?? this.color,
      );

  IconData get iconData {
    if (state == IssueState.open) {
      return Octicons.issue_opened;
    } else if (state == IssueState.closed) {
      return Octicons.issue_closed;
    } else if (state == PullRequestState.open ||
        state == PullRequestState.closed) {
      return Octicons.git_pull_request;
    } else if (state == PullRequestState.merged) {
      return Octicons.git_merge;
    } else {
      throw UnimplementedError();
    }
  }

  Color get color {
    if (state == IssueState.closed || state == PullRequestState.closed) {
      return Colors.red;
    } else if (isDraft) {
      return Colors.grey;
    } else if (state == IssueState.open || state == PullRequestState.open) {
      return Colors.green;
    } else if (state == PullRequestState.merged) {
      return Colors.deepPurple;
    } else {
      throw UnimplementedError();
    }
  }

  String get text {
    if (state == IssueState.closed || state == PullRequestState.closed) {
      return 'Closed';
    } else if (isDraft) {
      return 'Draft';
    } else if (state == IssueState.open || state == PullRequestState.open) {
      return 'Open';
    } else if (state == PullRequestState.merged) {
      return 'Merged';
    } else {
      throw UnimplementedError();
    }
  }
}

class ParticipantsInfo {
  ParticipantsInfo({
    required this.count,
    required this.avatarURLs,
  });
  final int count;
  final List<String> avatarURLs;
}
