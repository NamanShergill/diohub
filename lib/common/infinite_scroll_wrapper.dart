import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'loading_indicator.dart';

class InfiniteScrollWrapper<T> extends StatefulWidget {
  final future;
  final builder;
  final int pageSize;
  InfiniteScrollWrapper({Key key, this.future, this.builder, this.pageSize = 5})
      : super(key: key);

  @override
  _InfiniteScrollWrapperState<T> createState() => _InfiniteScrollWrapperState();
}

class _InfiniteScrollWrapperState<T> extends State<InfiniteScrollWrapper> {
  int pageNumber = 0;
  final PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 0);
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant InfiniteScrollWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await widget.future(pageNumber, widget.pageSize);
      final isLastPage = newItems.length < widget.pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        pageNumber++;
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      print(error);
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, T>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: (context, T item, index) =>
            Column(children: [Divider(), widget.builder(context, item, index)]),
        firstPageProgressIndicatorBuilder: (context) => LoadingIndicator(),
      ),
    );
  }
}
