import 'package:diohub/common/misc/info_card.dart';
import 'package:diohub/common/wrappers/api_wrapper_widget.dart';
import 'package:diohub/graphql/__generated__/schema.schema.gql.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/issue_pull_info.query.data.gql.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/timeline.query.data.gql.dart';
import 'package:diohub/view/issues_pulls/issue_pull_screen.dart';
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
  final GissueInfo issueInfo;
  final DateTime? commentsSince;
  final int initialIndex;
  final GlobalKey<
          APIWrapperState<GissuePullInfoData_repository_issueOrPullRequest>>
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
    final GissueInfo data = widget.issueInfo;
    return IssuePullInfoTemplate(
      number: data.number,
      isPinned: data.isPinned ?? false,
      title: data.titleHTML,
      reactionGroups: data.reactionGroups!.toList(),
      viewerCanReact: data.viewerCanReact,
      commentCount: data.comments.totalCount,
      repoInfo: data.repository,
      state: IssuePullState(data.state),
      bodyHTML: data.bodyHTML,
      assigneesInfo: data.assignees,
      body: data.body,
      labels: data.labels!.nodes!.toList(),
      createdAt: data.createdAt,
      createdBy: data.author,
      apiWrapperKey: widget.apiWrapperKey,
      participantsInfo: UnfinishedList<Gactor>(
        limitedAvailableList: data.participants.nodes!
            .map((final GissueInfo_participants_nodes? e) => e!)
            .toList(),
        totalCount: data.participants.totalCount,
      ),
      uri: data.url,
    );
  }

  Widget? getIcon(final GIssueState state, final double size) {
    switch (state) {
      case GIssueState.CLOSED:
        return Icon(
          Octicons.issue_closed,
          color: Colors.red,
          size: size,
        );
      case GIssueState.OPEN:
        return Icon(
          Octicons.issue_opened,
          color: Colors.green,
          size: size,
        );
    }
    return null;
  }
}
