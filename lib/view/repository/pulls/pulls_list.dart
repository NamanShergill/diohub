import 'package:flutter/material.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/pulls/pull_list_card.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/common/search_overlay/search_overlay.dart';
import 'package:onehub/common/search_scroll_wrapper.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:onehub/services/pulls/pulls_service.dart';
import 'package:provider/provider.dart';

class PullsList extends StatefulWidget {
  PullsList({Key? key}) : super(key: key);

  @override
  _PullsListState createState() => _PullsListState();
}

class _PullsListState extends State<PullsList> {
  @override
  Widget build(BuildContext context) {
    final _repo = Provider.of<RepositoryProvider>(context);
    return SearchScrollWrapper(
      SearchData(
          searchFilters:
              SearchFilters.issuesPulls(blacklist: [SearchQueryStrings.type]),
          defaultHiddenFilters: [
            SearchQueries().type.toQueryString('pr'),
            SearchQueries()
                .repo
                .toQueryString(_repo.repositoryModel!.fullName!),
          ]),
      applyFiltersOnOpen: [
        SearchQueries().iS.toQueryString('open'),
      ],
      searchBarPadding: EdgeInsets.only(top: 8, left: 8, right: 8),
      searchBarMessage: 'Search in ${_repo.repositoryModel!.name}\'s issues',
      searchHeroTag: 'repoIssueSearch',
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      nonSearchBuilder: (context) {
        return InfiniteScrollWrapper<PullRequestModel>(
          future: (pageNumber, pageSize, refresh, _) {
            return PullsService.getRepoPulls(
                Provider.of<RepositoryProvider>(context, listen: false)
                    .repositoryModel!
                    .url,
                pageNumber: pageNumber,
                perPage: pageSize,
                refresh: refresh);
          },
          divider: false,
          builder: (context, item, index) {
            return PullListCard(
              item,
              padding: EdgeInsets.zero,
              showRepoName: false,
            );
          },
        );
      },
    );
  }
}
