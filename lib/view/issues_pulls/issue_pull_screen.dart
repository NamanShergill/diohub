import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/animations/scale_expanded_widget.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
import 'package:dio_hub/common/issues/issue_label.dart';
import 'package:dio_hub/common/markdown_view/markdown_body.dart';
import 'package:dio_hub/common/misc/app_bar.dart';
import 'package:dio_hub/common/misc/deep_link_widget.dart';
import 'package:dio_hub/common/misc/editable_text.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/misc/reaction_bar.dart';
import 'package:dio_hub/common/misc/scroll_scaffold.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/common/wrappers/dynamic_tabs_parent.dart';
import 'package:dio_hub/common/wrappers/editing_wrapper.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/providers/issue_pulls/issue_provider.dart';
import 'package:dio_hub/providers/issue_pulls/pull_provider.dart';
import 'package:dio_hub/routes/router.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/utils/markdown_to_html.dart';
import 'package:dio_hub/utils/rich_text.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:dio_hub/view/issues_pulls/issue_screen.dart';
import 'package:dio_hub/view/issues_pulls/pull_screen.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:dio_hub/view/repository/repository_screen.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_tabs/flutter_dynamic_tabs.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_stack/image_stack.dart';
import 'package:provider/provider.dart';

IssuePullRoute issuePullScreenRoute(final PathData path) =>
    getRoute<IssuePullRoute>(
      path,
      onDeepLink: (final PathData path) => IssuePullRoute(
        ownerName: path.component(0)!,
        repoName: path.component(1)!,
        number: int.parse(path.component(3)!),
      ),
      onAPILink: (final PathData path) => IssuePullRoute(
        ownerName: path.component(1)!,
        repoName: path.component(2)!,
        number: int.parse(path.component(4)!),
      ),
    );

@RoutePage()
class IssuePullScreen extends DeepLinkWidget {
  const IssuePullScreen({
    required this.number,
    required this.repoName,
    required this.ownerName,
    super.key,
    this.commentsSince,
    this.initialIndex = 0,
  });

  final DateTime? commentsSince;
  final int initialIndex;
  final int number;
  final String ownerName;
  final String repoName;

  @override
  State<IssuePullScreen> createState() => _IssuePullScreenState();
}

class _IssuePullScreenState extends DeepLinkWidgetState<IssuePullScreen> {
  final GlobalKey<
          APIWrapperState<IssuePullInfo$Query$Repository$IssueOrPullRequest>>
      key = GlobalKey<
          APIWrapperState<IssuePullInfo$Query$Repository$IssueOrPullRequest>>();

  @override
  void handleDeepLink(final PathData deepLinkData) {
    // TODO(namanshergill): implement handleDeepLink
  }

  @override
  Widget build(final BuildContext context) =>
      APIWrapper<IssuePullInfo$Query$Repository$IssueOrPullRequest>.deferred(
        apiCall: ({required final bool refresh}) async =>
            IssuesService.getIssuePullInfo(
          widget.number,
          repo: widget.repoName,
          user: widget.ownerName,
          refresh: refresh,
        ),
        key: key,
        loadingBuilder: (final BuildContext context) => Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: const LoadingIndicator(),
        ),
        builder: (
          final BuildContext context,
          final IssuePullInfo$Query$Repository$IssueOrPullRequest data,
        ) {
          if (data is IssueInfoMixin) {
            return ChangeNotifierProvider<IssueProvider>(
              create: (final BuildContext context) =>
                  IssueProvider(data as IssueInfoMixin),
              lazy: false,
              builder: (final BuildContext context, final Widget? child) =>
                  IssueScreen(
                data as IssueInfoMixin,
                apiWrapperKey: key,
              ),
            );
          } else if (data is PullInfoMixin) {
            return ChangeNotifierProvider<PullProvider>(
              create: (final BuildContext context) =>
                  PullProvider(data as PullInfoMixin),
              lazy: false,
              builder: (final BuildContext context, final Widget? child) =>
                  PullScreen(
                data as PullInfoMixin,
                // apiWrapperController: apiWrapperController,
              ),
            );
          } else {
            return Container();
          }
        },
      );
}

class IssuePullInfoTemplate extends StatefulWidget {
  const IssuePullInfoTemplate({
    required this.number,
    required this.title,
    required this.repoInfo,
    required this.state,
    required this.bodyHTML,
    required this.labels,
    required this.createdAt,
    required this.createdBy,
    required this.apiWrapperKey,
    required this.body,
    required this.commentCount,
    required this.reactionGroups,
    required this.viewerCanReact,
    required this.assigneesInfo,
    required this.participantsInfo,
    required this.isPinned,
    required this.uri,
    super.key,
    this.dynamicTabs = const <DynamicTab>[],
  });

