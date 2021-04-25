import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
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
import 'package:onehub/style/colors.dart';

typedef SearchScrollWrapperFuture<T> = Future Function(int pageNumber,
    int pageSize, bool refresh, T? lastItem, String? sort, bool? isAscending);

class SearchScrollWrapper extends StatefulWidget {
  /// Search Data this search wrapper would be attached to.
  final SearchData searchData;

  /// Filter function for the search results.
  final FilterFn? filterFn;

  /// Message to show on the search bar.
  final String? searchBarMessage;

  /// Hero tag of the search bar.
  final String? searchHeroTag;

  /// Padding of wrapper.
  final EdgeInsets padding;
  final EdgeInsets _searchBarPadding;

  /// Background color of the search bar.
  final Color searchBarColor;

  /// Quick filters to be shown in the search bar in a dropdown.
  final Map<String, String>? quickFilters;

  /// Quick options to be shown in the search bar as a checkbox.
  final Map<String, String>? quickOptions;

  /// Scroll controller of the infinite list.
  final ScrollController? scrollController;

  /// Is the child of a nested scroll view.
  final bool isNestedScrollViewChild;

  /// Replacement builder if search data is empty.
  final replacementBuilder;

  /// Callback for when search data is changed.
  final ValueChanged<SearchData>? onChanged;
  SearchScrollWrapper(this.searchData,
      {this.searchBarMessage,
      this.quickFilters,
      this.replacementBuilder,
      this.quickOptions,
      this.scrollController,
      this.isNestedScrollViewChild = true,
      EdgeInsets? searchBarPadding,
      this.onChanged,
      this.searchBarColor = AppColor.background,
      this.padding = const EdgeInsets.symmetric(horizontal: 8),
      this.searchHeroTag,
      this.filterFn,
      Key? key})
      : _searchBarPadding = searchBarPadding ?? padding.copyWith(top: 8),
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
  Size? size;
  InfiniteScrollWrapperController controller =
      InfiniteScrollWrapperController();

  @override
  Widget build(BuildContext context) {
    Widget header(context, function) {
      return Padding(
        padding: function != null ? EdgeInsets.zero : widget._searchBarPadding,
        child: SearchBar(
          heroTag: widget.searchHeroTag != null
              ? widget.searchHeroTag! + (function != null).toString()
              : null,
          quickFilters: widget.quickFilters,
          quickOptions: widget.quickOptions,
          searchData: searchData,
          isPinned: function != null,
          trailing: function != null
              ? IconButton(
                  icon: Icon(Icons.keyboard_arrow_up_rounded),
                  onPressed: () {
                    function();
                  })
              : null,
          prompt: widget.searchBarMessage,
          backgroundColor: widget.searchBarColor,
          onSubmit: (data) {
            setState(() {
              searchData = data;
            });
            if (widget.onChanged != null) widget.onChanged!(data);
            controller.refresh();
          },
        ),
      );
    }

    Widget child = Container(
      color: AppColor.onBackground,
      child: Builder(
        builder: (context) {
          if (searchData.searchFilters!.searchType == SearchType.repositories)
            return _InfiniteWrapper<RepositoryModel>(
              controller: controller,
              searchData: searchData,
              filterFn: widget.filterFn,
              isNestedScrollViewChild: widget.isNestedScrollViewChild,
              scrollController: widget.scrollController,
              searchFuture: (pageNumber, pageSize, refresh, _) {
                return SearchService.searchRepos(searchData.toQuery,
                    perPage: pageSize,
                    page: pageNumber,
                    sort: searchData.getSort,
                    ascending: searchData.isSortAsc,
                    refresh: refresh);
              },
              header: (context) => header(context, null),
              pinnedHeader: searchData.isActive ? header : null,
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
              filterFn: widget.filterFn,
              controller: controller,
              searchData: searchData,
              scrollController: widget.scrollController,
              searchFuture: (pageNumber, pageSize, refresh, _) {
                return SearchService.searchIssues(searchData.toQuery,
                    perPage: pageSize,
                    page: pageNumber,
                    sort: searchData.getSort,
                    ascending: searchData.isSortAsc,
                    refresh: refresh);
              },
              isNestedScrollViewChild: widget.isNestedScrollViewChild,
              header: (context) => header(context, null),
              pinnedHeader: searchData.isActive ? header : null,
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
              filterFn: widget.filterFn,
              controller: controller,
              searchData: searchData,
              scrollController: widget.scrollController,
              header: (context) => header(context, null),
              pinnedHeader: searchData.isActive ? header : null,
              searchFuture: (pageNumber, pageSize, refresh, _) {
                return SearchService.searchUsers(searchData.toQuery,
                    perPage: pageSize,
                    page: pageNumber,
                    sort: searchData.getSort,
                    ascending: searchData.isSortAsc,
                    refresh: refresh);
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
    if (widget.replacementBuilder != null)
      return widget.replacementBuilder!(searchData, header, child);
    return child;
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
  final ReplacementBuilder? pinnedHeader;

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
      paginationKey: ValueKey(searchData.toQuery +
          searchData.isActive.toString() +
          searchData.sort),
      divider: false,
      pinnedHeader: pinnedHeader,
      shrinkWrap: true,
      spacing: 4,
      isNestedScrollViewChild: isNestedScrollViewChild,
      topSpacing: 0,
      builder: builder,
    );
  }
}
