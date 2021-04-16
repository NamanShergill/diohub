import 'package:flutter/material.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/issues/issue_list_card.dart';
import 'package:onehub/common/place_holder.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/common/search_overlay/search_overlay.dart';
import 'package:onehub/common/search_scroll_wrapper.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:onehub/services/issues/issues_service.dart';
import 'package:provider/provider.dart';

class IssuesList extends StatelessWidget {
  final ScrollController scrollController;
  IssuesList({required this.scrollController});
  @override
  Widget build(BuildContext context) {
    final _repo = Provider.of<RepositoryProvider>(context);
    return SearchScrollWrapper(
      SearchData(
          searchFilters:
              SearchFilters.issuesPulls(blacklist: [SearchQueryStrings.type]),
          defaultHiddenFilters: [
            SearchQueries().type.toQueryString('issue'),
            SearchQueries()
                .repo
                .toQueryString(_repo.repositoryModel!.fullName!),
          ]),
      applyFiltersOnOpen: [
        SearchQueries().iS.toQueryString('open'),
      ],
      scrollController: scrollController,
      searchBarMessage: 'Search in ${_repo.repositoryModel!.name}\'s issues',
      searchHeroTag: 'repoIssueSearch',
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      filterFn: (data) {
        List<IssueModel> filteredData = [];
        for (var item in data)
          if (item.pullRequest == null) filteredData.add(item);
        return filteredData;
      },
      // nonSearchFuture: (pageNumber, pageSize, refresh, _, sort, isAsc) {
      //   return IssuesService.getRepoIssues(
      //       Provider.of<RepositoryProvider>(context, listen: false)
      //           .repositoryModel!
      //           .url,
      //       pageNumber: pageNumber,
      //       perPage: pageSize,
      //       refresh: refresh,
      //       ascending: isAsc,
      //       sort: sort);
      // },
    );
    return InfiniteScrollWrapper<IssueModel>(
      future: (pageNumber, pageSize, refresh, _) {
        return IssuesService.getRepoIssues(
            Provider.of<RepositoryProvider>(context, listen: false)
                .repositoryModel!
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
          padding: const EdgeInsets.only(top: 16.0),
          child: TextPlaceHolder('Filtering options currently W.I.P.'),
        );
      },
      divider: false,
      builder: (context, item, index) {
        return IssueListCard(
          item,
          showRepoName: false,
        );
      },
    );
  }
}
