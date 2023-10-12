import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/graphql/graphql.dart' hide IssueState;
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/view/issues_pulls/issue_pull_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class IssueScreen extends StatefulWidget {
  const IssueScreen(
    this.issueInfo, {
    required this.apiWrapperKey,
    this.initialIndex = 0,
    this.commentsSince,
    super.key,
  });
  final IssueInfoMixin issueInfo;
  final DateTime? commentsSince;
  final int initialIndex;
  final GlobalKey<
          APIWrapperState<IssuePullInfo$Query$Repository$IssueOrPullRequest>>
      apiWrapperKey;

  @override
  IssueScreenState createState() => IssueScreenState();
}

class IssueScreenState extends State<IssueScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      initialIndex: widget.initialIndex,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final IssueInfoMixin data = widget.issueInfo;
    return IssuePullInfoTemplate(
      number: data.number,
      isPinned: data.isPinned ?? false,
      title: data.titleHTML,
      reactionGroups: data.reactionGroups!,
      viewerCanReact: data.viewerCanReact,
      commentCount: data.comments.totalCount,
      repoInfo: data.repository,
      state: IssuePullState(data.state),
      bodyHTML: data.bodyHTML,
      assigneesInfo: data.assignees,
      body: data.body,
      labels: data.labels!.nodes!,
      createdAt: data.createdAt,
      createdBy: data.author,
      apiWrapperKey: widget.apiWrapperKey,
      participantsInfo: UnfinishedList<ActorMixin>(
        limitedAvailableList: data.participants.nodes!
            .map((final IssueInfoMixin$Participants$Nodes? e) => e!)
            .toList(),
        totalCount: data.participants.totalCount,
      ),
      uri: data.url,
    );
  }

  Widget? getIcon(final IssueState state, final double size) {
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
      case IssueState.REOPENED:
        return Icon(
          Octicons.issue_reopened,
          color: Colors.green,
          size: size,
        );
    }
  }
}
