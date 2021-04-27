import 'package:dio_hub/common/changed_files_list_card.dart';
import 'package:dio_hub/common/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/commits/commit_model.dart';
import 'package:dio_hub/providers/pulls/pull_provider.dart';
import 'package:dio_hub/services/pulls/pulls_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PullChangedFilesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfiniteScrollWrapper<FileElement>(
      future: (pageNumber, perPage, refresh, _) {
        return PullsService.getPullFiles(
            Provider.of<PullProvider>(context, listen: false).pullModel!.url,
            perPage: perPage,
            refresh: refresh,
            pageNumber: pageNumber);
      },
      divider: false,
      builder: (context, item, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2),
            child: ChangedFilesListCard(item));
      },
    );
  }
}
