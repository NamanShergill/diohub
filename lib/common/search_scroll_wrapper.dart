import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/issues/issue_list_card.dart';
import 'package:onehub/common/profile_card.dart';
import 'package:onehub/common/repository_card.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/common/search_overlay/search_bar.dart';
import 'package:onehub/common/search_overlay/search_overlay.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/repositories/repository_model.dart' hide Type;
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/services/search/search_service.dart';
import 'package:onehub/style/animDuartions.dart';
import 'package:onehub/style/colors.dart';

typedef SearchScrollWrapperFuture<T>(int pageNumber, int pageSize, bool refresh,
    T? lastItem, String? sort, bool? isAscending);

class SearchScrollWrapper extends StatefulWidget {
  final SearchData searchData;
  final FilterFn? filterFn;
  final String? searchBarMessage;
  final String? searchHeroTag;
  final EdgeInsets padding;
  final EdgeInsets _searchBarPadding;
  final backgroundBuilder;
  final Color searchBarColor;
  final WidgetBuilder? header;
  final ScrollController? scrollController;

  final bool isNestedScrollViewChild;
  final List<String>? applyFiltersOnOpen;
  // Todo: Remove this?
  final WidgetBuilder? nonSearchBuilder;
  final ValueChanged<SearchData>? onChanged;
  SearchScrollWrapper(this.searchData,
      {this.searchBarMessage,
      this.applyFiltersOnOpen,
      this.header,
      this.scrollController,
      this.isNestedScrollViewChild = true,
      this.backgroundBuilder,
      this.nonSearchBuilder,
      EdgeInsets? searchBarPadding,
      this.onChanged,
      this.searchBarColor = AppColor.background,
      this.padding = const EdgeInsets.symmetric(horizontal: 16),
      this.searchHeroTag,
      this.filterFn,
      Key? key})
      : _searchBarPadding = searchBarPadding ?? padding.copyWith(top: 16),
        assert(isNestedScrollViewChild ? scrollController != null : true),
        super(key: key);
  @override
  _SearchScrollWrapperState createState() => _SearchScrollWrapperState();
}

class _SearchScrollWrapperState extends State<SearchScrollWrapper> {
  late SearchData searchData;

  @override
  void initState() {
    searchData = widget.searchData;
    super.initState();
  }

  bool searchBarHidden = false;
  final GlobalKey searchBarKey = GlobalKey();
  Size? size;
  InfiniteScrollWrapperController controller =
      InfiniteScrollWrapperController();

