import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/common/wrappers/search_scroll_wrapper.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PullsTab extends StatefulWidget {
  final ScrollController scrollController;
  final DeepLinkData? deepLinkData;

  const PullsTab({required this.scrollController, this.deepLinkData, Key? key})
      : super(key: key);

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
    final _user = Provider.of<CurrentUserProvider>(context).currentUserInfo;
    return SearchScrollWrapper(
      SearchData(
          searchFilters:
              SearchFilters.issuesPulls(blacklist: [SearchQueryStrings.type]),
          defaultHiddenFilters: [
            SearchQueries().involves.toQueryString(_user!.login!),
            SearchQueries().type.toQueryString('pr'),
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
        SearchQueries().iS.toQueryString('open'): 'Open pull requests only',
      },
      scrollController: widget.scrollController,
      searchBarMessage: 'Search in your pull requests',
      searchHeroTag: '${_user.login}issueSearch',
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}
