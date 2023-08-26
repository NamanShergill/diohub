import 'package:dio_hub/common/misc/changed_files_list_card.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/commits/commit_model.dart';
import 'package:dio_hub/providers/issue_pulls/pull_provider.dart';
import 'package:dio_hub/services/pulls/pulls_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PullChangedFilesList extends StatelessWidget {
  const PullChangedFilesList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InfiniteScrollWrapper<FileElement>(
      future: (data) {
        return PullsService.getPullFiles(
          Provider.of<PullProvider>(context, listen: false).data.url.toString(),
          perPage: data.pageSize,
          refresh: data.refresh,
          pageNumber: data.pageNumber,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      builder: (data) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2),
          child: ChangedFilesListCard(data.item),
        );
      },
    );
  }
}
