import 'package:diohub/common/misc/changed_files_list_card.dart';
import 'package:diohub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:diohub/models/commits/commit_model.dart';
import 'package:diohub/providers/issue_pulls/pull_provider.dart';
import 'package:diohub/services/pulls/pulls_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PullChangedFilesList extends StatelessWidget {
  const PullChangedFilesList({super.key});
  @override
  Widget build(final BuildContext context) =>
      InfiniteScrollWrapper<FileElement>(
        future: (
          data,
        ) async =>
            PullsService.getPullFiles(
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
          final data,
        ) =>
            Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: ChangedFilesListCard(data.item),
        ),
      );
}
