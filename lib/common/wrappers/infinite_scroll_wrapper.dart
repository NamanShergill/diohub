import 'package:dio/dio.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// Controller for [InfiniteScrollWrapper].
class InfiniteScrollWrapperController {
  late void Function() refresh;
}

typedef ScrollWrapperFuture<T> = Future Function(
    int pageNumber, int pageSize, bool refresh, T? lastItem);
typedef ScrollWrapperBuilder<T> = Widget Function(
    BuildContext context, T item, int index, bool refresh);
typedef FilterFn<T> = Function(List<T> items);

/// A wrapper designed to show infinite pagination.
/// [T] type is defined for the kind of elements to be displayed.
class InfiniteScrollWrapper<T> extends StatefulWidget {
  /// How to display the data. Give
  final ScrollWrapperBuilder<T> builder;

  /// The future to fetch data to display from.
  /// Gives you the current [pageNumber] and [pageSize], in that order.
  final ScrollWrapperFuture<T> future;

  /// Total number of elements in each page. Default value is **10**.
  final int pageSize;

  /// Page Number to start with. Default value is **1**.
  final int pageNumber;

  /// Vertical spacing between each element.
  final double spacing;

  /// Show a divider between each element. Defaults to true.
  final bool divider;

  /// Show divider above the first item.
  final bool firstDivider;

  /// Filter the results before displaying them.
  /// Gives the list of results that can be modified and returned.
  final FilterFn<T>? filterFn;

  /// A controller to call the refresh function if required.
  final InfiniteScrollWrapperController? controller;

  /// Spacing to add to the top of the list.
  final double topSpacing;

  /// Spacing to add to the bottom of the list.
  final double bottomSpacing;

  /// Show the list end indicator or not.
  final bool listEndIndicator;

  /// Header to show above the list.
  final WidgetBuilder? header;

  /// First page loading indicator.
  final WidgetBuilder? firstPageLoadingBuilder;

  /// ListView ScrollController.
  final ScrollController? scrollController;

  // Disable refreshing.
  final bool disableRefresh;

  /// Disable scrolling.
  final bool disableScroll;

  final bool shrinkWrap;

  /// Is the child of a nested scroll view.
  final bool isNestedScrollViewChild;

  /// Pinned header to show on scroll.
  final ReplacementBuilder? pinnedHeader;

  /// Show scroll to top button.
  final bool showScrollToTopButton;

  /// [Key] to give the infinite scroll wrapper to force it to rebuild the list
  /// on new data,
  final Key? paginationKey;

  const InfiniteScrollWrapper(
      {Key? key,
      required this.future,
      required this.builder,
      this.controller,
      this.filterFn,
      this.paginationKey,
      this.bottomSpacing = 0,
      this.header,
      this.pinnedHeader,
      this.showScrollToTopButton = true,
      this.pageNumber = 1,
      this.divider = true,
      this.pageSize = 10,
      this.topSpacing = 0,
      this.isNestedScrollViewChild = false,
      this.disableScroll = false,
      this.disableRefresh = false,
      this.firstDivider = true,
      this.firstPageLoadingBuilder,
      this.scrollController,
      this.shrinkWrap = false,
      this.listEndIndicator = true,
      this.spacing = 16})
      : assert(isNestedScrollViewChild ? scrollController != null : true),
        super(key: key);

  @override
  _InfiniteScrollWrapperState<T> createState() => _InfiniteScrollWrapperState();
}

class _InfiniteScrollWrapperState<T> extends State<InfiniteScrollWrapper<T?>> {
  late InfiniteScrollWrapperController controller;
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = widget.scrollController ?? ScrollController();
    controller = widget.controller ?? InfiniteScrollWrapperController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = CustomScrollView(
      controller: widget.isNestedScrollViewChild ? null : scrollController,
      physics: widget.disableScroll
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      shrinkWrap: widget.shrinkWrap,
      slivers: [
        if (widget.isNestedScrollViewChild)
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
        MultiSliver(
          children: [
            if (widget.header != null)
              SliverToBoxAdapter(
                child: widget.header!(context),
              ),
            _InfinitePagination<T>(
                future: widget.future,
                builder: widget.builder,
                controller: controller,
                key: widget.paginationKey,
                filterFn: widget.filterFn,
                firstPageLoadingBuilder: widget.firstPageLoadingBuilder,
                bottomSpacing: widget.bottomSpacing,
                pageNumber: widget.pageNumber,
                divider: widget.divider,
                pageSize: widget.pageSize,
                topSpacing: widget.topSpacing,
                firstDivider: widget.firstDivider,
                listEndIndicator: widget.listEndIndicator,
                spacing: widget.spacing),
          ],
        ),
      ],
    );

    if (!widget.disableRefresh) {
      child = RefreshIndicator(
        color: Colors.white,
        onRefresh: () => Future.sync(() async {
          controller.refresh();
        }),
        child: child,
      );
    }

    if (widget.showScrollToTopButton) {
      child = ScrollWrapper(
        scrollController: scrollController,
        child: child,
        promptTheme: PromptButtonTheme(color: AppColor.accent),
        promptReplacementBuilder: widget.pinnedHeader,
      );
    }

    return child;
  }
}

class _InfinitePagination<T> extends StatefulWidget {
  /// How to display the data. Give
  final ScrollWrapperBuilder<T> builder;

  /// The future to fetch data to display from.
  /// Gives you the current [pageNumber] and [pageSize], in that order.
  final ScrollWrapperFuture<T> future;

