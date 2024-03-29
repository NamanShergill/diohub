import 'package:dio/dio.dart';
import 'package:diohub/app/global.dart';
import 'package:diohub/common/misc/button.dart';
import 'package:diohub/common/misc/loading_indicator.dart';
import 'package:diohub/common/wrappers/scroll_to_top_wrapper.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:flutter_scroll_to_top/modified_scroll_view.dart' as scrollview;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// Controller for [InfiniteScrollWrapper].
class InfiniteScrollWrapperController {
  late void Function() refresh;
}

class ScrollWrapperFutureArguments<T> {
  ScrollWrapperFutureArguments({
    required this.pageNumber,
    required this.pageSize,
    required this.refresh,
    required this.lastItem,
  });

  final int pageNumber;
  final int pageSize;
  final bool refresh;
  final T? lastItem;
}

class ScrollWrapperBuilderData<T> {
  ScrollWrapperBuilderData({
    required this.item,
    required this.index,
    required this.refresh,
    required this.isCurrentlyLast,
  });

  final T item;
  final int index;
  final bool refresh;
  final bool isCurrentlyLast;
}

typedef ScrollWrapperFuture<T> = Future<List<T>> Function(
  ScrollWrapperFutureArguments<T> data,
);
typedef ScrollWrapperBuilder<T> = Widget Function(
  BuildContext context,
  ScrollWrapperBuilderData<T> data,
);
typedef FilterFn<T> = Function(List<T> items);

/// A wrapper designed to show infinite pagination.
/// [T] type is defined for the kind of elements to be displayed.
class InfiniteScrollWrapper<T> extends StatefulWidget {
  const InfiniteScrollWrapper({
    required this.future,
    required this.builder,
    super.key,
    this.controller,
    // this.nestedScrollViewController,
    this.filterFn,
    this.paginationKey,
    this.separatorBuilder,
    this.header,
    this.pinnedHeader,
    this.showScrollToTopButton = true,
    this.pageNumber = 1,
    this.pageSize = 10,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.disableScroll = false,
    this.disableRefresh = false,
    this.firstPageLoadingBuilder,
    this.scrollController,
    this.shrinkWrap = false,
    this.listEndIndicator = true,
  });

  /// How to display the data. Give
  final ScrollWrapperBuilder<T> builder;

  /// The future to fetch data to display from.
  /// Gives you the current [pageNumber] and [pageSize], in that order.
  final ScrollWrapperFuture<T> future;

  /// Total number of elements in each page. Default value is **10**.
  final int pageSize;

  /// Page Number to start with. Default value is **1**.
  final int pageNumber;

  final IndexedWidgetBuilder? separatorBuilder;

  /// Filter the results before displaying them.
  /// Gives the list of results that can be modified and returned.
  final FilterFn<T>? filterFn;

  /// A controller to call the refresh function if required.
  final InfiniteScrollWrapperController? controller;

  /// Spacing to add to the top of the list.
  final EdgeInsets padding;

  /// Show the list end indicator or not.
  final bool listEndIndicator;

  /// Header to show above the list.
  final WidgetBuilder? header;

  /// First page loading indicator.
  final WidgetBuilder? firstPageLoadingBuilder;

  /// ListView ScrollController.
  final ScrollController? scrollController;

  // final ScrollController? nestedScrollViewController;

  // Disable refreshing.
  final bool disableRefresh;

  /// Disable scrolling.
  final bool disableScroll;

  final bool shrinkWrap;

  /// Pinned header to show on scroll.
  final ReplacementBuilder? pinnedHeader;

  /// Show scroll to top button.
  final bool showScrollToTopButton;

  /// [Key] to give the infinite scroll wrapper to force it to rebuild the list
  /// on new data,
  final Key? paginationKey;

  @override
  InfiniteScrollWrapperState<T> createState() =>
      InfiniteScrollWrapperState<T>();
}

class InfiniteScrollWrapperState<T> extends State<InfiniteScrollWrapper<T>> {
  late InfiniteScrollWrapperController controller;

