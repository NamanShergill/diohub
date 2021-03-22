import 'package:flutter/material.dart';
import 'package:onehub/common/api_wrapper_widget.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/pulls/pull_list_card.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';
import 'package:onehub/services/issues/issues_service.dart';
import 'package:onehub/services/pulls/pulls_service.dart';

class PullsTab extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return InfiniteScrollWrapper<IssueModel>(
      future: (pageNumber, pageSize, refresh, _) {
        return IssuesService.getUserIssues(
            pageNumber: pageNumber, perPage: pageSize, refresh: refresh);
      },
      filterFn: (data) {
        List<IssueModel> filteredData = [];
        for (var item in data)
          if (item.pullRequest != null) filteredData.add(item);
        return filteredData;
      },
      header: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(height: 50, child: Placeholder()),
        );
      },
      divider: false,
      builder: (context, item, index) {
        return APIWrapper<PullRequestModel>(
          getCall: PullsService.getPullInformation(
            fullUrl: item.pullRequest!.url!,
          ),
          responseBuilder: (context, value) {
            return PullListCard(value);
          },
        );
      },
    );
  }
}
