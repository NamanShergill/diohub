import 'package:dio_hub/common/misc/deep_link_widget.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/view/issues_pulls/issue_screen.dart';
import 'package:dio_hub/view/issues_pulls/pull_screen.dart';
import 'package:flutter/material.dart';

IssuePullScreenRoute issuePullScreenRoute(String path) {
  final _data = DeepLinkData(path);
  return IssuePullScreenRoute(
      ownerName: _data.component(0)!,
      repoName: _data.component(1)!,
      number: int.parse(_data.component(3)!));
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
  void handleDeepLink(DeepLinkData deepLinkData) {
    // TODO: implement handleDeepLink
  }

  @override
  Widget build(BuildContext context) {
    return APIWrapper<IssuePullInfo$Query$Repository$IssueOrPullRequest>(
      apiCall: () => IssuesService.getIssuePullInfo(widget.number,
          repo: widget.repoName, user: widget.ownerName),
      responseBuilder: (context, data) {
        if (data is IssueInfoMixin) {
          return IssueScreen(data as IssueInfoMixin);
        } else if (data is PullInfoMixin) {
          return PullScreen(data as PullInfoMixin);
        } else {
          return Container();
        }
      },
    );
  }
}