  final GlobalKey<
          APIWrapperState<IssuePullInfo$Query$Repository$IssueOrPullRequest>>
      apiWrapperKey;
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
  final Uri uri;
  final bool viewerCanReact;
  final UnfinishedList<ActorMixin> participantsInfo;
  final bool isPinned;

  @override
  State<IssuePullInfoTemplate> createState() => _IssuePullInfoTemplateState();
}

class _IssuePullInfoTemplateState extends State<IssuePullInfoTemplate> {
  late EditingController<Object> assigneeEditingController;
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
      onEditTap: (final BuildContext context) => null,
    );
    descEditingController = EditingController<String>(
      widget.body,
      onEditTap: (final BuildContext context) => null,
    );
    assigneeEditingController = EditingController<Object>(
      widget.assigneesInfo,
      onEditTap: (final BuildContext context) => null,
    );
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: DynamicTabsParent(
        controller: dynamicTabsController,
        tabBuilder: (final BuildContext context, final DynamicTab tab) =>
            buildDynamicTabMenuButton(
          tab: tab,
          tabController: dynamicTabsController,
        ),
        tabs: List<DynamicTab>.from(widget.dynamicTabs)
          ..addAll(
            <DynamicTab>[
              DynamicTab(
                identifier: 'About',
                isDismissible: false,
                tabViewBuilder: (final BuildContext context) => _AboutTab(
                  widget: widget,
                  descEditingController: descEditingController,
                  assigneeEditingController: assigneeEditingController,
                  dynamicTabsController: dynamicTabsController,
                ),
              ),
              DynamicTab(
                identifier: 'Conversation',
                keepViewAlive: true,
                tabViewBuilder: (final BuildContext context) =>
                    ChangeNotifierProvider<CommentProvider>(
                  create: (final _) => CommentProvider(),
                  builder: (final BuildContext context, final Widget? child) =>
                      Discussion(
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
                      authorAssociation: CommentAuthorAssociation.none,
                    ),
                    issueUrl: widget.uri,
                    isPull: false,
                    // nestedScrollViewController: scrollController,
                  ),
                ),
              ),
            ],
          ),
        builder: (
          final BuildContext context,
          final PreferredSizeWidget tabBar,
          final Widget tabView,
        ) =>
            EditingWrapper(
          onSave: () {},
          editingControllers: <EditingController<dynamic>>[
            titleEditingController,
            labelsEditingController,
            descEditingController,
            assigneeEditingController,
          ],
          builder: (final BuildContext context) => ScrollScaffold(
            subHeader: SizeExpandedSection(
              expand: dynamicTabsController.activeLength > 1,
              child: buildTabsView(tabBar),
            ),
            appBar: buildAppBar(context),
            wrapperBuilder: (final BuildContext context, final Widget child) =>
                RefreshIndicator(
              child: child,
              onRefresh: () => Future<void>.sync(
                () async => widget.apiWrapperKey.currentState?.refreshData(),
              ),
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
            ),
            header: _ScreenHeader(
              widget: widget,
              titleEditingController: titleEditingController,
              labelsEditingController: labelsEditingController,
            ),
            body: tabView,
          ),
        ),
      ),
    );
  }

  DHAppBar buildAppBar(final BuildContext context) => DHAppBar(
        hasEditableChildren: true,
        title: Row(
          children: <Widget>[
            widget.state.icon(),
            // const SizedBox(
            //   width: 8,
            // ),
            Expanded(
              child: richText(
                <TextSpan>[
                  TextSpan(text: ' #${widget.number} '),
                  TextSpan(
                    text: widget.repoInfo.name,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      // color: context.palette.faded3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Column buildTabsView(final PreferredSizeWidget tabBar) => Column(
        children: <Widget>[
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tabBar,
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          // const SizedBox(
          //   height: 8,
          // ),
        ],
      );
}

class _AboutTab extends StatelessWidget {
  const _AboutTab({
    required this.widget,
    required this.descEditingController,
    required this.dynamicTabsController,
    required this.assigneeEditingController,
  });

  final IssuePullInfoTemplate widget;
  final EditingController<String> descEditingController;
  final DynamicTabsController dynamicTabsController;
  final EditingController<Object> assigneeEditingController;

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 12,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Card(
                  color: widget.state.color,
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        widget.state.icon(
                            // color: context.palette.elementsOnColors,
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
                  // style: TextStyle(color: context.palette.faded3),
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
                children: <Widget>[
                  const SizedBox(
                    height: 4,
                  ),
                  ReactionBar(
                    widget.reactionGroups,
                    viewerCanReact: widget.viewerCanReact,
                  ),
                  EditWidget<String>(
                    editingController: descEditingController,
                    builder: (final BuildContext context,
                            final EditingData<String> data) =>
                        Row(
                      children: <Widget>[
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
                                  data.currentState == EditingState.editMode
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    'No Description',
                                    style: TextStyle(
                                      // color: context.palette.faded3,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                        data.tools,
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Material(
                    color: context.colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: medBorderRadius.bottomLeft,
                      bottomRight: medBorderRadius.bottomRight,
                    ),
                    child: InkWell(
                      onTap: () {
                        dynamicTabsController.openTab('Conversation');
                      },
                      borderRadius: BorderRadius.only(
                        bottomLeft: medBorderRadius.bottomLeft,
                        bottomRight: medBorderRadius.bottomRight,
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: medBorderRadius.bottomLeft,
                            bottomRight: medBorderRadius.bottomRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Icon(
                                      Octicons.comment_discussion,
                                      size: 15,
                                      color: context.colorScheme.onPrimary,
                                    ),
                                  ),
                                  Text(
                                    '${widget.commentCount} replies',
                                    style:
                                        context.textTheme.labelSmall?.copyWith(
                                      color: context.colorScheme.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_right_rounded,
                                color: context.colorScheme.onPrimary,
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
              children: <Widget>[
                InfoCard(
                  // icon: widget.state.icon(color: context.palette.faded3),
                  onTap: () async {
                    await context.router
                        .push(RepositoryRoute(repositoryURL: 'repositoryURL'));
                  },
                  leading: InfoCard.leadingIcon(
                    icon: Octicons.repo,
                    context: context,
                  ),
                  title: '${widget.number}',

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ProfileTile.avatar(
                        avatarUrl: widget.repoInfo.owner.avatarUrl.toString(),
                        size: 16,
                      ),
                      Flexible(
                        child: Text(
                          '${widget.repoInfo.owner.login}/${widget.repoInfo.name}',
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: 100,
                //   height: 30,
                //   color: red,
                // ),

                EditWidget<Object>(
                  editingController: assigneeEditingController,
                  builder: (
                    final BuildContext context,
                    final EditingData<Object> data,
                  ) {
                    final List<AssigneeInfoMixin$Edges?> assignees =
                        widget.assigneesInfo.edges ??
                            <AssigneeInfoMixin$Edges?>[];
                    return _AssigneeInfoCard(
                      onTap: data.editModeActive
                          ? () async =>
                              data.editingController.edit.call(context)
                          : null,
                      trailing: data.editModeActive ? data.tools : null,
                      availableList: UnfinishedList<ActorMixin>(
                        limitedAvailableList: assignees
                            .map(
                              (final AssigneeInfoMixin$Edges? e) => e!.node!,
                            )
                            .toList(),
                      ),
                      titleBuilder: (
                        final UnfinishedList<ActorMixin> availableList,
                      ) =>
                          switch (availableList.totalCount) {
                        1 => 'Assignee',
                        _ => 'Assignees',
                      },
                      fetchActorsList: (
                        final ({
                          NodeWithPaginationInfo<ActorMixin>? lastItem,
                          int pageNumber,
                          int pageSize,
                          bool refresh
                        }) data,
                      ) async =>
                          (await context
                                  .issueProvider(listen: false)
                                  .getAssignees(
                                    after: data.lastItem?.cursor,
                                  ))
                              .map<NodeWithPaginationInfo<ActorMixin>>(
                                (
                                  final AssigneeUserListMixin$Assignees$Edges?
                                      e,
                                ) =>
                                    NodeWithPaginationInfo<ActorMixin>.fromEdge(
                                        e!),
                              )
                              .toList(),
                    );
                  },
                ),

                InfoCard(
                  title: switch (widget.participantsInfo.totalCount) {
                    1 => 'Participant',
                    _ => 'Participants',
                  },
                  trailing: _getIcon(widget.participantsInfo.totalCount),
                  child: _buildChild(widget.participantsInfo),
                  onTap: () async {
                    await BottomSheetPagination<
                        NodeWithPaginationInfo<ActorMixin>>(
                      paginatedListItemBuilder: _paginatedListItemBuilder,
                      paginationFuture: (
                        final ({
                          NodeWithPaginationInfo<ActorMixin>? lastItem,
                          int pageNumber,
                          int pageSize,
                          bool refresh
                        }) data,
                      ) async =>
                          context.issueProvider(listen: false).getParticipants(
                                after: data.lastItem?.cursor,
                              ),
                      title: 'Participants',
                    ).openSheet(context);
                  },
                ),
              ],
            ),
          ],
        ),
      );
}

class _ScreenHeader extends StatelessWidget {
  const _ScreenHeader({
    required this.widget,
    required this.titleEditingController,
    required this.labelsEditingController,
  });

  final IssuePullInfoTemplate widget;

  final EditingController<String> titleEditingController;
  final EditingController<List<LabelMixin?>> labelsEditingController;

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                if (widget.isPinned)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Octicons.pin,
                          size: 15,
                          // color: context.palette.faded3,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Pinned',
                          style: context.textTheme.bodyMedium?.copyWith(
                            // color: context.palette.faded3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                EditableTextItem(
                  titleEditingController,
                  builder:
                      (final BuildContext context, final String? newValue) =>
                          MarkdownBody(
                    newValue != null ? mdToHtml(newValue) : widget.title,
                    defaultBodyStyle: Style(
                      padding: HtmlPaddings.zero,
                      margin: Margins.zero,
                      fontSize: FontSize(
                        context.textTheme.headlineSmall!.fontSize!,
                      ),
                      fontWeight: context.textTheme.headlineSmall?.fontWeight,
                    ),
                  ),
                ),
                buildLabelsWidget(),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      );

  EditWidget<List<LabelMixin?>> buildLabelsWidget() =>
      EditWidget<List<LabelMixin?>>(
        editingController: labelsEditingController,
        builder: (
          final BuildContext context,
          final EditingData<List<LabelMixin?>> data,
        ) {
          return Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              children: <Widget>[
                if (data.editingController.currentValue.isEmpty)
                  const Text('No Labels')
                else
                  Flexible(
                    child: Wrap(
                      children: data.editingController.currentValue
                          .map(
                            (final LabelMixin? e) => Padding(
                              padding: const EdgeInsets.all(4),
                              child: IssueLabel.gql(e!),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                data.tools,
              ],
            ),
          );
          if (widget.labels.isNotEmpty) {
          } else {
            return Row(
              children: <Widget>[
                ScaleSwitch(
                  child: data.currentState == EditingState.editMode
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'No labels',
                            style: TextStyle(
                              // color: context.palette.faded3,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                      : Container(),
                ),
                data.tools,
              ],
            );
          }
        },
      );
}

class IssuePullState {
  IssuePullState(this.state, {this.isDraft = false})
      : assert(
          state is PullRequestState || state is IssueState,
          'Not a valid state!',
        );

  final bool isDraft;
  final dynamic state;

  Icon icon({
    final double size = 16,
    final Color? color,
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

class _AssigneeInfoCard extends StatelessWidget {
  const _AssigneeInfoCard({
    required this.availableList,
    required this.titleBuilder,
    required this.fetchActorsList,
    super.key,
    this.onTap,
    this.trailing,
  });
  final UnfinishedList<ActorMixin> availableList;
  final String Function(UnfinishedList<ActorMixin> availableList) titleBuilder;
  final ScrollWrapperFuture<NodeWithPaginationInfo<ActorMixin>> fetchActorsList;
  final VoidCallback? onTap;
  final Widget? trailing;
  @override
  Widget build(final BuildContext context) {
    return InfoCard(
      onTap: availableList.limitedAvailableList.isEmpty
          ? null
          : () async {
              if (availableList.totalCount > 1) {
                await BottomSheetPagination<NodeWithPaginationInfo<ActorMixin>>(
                  paginatedListItemBuilder: _paginatedListItemBuilder,
                  paginationFuture: fetchActorsList,
                  title: titleBuilder.call(availableList),
                ).openSheet(context);
              } else {
                navigateToProfile(
                  login: availableList.limitedAvailableList.first.login,
                  context: context,
                );
              }
            },
      trailing: _getIcon(availableList.totalCount),
      title: titleBuilder.call(availableList),
      child: _buildChild(),
    );
  }

  Widget _buildChild() => switch (availableList.totalCount) {
        0 => const Text('None'),
        1 => ProfileTile.login(
            padding: EdgeInsets.all(4),
            avatarUrl:
                availableList.limitedAvailableList.first.avatarUrl.toString(),
            userLogin: availableList.limitedAvailableList.first.login,
            disableTap: true,
          ),
        _ => ImageStack.widgets(
            totalCount: availableList.totalCount,
            // backgroundColor: context.palette.secondary,
            // widgetBorderColor: context.palette.secondary,
            extraCountTextStyle: TextStyle(
                // color: context.palette.faded3,
                ),
            widgetRadius: 29,
            children: availableList.limitedAvailableList
                .map(
                  (final ActorMixin e) => ProfileTile.avatar(
                    avatarUrl: e.avatarUrl.toString(),
                    padding: EdgeInsets.zero,
                  ),
                )
                .toList(),
          ),
      };
}

StatelessWidget _buildChild(final UnfinishedList<ActorMixin> availableList) =>
    switch (availableList.totalCount) {
      0 => const Text('None'),
      1 => ProfileTile.login(
          // padding: EdgeInsets.all(16),
          avatarUrl:
              availableList.limitedAvailableList.first.avatarUrl.toString(),
          userLogin: availableList.limitedAvailableList.first.login,
          disableTap: true,
        ),
      _ => ImageStack.widgets(
          totalCount: availableList.totalCount,
          // backgroundColor: context.palette.secondary,
          // widgetBorderColor: context.palette.secondary,
          extraCountTextStyle: TextStyle(
              // color: context.palette.faded3,
              ),
          widgetRadius: 29,
          children: availableList.limitedAvailableList
              .map(
                (final ActorMixin e) => ProfileTile.avatar(
                  avatarUrl: e.avatarUrl.toString(),
                  padding: EdgeInsets.zero,
                ),
              )
              .toList(),
        ),
    };

ScrollWrapperBuilder<NodeWithPaginationInfo<ActorMixin>>
    get _paginatedListItemBuilder => (
          final BuildContext context,
          final ({
            int index,
            NodeWithPaginationInfo<ActorMixin> item,
            bool refresh,
          }) data,
        ) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              color: context.colorScheme.surface,
              child: ProfileTile.login(
                avatarUrl: data.item.node.avatarUrl.toString(),
                userLogin: data.item.node.login,
                wrapperBuilder: (final Widget child) => Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: _buildListItemChildren(data, context, child),
                ),
                // wrapperBuilder: ,
              ),
            ),
          );
        };
Icon? _getIcon(int listLength) => switch (listLength) {
      0 => null,
      1 => Icon(Icons.adaptive.arrow_forward_rounded),
      _ => const Icon(
          Icons.arrow_drop_down_rounded,
        ),
    };
List<Widget> _buildListItemChildren(
  final ({
    int index,
    NodeWithPaginationInfo<ActorMixin> item,
    bool refresh
  }) data,
  final BuildContext context,
  final Widget child,
) =>
    <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          '${data.index + 1}',
          style: TextStyle(
            // color: context.palette.faded3,
            fontSize: 12,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    ];

// class ActorMultiListAdapter extends PaginatedInfoCardAdapter<ActorMixin> {
//   ActorMultiListAdapter({
//     required super.availableList,
//     required this.titleBuilder,
//     required this.fetchActorsList,
//   }) : super(
//           singleItemBehavior: SingleItemConfigForMultiListAdapter(
//             onTap: (final BuildContext context) => () => navigateToProfile(
//                   login: availableList.limitedAvailableList.first.login,
//                   context: context,
//                 ),
//             icon: null,
//           ),
//         );
//   final String Function(MultiItemInfoCardList<ActorMixin> availableList)
//       titleBuilder;
//   final ScrollWrapperFuture<NodeWithPaginationInfo<ActorMixin>> fetchActorsList;
//
//   @override
//   BottomSheetPagination<NodeWithPaginationInfo<ActorMixin>>
//       get paginatedSheet =>
//           BottomSheetPagination<NodeWithPaginationInfo<ActorMixin>>(
//             paginatedListItemBuilder: paginatedListItemBuilder,
//             paginationFuture: fetchActorsList,
//             title: title,
//           );
//
//   @override
//   bool get isExpanded => false;
//
//   @override
//   WidgetBuilder get viewBuilder => switch (listLength) {
//         0 => (final BuildContext context) => const Text('None'),
//         1 => (final BuildContext context) => ProfileTile.login(
//               padding: EdgeInsets.zero,
//               avatarUrl: items.first.avatarUrl.toString(),
//               userLogin: items.first.login,
//               disableTap: true,
//             ),
//         _ => (final BuildContext context) => ImageStack.widgets(
//               totalCount: availableList.totalCount,
//               backgroundColor: context.palette.secondary,
//               widgetBorderColor: context.palette.secondary,
//               extraCountTextStyle: TextStyle(
//                 color: context.palette.faded3,
//               ),
//               widgetRadius: 29,
//               children: items
//                   .map(
//                     (final ActorMixin e) => ProfileTile.avatar(
//                       avatarUrl: e.avatarUrl.toString(),
//                       padding: EdgeInsets.zero,
//                     ),
//                   )
//                   .toList(),
//             ),
//       };
//
//   @override
//   String get title => titleBuilder.call(availableList);
// }
