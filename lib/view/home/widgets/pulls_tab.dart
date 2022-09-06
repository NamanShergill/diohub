import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/common/wrappers/search_scroll_wrapper.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PullsTab extends StatefulWidget {
  const PullsTab({this.deepLinkData, Key? key}) : super(key: key);
  final PathData? deepLinkData;

  @override
  _PullsTabState createState() => _PullsTabState();
}

class _PullsTabState extends State<PullsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final user = Provider.of<CurrentUserProvider>(context).data;
    return SearchScrollWrapper(
      SearchData(
          searchFilters:
              SearchFilters.issuesPulls(blacklist: [SearchQueryStrings.type]),
          defaultHiddenFilters: [
            SearchQueries().involves.toQueryString(user.login!),
            SearchQueries().type.toQueryString('pr'),
          ],
          filterStrings: [
            if (widget.deepLinkData?.component(1) == 'assigned')
              SearchQueries().assignee.toQueryString(user.login!),
            if (widget.deepLinkData?.component(1) == 'mentioned')
              SearchQueries().mentions.toQueryString(user.login!),
          ]),
      quickFilters: {
        SearchQueries().assignee.toQueryString(user.login!): 'Assigned',
        SearchQueries().author.toQueryString(user.login!): 'Created',
        SearchQueries().mentions.toQueryString(user.login!): 'Mentioned',
      },
      quickOptions: {
        SearchQueries().iS.toQueryString('open'): 'Open pull requests only',
      },
      searchBarMessage: 'Search in your pull requests',
      searchHeroTag: '${user.login}issueSearch',
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}
