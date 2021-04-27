import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/common/search_scroll_wrapper.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PullsTab extends StatelessWidget {
  final ScrollController scrollController;
  PullsTab({required this.scrollController});
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<CurrentUserProvider>(context).currentUserInfo;
    return SearchScrollWrapper(
      SearchData(
          searchFilters:
              SearchFilters.issuesPulls(blacklist: [SearchQueryStrings.type]),
          defaultHiddenFilters: [
            SearchQueries().involves.toQueryString(_user!.login!),
            SearchQueries().type.toQueryString('pr'),
          ]),
      quickFilters: {
        SearchQueries().assignee.toQueryString(_user.login!): 'Assigned',
        SearchQueries().author.toQueryString(_user.login!): 'Created',
        SearchQueries().mentions.toQueryString(_user.login!): 'Mentioned',
      },
      quickOptions: {
        SearchQueries().iS.toQueryString('open'): 'Open pull requests only',
      },
      scrollController: scrollController,
      searchBarMessage: 'Search in your pull requests',
      searchHeroTag: '${_user.login}issueSearch',
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}