  @override
  Widget build(BuildContext context) {
    Widget header(context) {
      return Padding(
        key: searchBarKey,
        padding: widget._searchBarPadding,
        child: SearchBar(
          key: Key(searchData.toQuery),
          heroTag: widget.searchHeroTag,
          searchData: searchData,
          applyFiltersOnOpen: widget.applyFiltersOnOpen,
          prompt: widget.searchBarMessage,
          backgroundColor: widget.searchBarColor,
          onSubmit: (data) {
            setState(() {
              searchData = data;
            });
            if (widget.onChanged != null) widget.onChanged!(data);
            if (searchData.isValid) controller.refresh();
          },
        ),
      );
    }

    Widget pinnedHeader(context) {
      return SearchBar(
        key: Key(searchData.toQuery),
        heroTag: (widget.searchHeroTag ?? 'search') + 'pinned',
        searchData: searchData,
        applyFiltersOnOpen: widget.applyFiltersOnOpen,
        prompt: widget.searchBarMessage,
        isPinned: true,
        trailing: IconButton(
            icon: Icon(Icons.arrow_drop_up),
            onPressed: () {
              widget.scrollController!.animateTo(0,
                  duration: AppThemeAnimDurations.defaultAnimDuration,
                  curve: Curves.easeIn);
            }),
        backgroundColor: widget.searchBarColor,
        onSubmit: (data) {
          setState(() {
            searchData = data;
          });
          if (widget.onChanged != null) widget.onChanged!(data);
          controller.refresh();
        },
      );
    }

    return Container(
      color: AppColor.onBackground,
      child: Builder(
        builder: (context) {
          if (searchData.searchFilters == null ||
              (!searchData.isActive &&
                  (widget.nonSearchBuilder != null || widget.header != null)))
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.nonSearchBuilder != null)
                  Padding(
                    padding: widget.padding,
                    child: widget.nonSearchBuilder!(context),
                  ),
              ],
            );
          if (searchData.searchFilters!.searchType == SearchType.repositories)
            return _InfiniteWrapper<RepositoryModel>(
              key: Key(searchData.toQuery + searchData.isActive.toString()),
              controller: controller,
              searchData: searchData,
              isNestedScrollViewChild: widget.isNestedScrollViewChild,
              scrollController: widget.scrollController,
              searchFuture: (pageNumber, pageSize, refresh, _) {
                return SearchService.searchRepos(searchData.toQuery,
                    perPage: pageSize,
                    page: pageNumber,
                    sort: searchData.getSort,
                    ascending: searchData.isSortAsc);
              },
              header: header,
              pinnedHeader: searchData.isActive ? pinnedHeader : null,
              builder: (context, item, index) {
                return Padding(
                  padding: widget.padding,
                  child: RepositoryCard(
                    item,
                    padding: EdgeInsets.zero,
                  ),
                );
              },
            );
          else if (searchData.searchFilters!.searchType ==
              SearchType.issues_pulls)
            return _InfiniteWrapper<IssueModel>(
              key: Key(searchData.toQuery + searchData.isActive.toString()),
              filterFn: widget.filterFn,
              controller: controller,
              searchData: searchData,
              scrollController: widget.scrollController,
              searchFuture: (pageNumber, pageSize, refresh, _) {
                return SearchService.searchIssues(searchData.toQuery,
                    perPage: pageSize,
                    page: pageNumber,
                    sort: searchData.getSort,
                    ascending: searchData.isSortAsc);
              },
              isNestedScrollViewChild: widget.isNestedScrollViewChild,
              header: header,
              pinnedHeader: searchData.isActive ? pinnedHeader : null,
              builder: (context, item, index) {
                return Padding(
                  padding: widget.padding,
                  child: IssueListCard(
                    item,
                    padding: EdgeInsets.zero,
                  ),
                );
              },
            );
          else if (searchData.searchFilters!.searchType == SearchType.users)
            return _InfiniteWrapper<UserInfoModel>(
              key: Key(searchData.toQuery + searchData.isActive.toString()),
              filterFn: widget.filterFn,
              controller: controller,
              searchData: searchData,
              scrollController: widget.scrollController,
              header: header,
              pinnedHeader: searchData.isActive ? pinnedHeader : null,
              searchFuture: (pageNumber, pageSize, refresh, _) {
                return SearchService.searchUsers(searchData.toQuery,
                    perPage: pageSize,
                    page: pageNumber,
                    sort: searchData.getSort,
                    ascending: searchData.isSortAsc);
              },
              isNestedScrollViewChild: widget.isNestedScrollViewChild,
              builder: (context, item, index) {
                return Padding(
                  padding: widget.padding,
                  child: ProfileCard(
                    item,
                    padding: EdgeInsets.zero,
                  ),
                );
              },
            );
          return Container();
        },
      ),
    );

    // return NestedScrollView(
    //   headerSliverBuilder: (context, _) {
    //     return [
    //       SliverOverlapAbsorber(
    //         handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
    //         sliver: SliverAppBar(
    //           expandedHeight: 150,
    //           collapsedHeight: 100,
    //           pinned: true,
    //           elevation: 2,
    //           backgroundColor: AppColor.onBackground,
    //           flexibleSpace: Padding(
    //             padding: const EdgeInsets.only(bottom: 30.0),
    //             // child: CollapsibleAppBar(
    //             //   minHeight: 100,
    //             //   maxHeight: 150,
    //             //   child: SearchBar(
    //             //     updateBarOnChange: false,
    //             //     onSubmit: (data) {},
    //             //   ),
    //             // ),
    //           ),
    //         ),
    //       ),
    //     ];
    //   },
    //   body: Container(
    //     color: AppColor.onBackground,
    //     child: Padding(
    //       padding: const EdgeInsets.only(top: 70),
    //       child: Builder(
    //         builder: (context) {
    //           NestedScrollView.sliverOverlapAbsorberHandleFor(context);
    //           if (searchData.searchFilters == null ||
    //               (!searchData.isActive &&
    //                   (widget.nonSearchBuilder != null ||
    //                       widget.header != null)))
    //             return Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 if (widget.nonSearchBuilder != null)
    //                   Padding(
    //                     padding: widget.padding,
    //                     child: widget.nonSearchBuilder!(context),
    //                   ),
    //               ],
    //             );
    //           if (searchData.searchFilters!.searchType ==
    //               SearchType.repositories)
    //             return _InfiniteWrapper<RepositoryModel>(
    //               // key: Key(searchData.toQuery() + searchData.isActive.toString()),
    //               controller: controller,
    //               searchData: searchData,
    //               searchFuture: (pageNumber, pageSize, refresh, _) {
    //                 return SearchService.searchRepos(searchData.toQuery(),
    //                     perPage: pageSize,
    //                     page: pageNumber,
    //                     sort: searchData.getSort,
    //                     ascending: searchData.isSortAsc);
    //               },
    //               builder: (context, item, index) {
    //                 return Padding(
    //                   padding: widget.padding,
    //                   child: RepositoryCard(
    //                     item,
    //                     padding: EdgeInsets.zero,
    //                   ),
    //                 );
    //               },
    //             );
    //           else if (searchData.searchFilters!.searchType ==
    //               SearchType.issues_pulls)
    //             return _InfiniteWrapper<IssueModel>(
    //               // key: Key(searchData.toQuery() + searchData.isActive.toString()),
    //               filterFn: widget.filterFn,
    //               controller: controller,
    //               searchData: searchData,
    //               searchFuture: (pageNumber, pageSize, refresh, _) {
    //                 return SearchService.searchIssues(searchData.toQuery(),
    //                     perPage: pageSize,
    //                     page: pageNumber,
    //                     sort: searchData.getSort,
    //                     ascending: searchData.isSortAsc);
    //               },
    //               builder: (context, item, index) {
    //                 return Padding(
    //                   padding: widget.padding,
    //                   child: IssueListCard(
    //                     item,
    //                     padding: EdgeInsets.zero,
    //                   ),
    //                 );
    //               },
    //             );
    //           else if (searchData.searchFilters!.searchType == SearchType.users)
    //             return _InfiniteWrapper<UserInfoModel>(
    //               // key: Key(searchData.toQuery() + searchData.isActive.toString()),
    //               filterFn: widget.filterFn,
    //               controller: controller,
    //               searchData: searchData,
    //               searchFuture: (pageNumber, pageSize, refresh, _) {
    //                 return SearchService.searchUsers(searchData.toQuery(),
    //                     perPage: pageSize,
    //                     page: pageNumber,
    //                     sort: searchData.getSort,
    //                     ascending: searchData.isSortAsc);
    //               },
    //               builder: (context, item, index) {
    //                 return Padding(
    //                   padding: widget.padding,
    //                   child: ProfileCard(
    //                     item,
    //                     padding: EdgeInsets.zero,
    //                   ),
    //                 );
    //               },
    //             );
    //           return Container();
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}

class _InfiniteWrapper<T> extends StatelessWidget {
  final InfiniteScrollWrapperController controller;
  final WidgetBuilder header;
  final ScrollWrapperFuture searchFuture;
  final ScrollWrapperBuilder builder;
  final SearchData searchData;
  final FilterFn? filterFn;
  final bool isNestedScrollViewChild;
  final ScrollController? scrollController;
  final WidgetBuilder? pinnedHeader;

  _InfiniteWrapper(
      {required this.builder,
      required this.header,
      this.isNestedScrollViewChild = true,
      required this.controller,
      this.scrollController,
      this.filterFn,
      this.pinnedHeader,
      required this.searchFuture,
      required this.searchData,
      Key? key})
      : assert(isNestedScrollViewChild ? scrollController != null : true),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return InfiniteScrollWrapper<T>(
      pageSize: 20,
      controller: controller,
      header: header,
      filterFn: filterFn,
      scrollController: scrollController,
      future: searchFuture,
      divider: false,
      showScrollToTopButton: pinnedHeader == null,
      pinnedHeader: pinnedHeader,
      shrinkWrap: true,
      spacing: 4,
      isNestedScrollViewChild: isNestedScrollViewChild,
      topSpacing: 0,
      builder: builder,
    );
  }
}
