import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/scale_expanded_widget.dart';
import 'package:dio_hub/common/issues/issue_label.dart';
import 'package:dio_hub/common/misc/app_bar.dart';
import 'package:dio_hub/common/misc/deep_link_widget.dart';
import 'package:dio_hub/common/misc/drop_down_info_card.dart';
import 'package:dio_hub/common/misc/editable_text.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/markdown_body.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/misc/reaction_bar.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/common/wrappers/editing_wrapper.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/main.dart';
import 'package:dio_hub/routes/router.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/utils/markdown_to_html.dart';
import 'package:dio_hub/utils/rich_text.dart';
import 'package:dio_hub/view/issues_pulls/issue_screen.dart';
import 'package:dio_hub/view/issues_pulls/pull_screen.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_stack/image_stack.dart';

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
  final String repoName;
  final String ownerName;
  final int number;
  final DateTime? commentsSince;
  final int initialIndex;

  @override
  State<IssuePullScreen> createState() => _IssuePullScreenState();
}

class _IssuePullScreenState extends DeepLinkWidgetState<IssuePullScreen> {
  @override
  void handleDeepLink(PathData deepLinkData) {
    // TODO: implement handleDeepLink
  }

  final APIWrapperController<IssuePullInfo$Query$Repository$IssueOrPullRequest>
      apiWrapperController =
      APIWrapperController<IssuePullInfo$Query$Repository$IssueOrPullRequest>();

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
          return IssueScreen(
            data as IssueInfoMixin,
            apiWrapperController: apiWrapperController,
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
  }) : super(key: key);
  final int number;
  final int commentCount;
  final bool viewerCanReact;
  final String title;
  final String bodyHTML;
  final String body;
  final RepoInfoMixin repoInfo;
  final List<ReactionGroupsMixin> reactionGroups;
  final IssuePullState state;
  final AssigneeInfoMixin assigneesInfo;
  final List<LabelMixin?> labels;
  final DateTime createdAt;
  final ActorMixin createdBy;
  final APIWrapperController apiWrapperController;

  @override
  State<IssuePullInfoTemplate> createState() => _IssuePullInfoTemplateState();
}

class _IssuePullInfoTemplateState extends State<IssuePullInfoTemplate> {
  late EditingController<String> titleEditingController;
  late EditingController<String> descEditingController;
  late EditingController<List<LabelMixin?>> labelsEditingController;
  late EditingController assigneeEditingController;

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
    return EditingWrapper(
      onSave: () {},
      editingControllers: [
        titleEditingController,
        labelsEditingController,
        descEditingController,
        assigneeEditingController,
      ],
      builder: (context) => Scaffold(
        appBar: DHAppBar(
          hasEditableChildren: true,
          title: Row(
            children: [
              Icon(
                widget.state.icon,
                color: widget.state.color,
                size: 16,
              ),
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
                        color: faded3(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(
            () => widget.apiWrapperController.refresh(),
          ),
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  // const Divider(
                  //   height: 16,
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                    child: Row(
                      children: [
                        ProfileTile(
                          widget.repoInfo.owner.avatarUrl.toString(),
                          disableTap: true,
                          size: 16,
                        ),
                        richText([
                          TextSpan(
                              text:
                                  '  ${widget.repoInfo.owner.login}/${widget.repoInfo.name}',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  AutoRouter.of(context).push(
                                      RepositoryScreenRoute(
                                          repositoryURL: 'repositoryURL'));
                                }),
                          TextSpan(
                            text: ' #${widget.number}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                            defaultStyle: TextStyle(
                                color: faded3(context), fontSize: 17)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  EditableTextItem(
                    titleEditingController,
                    builder: (context, newValue) => MarkdownBody(
                      newValue != null ? mdToHtml(newValue) : widget.title,
                      defaultBodyStyle: Style(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          fontSize: FontSize(
                            theme(context).textTheme.headline5?.fontSize,
                          ),
                          fontWeight:
                              theme(context).textTheme.headline5?.fontWeight),
                    ),
                  ),
                  EditWidget(
                    editingController: labelsEditingController,
                    builder:
                        (context, newValue, tools, currentlyEditing, state) {
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        'No labels',
                                        style: TextStyle(
                                          color: faded3(context),
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
                  ),
                  const Divider(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Card(
                        color: widget.state.color,
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                widget.state.icon,
                                size: 16,
                                // color: state.color,
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
                        width: 8,
                      ),
                      ProfileTile(
                        widget.createdBy.avatarUrl.toString(),
                        userLogin: widget.createdBy.login,
                        showName: true,
                        size: 16,
                      ),
                      Text(
                        '  ${getDate(widget.createdAt.toString(), shorten: false)}',
                        style: TextStyle(color: faded3(context)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Card(
                    shape:
                        RoundedRectangleBorder(borderRadius: medBorderRadius),
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
                        EditWidget(
                          editingController: descEditingController,
                          builder: (context, newValue, tools, currentlyEditing,
                              state) {
                            return Row(
                              children: [
                                if (widget.bodyHTML.isNotEmpty)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: widget.body.length > 400
                                          ? ExpandChild(
                                              collapsedHint: 'Description',
                                              expandArrowStyle:
                                                  ExpandArrowStyle.both,
                                              icon:
                                                  Icons.arrow_drop_down_rounded,
                                              // hintTextStyle: TextStyle(
                                              //     color: faded3(context)),
                                              child:
                                                  MarkdownBody(widget.bodyHTML),
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
                                                color: faded3(context),
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
                        Container(
                          decoration: BoxDecoration(
                            color: accent(context),
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  EditWidget(
                    editingController: assigneeEditingController,
                    builder: (context, newValue, tools, currentlyEditing,
                            currentState) =>
                        Row(
                      children: [
                        Expanded(
                          child: DropDownInfoCard(
                            title: 'Assignees',
                            trailing: ImageStack.widgets(
                              totalCount: widget.assigneesInfo.totalCount,
                              backgroundColor: secondary(context),
                              widgetBorderColor: secondary(context),
                              // extraCountBorderColor: faded2(context),
                              widgetCount: 3,
                              extraCountTextStyle: TextStyle(
                                color: faded3(context),
                              ),
                              children: widget.assigneesInfo.edges!
                                  .map((e) => ProfileTile(
                                      e!.node!.avatarUrl.toString()))
                                  .toList(),
                            ),
                            child: Container(
                              height: 60,
                              width: 90,
                            ),
                          ),
                        ),
                        tools,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IssuePullState {
  IssuePullState(this.state, {this.isDraft = false})
      : assert(state is PullRequestState || state is IssueState,
            'Not a valid state!');
  final dynamic state;
  final bool isDraft;

  IconData get icon {
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