  @override
  void initState() {
    // scrollController =
    //     // widget.isNestedScrollViewChild
    //     //     ? null :
    //     widget.scrollController ?? ScrollController();
    controller = widget.controller ?? InfiniteScrollWrapperController();
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    Widget scrollView(final ScrollViewProperties? properties) {
      final ScrollPhysics physics = widget.disableScroll
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics();
      final List<MultiSliver> slivers = <MultiSliver>[
        MultiSliver(
          children: <Widget>[
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
              padding: widget.padding,
              pageNumber: widget.pageNumber,
              separatorBuilder: widget.separatorBuilder,
              pageSize: widget.pageSize,
              listEndIndicator: widget.listEndIndicator,
            ),
          ],
        ),
      ];
      if (properties != null) {
        return scrollview.CustomScrollView(
          properties: properties,
          physics: physics,
          shrinkWrap: widget.shrinkWrap,
          slivers: slivers,
        );
      } else {
        return CustomScrollView(
          controller: widget.scrollController,
          shrinkWrap: widget.shrinkWrap,
          physics: physics,
          slivers: slivers,
        );
      }
    }

    Widget refreshIndicator({final ScrollViewProperties? properties}) {
      if (!widget.disableRefresh) {
        return RefreshIndicator(
          // color:
          //     Provider.of<PaletteSettings>(context).currentSetting.baseElements,
          onRefresh: () => Future<void>.sync(() async {
            controller.refresh();
          }),
          child: scrollView(properties),
        );
      } else {
        return scrollView(properties);
      }
    }

    Widget child() {
      if (widget.showScrollToTopButton) {
        return ScrollToTopWrapper(
          alwaysVisibleAtOffset: widget.pinnedHeader != null,
          scrollController: widget.scrollController,
          promptTheme: PromptButtonTheme(
            color: context.colorScheme.primary,
          ),
          promptReplacementBuilder: widget.pinnedHeader,
          builder: (
            final BuildContext context,
            final ScrollViewProperties properties,
          ) =>
              refreshIndicator(properties: properties),
        );
      } else {
        return refreshIndicator();
      }
    }

    return child();
  }
}

class _InfinitePagination<T> extends StatefulWidget {
  const _InfinitePagination({
    required this.future,
    required this.builder,
    required this.filterFn,
    required this.controller,
    required this.firstPageLoadingBuilder,
    required this.pageNumber,
    required this.pageSize,
    required this.padding,
    required this.separatorBuilder,
    required this.listEndIndicator,
    super.key,
  });

  /// How to display the data. Give
  final ScrollWrapperBuilder<T> builder;

  /// The future to fetch data to display from.
  /// Gives you the current [pageNumber] and [pageSize], in that order.
  final ScrollWrapperFuture<T> future;

  /// Total number of elements in each page. Default value is **10**.
  final int pageSize;

  /// Page Number to start with. Default value is **1**.
  final int pageNumber;

  final EdgeInsets padding;

  /// Filter the results before displaying them.
  /// Gives the list of results that can be modified and returned.
  final FilterFn<T>? filterFn;

  /// A controller to call the refresh function if required.
  final InfiniteScrollWrapperController controller;

  final IndexedWidgetBuilder? separatorBuilder;

  /// Show the list end indicator or not.
  final bool listEndIndicator;

  /// First page loading indicator.
  final WidgetBuilder? firstPageLoadingBuilder;

  @override
  _InfinitePaginationState<T> createState() => _InfinitePaginationState<T>();
}

class _InfinitePaginationState<T> extends State<_InfinitePagination<T>> {
  // Define the paging controller.
  final PagingController<int, _ListItem<T>> _pagingController =
      PagingController<int, _ListItem<T>>(firstPageKey: 0);

  // Start off with the first page.
  late int pageNumber;

  // If the API results are supposed to be refreshed
  // or be fetched from cache, if available.
  bool refresh = false;

