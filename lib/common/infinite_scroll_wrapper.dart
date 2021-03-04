import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:onehub/style/colors.dart';

import 'loading_indicator.dart';

class InfiniteScrollWrapperController {
  void Function() refresh;
}

/// A wrapper designed to show infinite pagination.
/// [T] type is defined for the kind of elements to be displayed.
class InfiniteScrollWrapper<T> extends StatefulWidget {
  /// How to display the data. Give
  final builder;

  /// The future to fetch data to display from.
  /// Gives you the current [pageNumber] and [pageSize].
  final future;

  /// The future to fetch data to display from if the page is refreshed.
  /// Gives you the current [pageNumber] and [pageSize].
  final refreshFuture;

  /// Total number of elements in each page. Default value is **10**.
  final int pageSize;

  /// Vertical spacing between each element.
  final double spacing;

  /// Show a divider between each element. Defaults to true.
  final bool divider;

  /// Filter the results before displaying them.
  /// Gives the list of results that can be modified and returned.
  final filterFn;

  /// A controller to call the refresh function if required.
  final InfiniteScrollWrapperController controller;

  InfiniteScrollWrapper(
      {Key key,
      this.future,
      this.builder,
      this.refreshFuture,
      this.controller,
      this.filterFn,
      this.divider = true,
      this.pageSize = 10,
      this.spacing = 16})
      : super(key: key);

  @override
  _InfiniteScrollWrapperState<T> createState() =>
      _InfiniteScrollWrapperState(controller);
}

class _InfiniteScrollWrapperState<T> extends State<InfiniteScrollWrapper> {
  _InfiniteScrollWrapperState(InfiniteScrollWrapperController _controller) {
    _controller.refresh = refreshFilters;
  }

  int pageNumber = 1;
  final PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 0);
  bool refresh = false;
  @override
  void initState() {
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

  void refreshFilters() {
    refresh = true;
    pageNumber = 1;
    _pagingController.refresh();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = refresh
          ? await widget.refreshFuture(pageNumber, widget.pageSize)
          : await widget.future(pageNumber, widget.pageSize);
      final isLastPage = newItems.length < widget.pageSize;
      var filteredItems;
      if (widget.filterFn != null)
        filteredItems = widget.filterFn(newItems) ?? <T>[];
      else
        filteredItems = newItems;
      if (isLastPage) {
        _pagingController.appendLastPage(filteredItems);
        refresh = false;
      } else {
        pageNumber++;
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(filteredItems, nextPageKey);
      }
    } catch (error) {
      print(error);
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColor.accent,
      onRefresh: () => Future.sync(() async {
        refreshFilters();
      }),
      child: PagedListView<int, T>(
        physics: BouncingScrollPhysics(),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<T>(
          itemBuilder: (context, T item, index) => Column(children: [
            Visibility(
              visible: widget.divider,
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
          firstPageProgressIndicatorBuilder: (context) => LoadingIndicator(),
          newPageProgressIndicatorBuilder: (context) => Padding(
            padding: const EdgeInsets.all(32.0),
            child: LoadingIndicator(),
          ),
          noItemsFoundIndicatorBuilder: (context) => Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'And then there were none.',
              style: TextStyle(color: AppColor.grey3),
            ),
          )),
          noMoreItemsIndicatorBuilder: (context) => Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'The end of the line.',
              style: TextStyle(color: AppColor.grey3),
            ),
          )),
        ),
      ),
    );
  }
}
