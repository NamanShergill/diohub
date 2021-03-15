import 'package:flutter/material.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/issues/issue_list_card.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:onehub/services/issues/issues_service.dart';
import 'package:provider/provider.dart';

class IssuesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfiniteScrollWrapper<IssueModel>(
      future: (pageNumber, pageSize, refresh, _) {
        return IssuesService.getRepoIssues(
            Provider.of<RepositoryProvider>(context, listen: false)
                .repositoryModel
                .url,
            pageNumber: pageNumber,
            perPage: pageSize,
            refresh: refresh);
      },
      filterFn: (data) {
        List<IssueModel> filteredData = [];
        for (var item in data)
          if (item.pullRequest == null) filteredData.add(item);
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
        return IssueListCard(item);
      },
    );
  }
}