import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/issues/issue_label.dart';
import 'package:dio_hub/common/misc/app_bar.dart';
import 'package:dio_hub/common/misc/deep_link_widget.dart';
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
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/utils/markdown_to_html.dart';
import 'package:dio_hub/utils/rich_text.dart';
import 'package:dio_hub/view/issues_pulls/issue_screen.dart';
import 'package:dio_hub/view/issues_pulls/pull_screen.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

IssuePullScreenRoute issuePullScreenRoute(PathData path) {
  return IssuePullScreenRoute(
      ownerName: path.component(1)!,
      repoName: path.component(2)!,
      number: int.parse(path.component(4)!));
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
                  Row(
                    children: [
                      Card(
                        color: widget.state.color,
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
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
                      const Text(' by '),
                      ProfileTile(
                        widget.createdBy.avatarUrl.toString(),
                        userLogin: widget.createdBy.login,
                        showName: true,
                        size: 16,
                      ),
                      Text(
                        ' ${getDate(widget.createdAt.toString(), shorten: false)}',
                        style: TextStyle(color: faded3(context)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
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
                  const SizedBox(
                    height: 8,
                  ),
                  EditWidget(
                    editingController: labelsEditingController,
                    builder:
                        (context, newValue, tools, currentlyEditing, state) {
                      if (widget.labels.isNotEmpty == true) {
                        return Row(
                          children: [
                            Flexible(
                              child: Wrap(
                                children: widget.labels
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: IssueLabel.gql(e!),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            tools,
                          ],
                        );
                      } else {
                        return Row(
                          children: [
                            if (state == EditingState.editMode)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'No labels',
                                  style: TextStyle(
                                    color: faded3(context),
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            tools,
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 8,
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
                                if (widget.bodyHTML.isEmpty &&
                                    state == EditingState.editMode)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      'No Description Provided.',
                                      style: TextStyle(
                                          color: faded3(context),
                                          fontStyle: FontStyle.italic),
                                    ),
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
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                Icon(
                                  Icons.arrow_right_rounded,
                                ),
                              ],
                            ),
                          ),
                        ),
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
      return 'Opened';
    } else if (state == PullRequestState.merged) {
      return 'Merged';
    } else {
      throw UnimplementedError();
    }
  }
}
