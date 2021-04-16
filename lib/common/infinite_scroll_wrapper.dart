import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:onehub/app/global.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/style/animDuartions.dart';
import 'package:onehub/style/colors.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'loading_indicator.dart';

/// Controller for [InfiniteScrollWrapper].
class InfiniteScrollWrapperController {
  void Function() refresh = () {};
}

typedef ScrollWrapperFuture<T>(
    int pageNumber, int pageSize, bool refresh, T? lastItem);
typedef ScrollWrapperBuilder<T>(BuildContext context, T item, int index);
typedef FilterFn<T>(List<T> items);

/// A wrapper designed to show infinite pagination.
/// [T] type is defined for the kind of elements to be displayed.
class InfiniteScrollWrapper<T> extends StatefulWidget {
  /// How to display the data. Give
  final ScrollWrapperBuilder<T>? builder;

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

  final bool disableScroll;

  final bool shrinkWrap;

  final bool isNestedScrollViewChild;

  final WidgetBuilder? pinnedHeader;

  final bool showScrollToTopButton;

  final double scrollOffsetForPinnedHeader;

  InfiniteScrollWrapper(
      {Key? key,
      required this.future,
      this.builder,
      this.controller,
      this.filterFn,
      this.bottomSpacing = 0,
      this.header,
      this.pinnedHeader,
      this.showScrollToTopButton = true,
      this.pageNumber = 1,
      this.divider = true,
      this.pageSize = 10,
      this.topSpacing = 0,
      this.isNestedScrollViewChild = false,
      this.scrollOffsetForPinnedHeader = 300,
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
  _InfiniteScrollWrapperState<T> createState() =>
      _InfiniteScrollWrapperState(controller);
}

class _InfiniteScrollWrapperState<T> extends State<InfiniteScrollWrapper<T?>> {
  _InfiniteScrollWrapperState(InfiniteScrollWrapperController? _controller) {
    if (_controller != null) _controller.refresh = resetAndRefresh;
  }

  // Start off with the first page.
  late int pageNumber;

  // Define the paging controller.
  final PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 0);

  // If the API results are supposed to be refreshed
  // or be fetched from cache, if available.
  bool refresh = false;

  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = widget.scrollController ?? ScrollController();
    pageNumber = widget.pageNumber;
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  // Refresh everything and reload.
  void resetAndRefresh() {
    refresh = true;
    pageNumber = 1;
    _pagingController.refresh();
  }

  // Fetch the data to display.
  Future<void> _fetchPage(int pageKey) async {
    try {
      // Use the supplied APIs accordingly, based on the *refresh* value.
      final newItems = await widget.future(pageNumber, widget.pageSize, refresh,
          _pagingController.itemList?.last);
      // Check if it is the last page of results.
      final isLastPage = newItems.length < widget.pageSize;
      var filteredItems;
      // Filter items based on the provided filterFn.
      if (widget.filterFn != null)
        filteredItems = widget.filterFn!(newItems) ?? <T>[];
      else
        filteredItems = newItems;
      // If the last page, set refresh value to false,
      // as all pages have been refreshed.
      if (isLastPage) {
        if (mounted) _pagingController.appendLastPage(filteredItems);
        refresh = false;
      } else {
        pageNumber++;
        final nextPageKey = pageKey + newItems.length;
        if (mounted)
          _pagingController.appendPage(filteredItems, nextPageKey as int?);
      }
    } catch (error) {
      if (error is DioError) {
        Global.log.e(error.response?.data);
        if (mounted) _pagingController.error = error.response?.data;
      } else {
        Global.log.e(error.toString());
        _pagingController.error = error;
      }
    }
  }

  bool scrollAtOffset = false;
  @override
  Widget build(BuildContext context) {
    Widget child = CustomScrollView(
      controller: widget.isNestedScrollViewChild ? null : scrollController,
      physics: widget.disableScroll
          ? NeverScrollableScrollPhysics()
          : BouncingScrollPhysics(),
      shrinkWrap: widget.shrinkWrap,
      slivers: [
        if (widget.isNestedScrollViewChild)
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
        if (widget.pinnedHeader != null)
          SliverPinnedHeader(
              child: SizeExpandedSection(
            expand: scrollAtOffset,
            child: widget.pinnedHeader!(context),
          )),
        SliverStack(
          children: [
            MultiSliver(
              children: [
                if (widget.header != null)
                  SliverToBoxAdapter(
                    child: widget.header!(context),
                  ),
                PagedSliverList<int, T>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<T>(
                    itemBuilder: (context, T item, index) => Column(children: [
                      if (index == 0)
                        SizedBox(
                          height: widget.topSpacing,
                        ),
                      Visibility(
                        visible: widget.divider &&
                            (index == 0 ? widget.firstDivider : true),
                        child: Divider(
                          height: widget.spacing,
                        ),
                      ),
                      Padding(
                        padding: widget.divider
                            ? EdgeInsets.all(0)
                            : EdgeInsets.only(top: widget.spacing),
                        child: widget.builder!(context, item, index),
                      ),
                    ]),
                    firstPageProgressIndicatorBuilder: (context) =>
                        widget.firstPageLoadingBuilder != null
                            ? widget.firstPageLoadingBuilder!(context)
                            : Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: LoadingIndicator(),
                              ),
                    newPageProgressIndicatorBuilder: (context) => Padding(
                      padding: const EdgeInsets.all(32.0),
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
                    noMoreItemsIndicatorBuilder: (context) => widget
                            .listEndIndicator
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
                            padding:
                                EdgeInsets.only(bottom: widget.bottomSpacing),
                            child: Container(),
                          ),
                  ),
                ),
              ],
            ),
            if (widget.showScrollToTopButton)
              SliverPinnedHeader(
                  child: SizeExpandedSection(
                expand: scrollAtOffset,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ClipOval(
                        child: Material(
                          elevation: 2,
                          type: MaterialType.circle,
                          color: AppColor.accent,
                          child: InkWell(
                            onTap: () {
                              scrollController.animateTo(0,
                                  duration:
                                      AppThemeAnimDurations.defaultAnimDuration,
                                  curve: Curves.easeIn);
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_drop_up),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          ],
        ),
      ],
    );

    if (!widget.disableRefresh)
      child = RefreshIndicator(
        color: Colors.white,
        onRefresh: () => Future.sync(() async {
          resetAndRefresh();
        }),
        child: child,
      );

    child = SizeExpandedSection(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels >
                  widget.scrollOffsetForPinnedHeader &&
              !scrollAtOffset)
            setState(() {
              scrollAtOffset = true;
            });
          else if (notification.metrics.pixels <=
                  widget.scrollOffsetForPinnedHeader &&
              scrollAtOffset)
            setState(() {
              scrollAtOffset = false;
            });
          return true;
        },
        child: child,
      ),
    );

    return child;
  }
}
