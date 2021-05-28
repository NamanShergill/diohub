import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/repositories/commit_list_model.dart';
import 'package:dio_hub/providers/pulls/pull_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/pulls/pulls_service.dart';
import 'package:dio_hub/view/repository/code/commit_browser_tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PullsCommitsList extends StatelessWidget {
  const PullsCommitsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InfiniteScrollWrapper<CommitListModel>(
      future: (pageNumber, perPage, refresh, _) {
        return PullsService.getPullCommits(
            Provider.of<PullProvider>(context, listen: false).pullModel!.url,
            perPage: perPage,
            refresh: refresh,
            pageNumber: pageNumber);
      },
      divider: false,
      builder: (context, item, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: CommitBrowserTiles(
            item: item,
            onSelected: (sha) {
              AutoRouter.of(context).push(RepositoryScreenRoute(
                repositoryURL:
                    Provider.of<PullProvider>(context, listen: false).repoURL,
                index: 2,
                initSHA: sha,
              ));
            },
          ),
        );
      },
    );
  }
}
