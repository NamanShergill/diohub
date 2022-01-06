import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/common/wrappers/search_scroll_wrapper.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IssuesTab extends StatefulWidget {
  const IssuesTab(
      {required this.nestedScrollViewController, this.deepLinkData, Key? key})
      : super(key: key);
  final ScrollController nestedScrollViewController;
  final DeepLinkData? deepLinkData;

  @override
  _IssuesTabState createState() => _IssuesTabState();
}

class _IssuesTabState extends State<IssuesTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _user = Provider.of<CurrentUserProvider>(context).data;
    return SearchScrollWrapper(
      SearchData(
          searchFilters:
              SearchFilters.issuesPulls(blacklist: [SearchQueryStrings.type]),
          defaultHiddenFilters: [
            SearchQueries().involves.toQueryString(_user.login!),
            SearchQueries().type.toQueryString('issue'),
          ],
          filterStrings: [
            if (widget.deepLinkData?.component(1) == 'assigned')
              SearchQueries().assignee.toQueryString(_user.login!),
            if (widget.deepLinkData?.component(1) == 'mentioned')
              SearchQueries().mentions.toQueryString(_user.login!),
          ]),
      quickFilters: {
        SearchQueries().assignee.toQueryString(_user.login!): 'Assigned',
        SearchQueries().author.toQueryString(_user.login!): 'Created',
        SearchQueries().mentions.toQueryString(_user.login!): 'Mentioned',
      },
      quickOptions: {
        SearchQueries().iS.toQueryString('open'): 'Open issues only',
      },
      nestedScrollViewController: widget.nestedScrollViewController,
      searchBarMessage: 'Search in your issues',
      searchHeroTag: '${_user.login}issueSearch',
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      filterFn: (data) {
        final filteredData = <IssueModel>[];
        for (final item in data) {
          if (item.pullRequest == null) {
            filteredData.add(item);
          }
        }
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
