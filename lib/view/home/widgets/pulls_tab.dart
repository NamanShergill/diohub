import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/common/wrappers/search_scroll_wrapper.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/models/users/current_user_info_model.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PullsTab extends StatefulWidget {
  const PullsTab({this.deepLinkData, super.key});
  final PathData? deepLinkData;

  @override
  PullsTabState createState() => PullsTabState();
}

class PullsTabState extends State<PullsTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(final BuildContext context) {
    super.build(context);
    final CurrentUserInfoModel user =
        Provider.of<CurrentUserProvider>(context).data;
    return SearchScrollWrapper(
      SearchData(
        searchFilters: SearchFilters.issuesPulls(
          blacklist: <String>[SearchQueryStrings.type],
        ),
        defaultHiddenFilters: <String>[
          SearchQueries().involves.toQueryString(user.login!),
          SearchQueries().type.toQueryString('pr'),
        ],
        filterStrings: <String>[
          if (widget.deepLinkData?.component(1) == 'assigned')
            SearchQueries().assignee.toQueryString(user.login!),
          if (widget.deepLinkData?.component(1) == 'mentioned')
            SearchQueries().mentions.toQueryString(user.login!),
        ],
      ),
      quickFilters: <String, String>{
        SearchQueries().assignee.toQueryString(user.login!): 'Assigned',
        SearchQueries().author.toQueryString(user.login!): 'Created',
        SearchQueries().mentions.toQueryString(user.login!): 'Mentioned',
      },
      quickOptions: <String, String>{
        SearchQueries().iS.toQueryString('open'): 'Open pull requests only',
      },
      searchBarMessage: 'Search in your pull requests',
      searchHeroTag: '${user.login}issueSearch',
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}
