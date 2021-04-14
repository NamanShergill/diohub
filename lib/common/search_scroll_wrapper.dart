import 'package:flutter/material.dart';
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

class SearchScrollWrapper extends StatefulWidget {
  final SearchData searchData;
  final ScrollWrapperFuture? nonSearchFuture;
  final FilterFn? filterFn;
  final String? searchBarMessage;
  final String? searchHeroTag;
  final EdgeInsets padding;
  final EdgeInsets _searchBarPadding;
  final backgroundBuilder;
  final Color searchBarColor;
  final WidgetBuilder? header;
  final List<String>? applyFiltersOnOpen;
  final WidgetBuilder? nonSearchBuilder;
  final ValueChanged<SearchData>? onChanged;
  SearchScrollWrapper(this.searchData,
      {this.nonSearchFuture,
      this.searchBarMessage,
      this.applyFiltersOnOpen,
      this.header,
      this.backgroundBuilder,
      this.nonSearchBuilder,
      EdgeInsets? searchBarPadding,
      this.onChanged,
      this.searchBarColor = AppColor.background,
      this.padding = const EdgeInsets.symmetric(horizontal: 16),
      this.searchHeroTag,
      this.filterFn,
      Key? key})
      : _searchBarPadding = searchBarPadding ?? padding,
        assert((nonSearchFuture == null) ==
            (nonSearchBuilder != null || header != null)),
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

  InfiniteScrollWrapperController controller =
      InfiniteScrollWrapperController();

  @override
  Widget build(BuildContext context) {
    Widget header(context) {
      return Padding(
        padding: widget._searchBarPadding,
        child: SearchBar(
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
          },
        ),
      );
    }

    if (searchData.searchFilters == null ||
        (!searchData.isActive &&
            (widget.nonSearchBuilder != null || widget.header != null)))
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.header != null) widget.header!(context),
          header(context),
          if (widget.nonSearchBuilder != null)
            Expanded(
              child: Padding(
                padding: widget.padding,
                child: widget.nonSearchBuilder!(context),
              ),
            ),
        ],
      );
    if (searchData.searchFilters!.searchType == SearchType.repositories)
      return _InfiniteWrapper<RepositoryModel>(
        key: Key(searchData.toQuery() + searchData.isActive.toString()),
        controller: controller,
        header: (context) {
          return header(context);
        },
        searchData: searchData,
        nonSearchFuture: (pageNumber, pageSize, refresh, _) {
          return widget.nonSearchFuture!(pageNumber, pageSize, refresh, _);
        },
        searchFuture: (pageNumber, pageSize, refresh, _) {
          return SearchService.searchRepos(searchData.toQuery(),
              perPage: pageSize, page: pageNumber);
        },
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
    else if (searchData.searchFilters!.searchType == SearchType.issues_pulls)
      return _InfiniteWrapper<IssueModel>(
        key: Key(searchData.toQuery() + searchData.isActive.toString()),
        filterFn: widget.filterFn,
        controller: controller,
        header: (context) {
          return header(context);
        },
        searchData: searchData,
        nonSearchFuture: (pageNumber, pageSize, refresh, _) {
          return widget.nonSearchFuture!(pageNumber, pageSize, refresh, _);
        },
        searchFuture: (pageNumber, pageSize, refresh, _) {
          return SearchService.searchIssues(searchData.toQuery(),
              perPage: pageSize, page: pageNumber);
        },
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
        key: Key(searchData.toQuery() + searchData.isActive.toString()),
        filterFn: widget.filterFn,
        controller: controller,
        header: (context) {
          return header(context);
        },
        searchData: searchData,
        nonSearchFuture: (pageNumber, pageSize, refresh, _) {
          return widget.nonSearchFuture!(pageNumber, pageSize, refresh, _);
        },
        searchFuture: (pageNumber, pageSize, refresh, _) {
          return SearchService.searchUsers(searchData.toQuery(),
              perPage: pageSize, page: pageNumber);
        },
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
  }
}

class _InfiniteWrapper<T> extends StatelessWidget {
  final InfiniteScrollWrapperController controller;
  final WidgetBuilder header;
  final ScrollWrapperFuture nonSearchFuture;
  final ScrollWrapperFuture searchFuture;
  final ScrollWrapperBuilder builder;
  final SearchData searchData;
  final FilterFn? filterFn;

  _InfiniteWrapper(
      {required this.builder,
      required this.header,
      required this.controller,
      this.filterFn,
      required this.nonSearchFuture,
      required this.searchFuture,
      required this.searchData,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InfiniteScrollWrapper<T>(
      pageSize: 20,
      controller: controller,
      header: header,
      filterFn: filterFn,
      future: (pageNumber, pageSize, refresh, _) {
        if (!searchData.isActive)
          return nonSearchFuture(pageNumber, pageSize, refresh, _);
        return searchFuture(pageNumber, pageSize, refresh, _);
      },
      divider: false,
      showHeaderOnNoItems: searchData.isActive,
      spacing: 4,
      topSpacing: 8,
      builder: builder,
    );
  }
}