  @override
  void initState() {
    setupController();
    pageNumber = widget.pageNumber;
    _pagingController.addPageRequestListener(_fetchPage);

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
  Future<void> _fetchPage(final int pageKey) async {
    try {
      // log.log(Level.debug, 'Fetching page $pageNumber, key:$pageKey, $this');
      // Use the supplied APIs accordingly, based on the *refresh* value.
      final List<T> newItems = await widget.future(
        ScrollWrapperFutureArguments<T>(
          pageNumber: pageNumber,
          pageSize: widget.pageSize,
          refresh: refresh,
          lastItem: _pagingController.itemList?.last.item,
        ),
      );
      // Check if it is the last page of results.
      final bool isLastPage = newItems.length < widget.pageSize;
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
            filteredItems
                .map((final T e) => _ListItem<T>(e, refresh: refresh))
                .toList(),
          );
        }
        refresh = false;
      } else {
        pageNumber++;
        final int nextPageKey = pageKey + newItems.length;
        if (mounted) {
          _pagingController.appendPage(
            filteredItems
                .map((final T e) => _ListItem<T>(e, refresh: refresh))
                .toList(),
            nextPageKey,
          );
        }
      }
    } on DioException catch (error, s) {
      log.e(error.response?.data, stackTrace: s);
      if (mounted) {
        _pagingController.error = error.response?.data;
      }
      rethrow;
      // Can't really do anything about this, the widget is not propagating the error above.
      // ignore: avoid_catches_without_on_clauses
    } catch (error) {
      {
        log.e(
          'Pagination exception',
          error: error,
        );
        if (mounted) {
          _pagingController.error = error;
        }
      }
      rethrow;
    }
  }

  @override
  Widget build(final BuildContext context) =>
      PagedSliverList<int, _ListItem<T>>.separated(
        pagingController: _pagingController,
        separatorBuilder:
            widget.separatorBuilder ?? (final _, final __) => Container(),
        builderDelegate: PagedChildBuilderDelegate<_ListItem<T>>(
          itemBuilder: (
            final BuildContext context,
            final _ListItem<T> item,
            final int index,
          ) =>
              Column(
            children: <Widget>[
              if (index == 0)
                SizedBox(
                  height: widget.padding.top,
                ),
              widget.builder(
                context,
                ScrollWrapperBuilderData<T>(
                  item: item.item,
                  index: index,
                  refresh: item.refreshChildren,
                  isCurrentlyLast:
                      (_pagingController.itemList?.length ?? 0) - 1 == index,
                ),
              ),
            ],
          ),
          firstPageProgressIndicatorBuilder: (final BuildContext context) =>
              widget.firstPageLoadingBuilder?.call(context) ??
              const Padding(
                padding: EdgeInsets.all(32),
                child: LoadingIndicator(),
              ),
          newPageProgressIndicatorBuilder: (final BuildContext context) =>
              const Padding(
            padding: EdgeInsets.all(32),
            child: LoadingIndicator(),
          ),
          noItemsFoundIndicatorBuilder: (final BuildContext context) => Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: widget.padding.top,
                ),
                const Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Nothing to see here.',
                        style: TextStyle(
                            // color: Provider.of<PaletteSettings>(context)
                            //     .currentSetting
                            //     .faded3,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          noMoreItemsIndicatorBuilder: (final BuildContext context) =>
              widget.listEndIndicator
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '----*----',
                              style: context.textTheme.labelSmall?.asHint(),
                            ),
                            SizedBox(
                              height: widget.padding.bottom,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(bottom: widget.padding.bottom),
                      child: Container(),
                    ),
          firstPageErrorIndicatorBuilder: (final BuildContext context) =>
              _FirstPageErrorIndicator(
            onTryAgain: _pagingController.retryLastFailedRequest,
            error: _pagingController.error,
          ),
        ),
      );
}

class _ListItem<T> {
  _ListItem(this.item, {required this.refresh});

  final T item;
  bool refresh;

  bool get refreshChildren {
    final bool temp = refresh;
    refresh = false;
    return temp;
  }
}

class _FirstPageErrorIndicator extends StatelessWidget {
  const _FirstPageErrorIndicator({
    required this.error,
    this.onTryAgain,
  });

  final Object? error;
  final VoidCallback? onTryAgain;

  @override
  Widget build(final BuildContext context) => _FirstPageExceptionIndicator(
        title: 'Something went wrong',
        message: error is Error
            ? (error! as Error).stackTrace.toString()
            : error.toString(),
        onTryAgain: onTryAgain,
      );
}

class _FirstPageExceptionIndicator extends StatelessWidget {
  const _FirstPageExceptionIndicator({
    required this.title,
    this.message,
    this.onTryAgain,
    super.key,
  });

  final String title;
  final String? message;
  final VoidCallback? onTryAgain;

  @override
  Widget build(final BuildContext context) {
    final String? message = this.message;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: Button(
          onTap: onTryAgain,
          child: const Text(
            'Retry',
          ),
        ),
      ),
    );
  }
}
