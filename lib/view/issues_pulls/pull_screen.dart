import 'package:diohub/common/misc/info_card.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/issue_pull_info.data.gql.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/timeline.data.gql.dart';
import 'package:diohub/models/issues/issue_model.dart';
import 'package:diohub/view/issues_pulls/issue_pull_screen.dart';
import 'package:diohub/view/issues_pulls/widgets/pull_changed_files_list.dart';
import 'package:diohub/view/issues_pulls/widgets/pulls_commits_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_tabs/flutter_dynamic_tabs.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PullScreen extends StatefulWidget {
  const PullScreen(
    this.pullInfo, {
    this.initialIndex = 0,
    this.commentsSince,
    super.key,
    required this.onRefresh,
  });

  final GpullInfo pullInfo;
  final DateTime? commentsSince;
  final int initialIndex;
  final Future<void> Function() onRefresh;

  @override
  PullScreenState createState() => PullScreenState();
}

class PullScreenState extends State<PullScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      initialIndex: widget.initialIndex,
      vsync: this,
    );
    super.initState();
  }

  final GlobalKey<IssuePullInfoTemplateState> _templateKey =
      GlobalKey<IssuePullInfoTemplateState>();

  @override
  Widget build(final BuildContext context) {
    final GpullInfo data = widget.pullInfo;
    return IssuePullInfoTemplate(
      key: _templateKey,
      number: data.number,
      isPinned: false,
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
      participantsInfo: UnfinishedList<Gactor>(
        limitedAvailableList: data.participants.nodes!
            .map((final GpullInfo_participants_nodes? e) => e!)
            .toList(),
        totalCount: data.participants.totalCount,
      ),
      dynamicTabs: <DynamicTab>[
        DynamicTab(
          identifier: 'files_changed',
          tabViewBuilder: (final BuildContext context) =>
              const PullChangedFilesList(),
        ),
        DynamicTab(
          identifier: 'commits',
          tabViewBuilder: (final BuildContext context) =>
              const PullsCommitsList(),
        ),
      ],
      uri: data.url,
      onRefresh: widget.onRefresh,
      additionalAboutWidgets: [
        if (data.merged)
          InfoCard(
            title: 'Merged',
            leading: const Icon(
              Octicons.git_merge,
              color: Colors.deepPurpleAccent,
            ),
            child: Text(
              data.mergedAt!.toIso8601String(),
            ),
          ),
        InfoCard(
          title: 'Commits',
          leading: const Icon(
            Octicons.git_commit,
          ),
          child: Text(
            data.commits.totalCount.toString(),
          ),
          onTap: () {
            // _templateKey.currentState?.dynamicTabsController
            //   .openTab('commits');
          },
        ),
        InfoCard(
          title: 'Changed Files',
          leading: const Icon(
            Octicons.file_diff,
          ),
          onTap: () {
            // _templateKey.currentState?.dynamicTabsController
            //   .openTab('files_changed');
          },
          child: Text(
            data.changedFiles.toString(),
          ),
        ),
      ],
    );
  }

  Widget getIcon(
    final IssueState state,
    final double size, {
    required final bool merged,
  }) {
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
            color: Colors.red,
            size: size,
          );
        }
      // case GIssueState.REOPENED:
      case IssueState.OPEN:
        return Icon(
          Octicons.git_pull_request,
          color: Colors.green,
          size: size,
        );
      default:
        throw UnimplementedError();
    }
  }
}
