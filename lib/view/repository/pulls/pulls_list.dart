import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/common/wrappers/search_scroll_wrapper.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PullsList extends StatelessWidget {
  const PullsList({required this.scrollController, Key? key}) : super(key: key);
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final _repo = Provider.of<RepositoryProvider>(context);
    final _user = Provider.of<CurrentUserProvider>(context).currentUserInfo;

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
      quickFilters: _user != null
          ? {
              SearchQueries().assignee.toQueryString(_user.login!):
                  'Assigned to you',
              SearchQueries().author.toQueryString(_user.login!):
                  'Your pull requests',
              SearchQueries().mentions.toQueryString(_user.login!):
                  'Mentions you',
            }
          : null,
      quickOptions: {
        SearchQueries().iS.toQueryString('open'): 'Open pull requests only',
      },
      scrollController: scrollController,
      searchBarPadding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      searchBarMessage:
          'Search in ${_repo.repositoryModel!.name}\'s pull requests',
      searchHeroTag: 'repoPRSearch',
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      // replacementBuilder: (SearchData data, header, child) {
      //   if (data.getSort != null || data.isActive) return child;
      //   return InfiniteScrollWrapper<PullRequestModel>(
      //     future: (pageNumber, pageSize, refresh, _) {
      //       return PullsService.getRepoPulls(
      //           Provider.of<RepositoryProvider>(context, listen: false)
      //               .repositoryModel!
      //               .url,
      //           pageNumber: pageNumber,
      //           perPage: pageSize,
      //           refresh: refresh);
      //     },
      //     header: (context) => Padding(
      //         padding: EdgeInsets.only(top: 8), child: header(context, null)),
      //     scrollController: scrollController,
      //     isNestedScrollViewChild: true,
      //     divider: false,
      //     spacing: 4,
      //     topSpacing: 0,
      //     shrinkWrap: true,
      //     builder: (context, item, index) {
      //       return Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      //         child: PullListCard(
      //           item,
      //           padding: EdgeInsets.zero,
      //           showRepoName: false,
      //         ),
      //       );
      //     },
      //   );
      // },
    );
  }
}
