import 'package:flutter/material.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/common/search_overlay/search_overlay.dart';
import 'package:onehub/common/search_scroll_wrapper.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/providers/users/current_user_provider.dart';
import 'package:provider/provider.dart';

class IssuesTab extends StatelessWidget {
  final ScrollController scrollController;
  IssuesTab({required this.scrollController});
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<CurrentUserProvider>(context).currentUserInfo;
    return SearchScrollWrapper(
      SearchData(
          searchFilters:
              SearchFilters.issuesPulls(blacklist: [SearchQueryStrings.type]),
          defaultHiddenFilters: [
            SearchQueries().involves.toQueryString(_user!.login!),
            SearchQueries().type.toQueryString('issue'),
          ]),
      quickFilters: {
        'Assigned': [
          SearchQueries().assignee.toQueryString(_user.login!),
          SearchQueries().iS.toQueryString('open')
        ],
        'Created': [
          SearchQueries().author.toQueryString(_user.login!),
          SearchQueries().iS.toQueryString('open')
        ],
        'Mentioned': [
          SearchQueries().mentions.toQueryString(_user.login!),
          SearchQueries().iS.toQueryString('open')
        ],
      },
      scrollController: scrollController,
      searchBarMessage: 'Search in your issues',
      searchHeroTag: '${_user.login}issueSearch',
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      filterFn: (data) {
        List<IssueModel> filteredData = [];
        for (var item in data)
          if (item.pullRequest == null) filteredData.add(item);
        return filteredData;
      },
      // nonSearchFuture: (pageNumber, pageSize, refresh, _, sort, isAsc) {
      //   return IssuesService.getUserIssues(
      //       pageNumber: pageNumber,
      //       perPage: pageSize,
      //       refresh: refresh,
      //       ascending: isAsc,
      //       sort: sort);
      // },
    );
  }
}
