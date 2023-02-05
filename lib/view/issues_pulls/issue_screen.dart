import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/graphql/graphql.dart' hide IssueState;
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/view/issues_pulls/issue_pull_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class IssueScreen extends StatefulWidget {
  const IssueScreen(this.issueInfo,
      {this.initialIndex = 0,
      this.commentsSince,
      Key? key,
      required this.apiWrapperController})
      : super(key: key);
  final IssueInfoMixin issueInfo;
  final DateTime? commentsSince;
  final int initialIndex;
  final APIWrapperController apiWrapperController;

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
    final data = widget.issueInfo;
    return IssuePullInfoTemplate(
      number: data.number,
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
      apiWrapperController: widget.apiWrapperController,
      participantsInfo: ParticipantsInfo(
        count: data.participants.totalCount,
        avatarURLs: data.participants.nodes!
            .map(
              (e) => e!.avatarUrl.toString(),
            )
            .toList(),
      ),
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
