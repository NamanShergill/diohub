import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:onehub/app/global.dart';
import 'package:onehub/style/colors.dart';

import 'loading_indicator.dart';

/// Controller for [InfiniteScrollWrapper].
class InfiniteScrollWrapperController {
  void Function() refresh;
}

typedef ScrollWrapperFuture<T>(
    int pageNumber, int pageSize, bool refresh, T lastItem);
typedef ScrollWrapperBuilder<T>(BuildContext context, T item, int index);
typedef FilterFn<T>(List<T> items);

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
  final FilterFn<T> filterFn;

  /// A controller to call the refresh function if required.
  final InfiniteScrollWrapperController controller;

  /// Spacing to add to the top of the list.
  final double topSpacing;

  /// Spacing to add to the bottom of the list.
  final double bottomSpacing;

  /// Show the list end indicator or not.
  final bool listEndIndicator;

  /// Header to show above the list.
  final WidgetBuilder header;

  /// First page loading indicator.
  final WidgetBuilder firstPageLoadingBuilder;

  InfiniteScrollWrapper(
      {Key key,
      this.future,
      this.builder,
      this.controller,
      this.filterFn,
      this.bottomSpacing = 0,
      this.header,
      this.pageNumber = 1,
      this.divider = true,
      this.pageSize = 10,
      this.topSpacing = 0,
      this.firstDivider = true,
      this.firstPageLoadingBuilder,
      this.listEndIndicator = true,
      this.spacing = 16})
      : super(key: key);

  @override
  _InfiniteScrollWrapperState<T> createState() =>
      _InfiniteScrollWrapperState(controller);
}

class _InfiniteScrollWrapperState<T> extends State<InfiniteScrollWrapper<T>> {
  _InfiniteScrollWrapperState(InfiniteScrollWrapperController _controller) {
    if (_controller != null) _controller.refresh = resetAndRefresh;
  }

  // Start off with the first page.
  int pageNumber;

  // Define the paging controller.
  final PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 0);

  // If the API results are supposed to be refreshed
  // or be fetched from cache, if available.
  bool refresh = false;

  @override
  void initState() {
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
          _pagingController?.itemList?.last);
      // Check if it is the last page of results.
      final isLastPage = newItems.length < widget.pageSize;
      var filteredItems;
      // Filter items based on the provided filterFn.
      if (widget.filterFn != null)
        filteredItems = widget.filterFn(newItems) ?? <T>[];
      else
        filteredItems = newItems;
      // If the last page, set refresh value to false,
      // as all pages have been refreshed.
      if (isLastPage) {
        _pagingController.appendLastPage(filteredItems);
        refresh = false;
      } else {
        pageNumber++;
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(filteredItems, nextPageKey);
      }
    } catch (error) {
      Global.log.e(error);
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColor.accent,
      onRefresh: () => Future.sync(() async {
        resetAndRefresh();
      }),
      child: PagedListView<int, T>(
        physics: BouncingScrollPhysics(),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<T>(
          itemBuilder: (context, T item, index) => Column(children: [
            if (index == 0)
              Column(
                children: [
                  SizedBox(
                    height: widget.topSpacing,
                  ),
                  if (widget.header != null) widget.header(context),
                ],
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
                  ? EdgeInsets.all(0)
                  : EdgeInsets.only(top: widget.spacing),
              child: widget.builder(context, item, index),
            ),
          ]),
          firstPageProgressIndicatorBuilder: (context) =>
              widget.firstPageLoadingBuilder != null
                  ? widget.firstPageLoadingBuilder(context)
                  : LoadingIndicator(),
          newPageProgressIndicatorBuilder: (context) => Padding(
            padding: const EdgeInsets.all(32.0),
            child: LoadingIndicator(),
          ),
          noItemsFoundIndicatorBuilder: (context) => Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (widget.header != null) widget.header(context),
                Text(
                  'And then there were none.',
                  style: TextStyle(color: AppColor.grey3),
                ),
              ],
            ),
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
              : Container(),
        ),
      ),
    );
  }
}
