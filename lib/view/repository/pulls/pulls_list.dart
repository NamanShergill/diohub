import 'package:flutter/material.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/pulls/pull_list_card.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:onehub/services/pulls/pulls_service.dart';
import 'package:provider/provider.dart';

class PullsList extends StatefulWidget {
  PullsList({Key key}) : super(key: key);

  @override
  _PullsListState createState() => _PullsListState();
}

class _PullsListState extends State<PullsList> {
  @override
  Widget build(BuildContext context) {
    return InfiniteScrollWrapper<PullRequestModel>(
      future: (pageNumber, pageSize, refresh, _) {
        return PullsService.getRepoPulls(
            Provider.of<RepositoryProvider>(context, listen: false)
                .repositoryModel
                .url,
            pageNumber: pageNumber,
            perPage: pageSize,
            refresh: refresh);
      },
      header: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(height: 50, child: Placeholder()),
        );
      },
      divider: false,
      builder: (context, item, index) {
        return PullListCard(item);
      },
    );
  }
}
