import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/repositories/commit_list_model.dart';
import 'package:dio_hub/providers/issue_pulls/pull_provider.dart';
import 'package:dio_hub/services/pulls/pulls_service.dart';
import 'package:dio_hub/view/repository/code/commit_browser_tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PullsCommitsList extends StatelessWidget {
  const PullsCommitsList({super.key});
  @override
  Widget build(final BuildContext context) =>
      InfiniteScrollWrapper<CommitListModel>(
        future: (
          final ({
            CommitListModel? lastItem,
            int pageNumber,
            int pageSize,
            bool refresh
          }) data,
        ) async =>
            PullsService.getPullCommits(
          Provider.of<PullProvider>(context, listen: false).data.url.toString(),
          perPage: data.pageSize,
          refresh: data.refresh,
          pageNumber: data.pageNumber,
        ),
        separatorBuilder: (final BuildContext context, final int index) =>
            const SizedBox(
          height: 16,
        ),
        builder: (
          final BuildContext context,
          final ({int index, CommitListModel item, bool refresh}) data,
        ) =>
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: CommitTilesREST(
            item: data.item,
          ),
        ),
      );
}