  /// Total number of elements in each page. Default value is **10**.
  final int pageSize;

  /// Page Number to start with. Default value is **1**.
  final int pageNumber;

  /// Show a divider between each element. Defaults to true.
  final bool divider;

  /// Show divider above the first item.
  final bool firstDivider;

  /// Filter the results before displaying them.
  /// Gives the list of results that can be modified and returned.
  final FilterFn<T>? filterFn;

  /// A controller to call the refresh function if required.
  final InfiniteScrollWrapperController controller;

  /// Vertical spacing between each element.
  final double spacing;

  /// Spacing to add to the top of the list.
  final double topSpacing;

  /// Spacing to add to the bottom of the list.
  final double bottomSpacing;

  /// Show the list end indicator or not.
  final bool listEndIndicator;

  /// First page loading indicator.
  final WidgetBuilder? firstPageLoadingBuilder;

  const _InfinitePagination(
      {Key? key,
      required this.future,
      required this.builder,
      this.filterFn,
      required this.controller,
      this.firstPageLoadingBuilder,
      required this.bottomSpacing,
      required this.pageNumber,
      required this.divider,
      required this.pageSize,
      required this.topSpacing,
      required this.firstDivider,
      required this.listEndIndicator,
      required this.spacing})
      : super(key: key);

  @override
  _InfinitePaginationState<T> createState() => _InfinitePaginationState();
}

class _InfinitePaginationState<T> extends State<_InfinitePagination<T>> {
  // Define the paging controller.
  final PagingController<int, _ListItem<T>> _pagingController =
      PagingController(firstPageKey: 0);

  // Start off with the first page.
  late int pageNumber;

  // If the API results are supposed to be refreshed
  // or be fetched from cache, if available.
  bool refresh = false;

  @override
  void initState() {
    setupController();
    pageNumber = widget.pageNumber;
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  void setupController() {
    widget.controller.refresh = resetAndRefresh;
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  // Refresh everything and reload.
  void resetAndRefresh() {
    refresh = true;
    pageNumber = widget.pageNumber;
    _pagingController.refresh();
  }

  // Fetch the data to display.
  Future<void> _fetchPage(int pageKey) async {
    try {
      // Use the supplied APIs accordingly, based on the *refresh* value.
      final newItems = await widget.future(pageNumber, widget.pageSize, refresh,
          _pagingController.itemList?.last.item);
      // Check if it is the last page of results.
      final isLastPage = newItems.length < widget.pageSize;
      List<T> filteredItems;
      // Filter items based on the provided filterFn.
      if (widget.filterFn != null) {
        filteredItems = widget.filterFn!(newItems) ?? <T>[];
      } else {
        filteredItems = newItems;
      }
      // If the last page, set refresh value to false,
      // as all pages have been refreshed.
      if (isLastPage) {
        if (mounted) {
          _pagingController.appendLastPage(
              filteredItems.map((e) => _ListItem(e, refresh)).toList());
        }
        refresh = false;
      } else {
        pageNumber++;
        final nextPageKey = pageKey + newItems.length;
        if (mounted) {
          _pagingController.appendPage(
              filteredItems.map((e) => _ListItem(e, refresh)).toList(),
              nextPageKey as int?);
        }
      }
    } catch (error) {
      if (error is DioError) {
        Global.log.e(error.response?.data);
        if (mounted) _pagingController.error = error.response?.data;
      } else {
        Global.log.e(error.toString());
        if (mounted) _pagingController.error = error;
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedSliverList<int, _ListItem<T>>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<_ListItem<T>>(
        itemBuilder: (context, _ListItem<T> item, index) => Column(children: [
          if (index == 0)
            SizedBox(
              height: widget.topSpacing,
            ),
          Visibility(
            visible:
                widget.divider && (index == 0 ? widget.firstDivider : true),
            child: Divider(
              height: widget.spacing,
            ),
          ),
          Padding(
            padding: widget.divider
                ? const EdgeInsets.all(0)
                : EdgeInsets.only(top: widget.spacing),
            child:
                widget.builder(context, item.item, index, item.refreshChildren),
          ),
        ]),
        firstPageProgressIndicatorBuilder: (context) =>
            widget.firstPageLoadingBuilder != null
                ? widget.firstPageLoadingBuilder!(context)
                : const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: LoadingIndicator(),
                  ),
        newPageProgressIndicatorBuilder: (context) => const Padding(
          padding: EdgeInsets.all(32.0),
          child: LoadingIndicator(),
        ),
        noItemsFoundIndicatorBuilder: (context) => Center(
            child: Column(
          children: [
            SizedBox(
              height: widget.topSpacing,
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'And then there were none.',
                    style: TextStyle(color: AppColor.grey3),
                  ),
                ),
              ),
            ),
          ],
        )),
        noMoreItemsIndicatorBuilder: (context) => widget.listEndIndicator
            ? Center(
                child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'The end of the line.',
                      style: TextStyle(color: AppColor.grey3),
                    ),
                    SizedBox(
                      height: widget.bottomSpacing,
                    ),
                  ],
                ),
              ))
            : Padding(
                padding: EdgeInsets.only(bottom: widget.bottomSpacing),
                child: Container(),
              ),
      ),
    );
  }
}

class _ListItem<T> {
  final T item;
  bool refresh;
  _ListItem(this.item, this.refresh);

  bool get refreshChildren {
    bool temp = refresh;
    refresh = false;
    return temp;
  }
}
