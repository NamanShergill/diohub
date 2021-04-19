import 'package:flutter/material.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/common/search_overlay/search_overlay.dart';
import 'package:onehub/common/search_scroll_wrapper.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:onehub/providers/users/current_user_provider.dart';
import 'package:provider/provider.dart';

class IssuesList extends StatelessWidget {
  final ScrollController scrollController;
  IssuesList({required this.scrollController});
  @override
  Widget build(BuildContext context) {
    final _repo = Provider.of<RepositoryProvider>(context);
    final _user = Provider.of<CurrentUserProvider>(context).currentUserInfo;
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
      quickFilters: {
        SearchQueries().assignee.toQueryString(_user!.login!):
            'Assigned to you',
        SearchQueries().author.toQueryString(_user.login!): 'Your issues',
        SearchQueries().mentions.toQueryString(_user.login!): 'Mentions you',
      },
      quickOptions: {
        SearchQueries().iS.toQueryString('open'): 'Open issues only',
      },
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
    );
  }
}
