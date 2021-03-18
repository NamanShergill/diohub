import 'package:flutter/material.dart';
import 'package:onehub/common/changed_files_list_card.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/models/commits/commit_model.dart';
import 'package:onehub/providers/pulls/pull_provider.dart';
import 'package:onehub/services/pulls/pulls_service.dart';
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
