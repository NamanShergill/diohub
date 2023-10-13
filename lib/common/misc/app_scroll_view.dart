import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/app_bar.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/nested_scroll.dart';
import 'package:flutter/material.dart';

class AppScrollView extends StatefulWidget {
  const AppScrollView({
    required this.scrollViewAppBar,
    this.tabController,
    this.tabViews,
    // required this.nestedScrollViewController,
    this.child,
    // this.childrenColor,
    this.loading = false,
    super.key,
  });
  final Widget scrollViewAppBar;
  final List<Widget>? tabViews;
  final Widget? child;
  final bool loading;
  final TabController? tabController;
  // final Color? childrenColor;
  // final ScrollController nestedScrollViewController;

  @override
  AppScrollViewState createState() => AppScrollViewState();
}

class AppScrollViewState extends State<AppScrollView> {
  @override
  Widget build(final BuildContext context) => NestedScroll(
        // controller: widget.nestedScrollViewController,
        header: (final (BuildContext, {bool isInnerBoxScrolled}) data) => <Widget>[
          widget.scrollViewAppBar,
        ],
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          child: widget.loading
              ? const Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 48),
                      child: LoadingIndicator(),
                    ),
                  ],
                )
              : widget.child ??
                  TabBarView(
                    controller: widget.tabController,
                    children: widget.tabViews!,
                  ),
        ),
      );
}

class ScrollViewAppBar extends StatelessWidget {
  const ScrollViewAppBar({
    required this.appBarWidget,
    this.tabs,
    this.bottomHeader,
    this.backgroundColor,
    this.url,
    this.tabController,
    this.bottomPadding,
    this.padding,
    this.flexibleBackgroundWidget,
    this.collapsedHeight,
    this.expandedHeight,
    this.tabBar,
    super.key,
  });
  final List<String>? tabs;
  final Widget appBarWidget;
  final double? expandedHeight;
  final Widget? flexibleBackgroundWidget;
  final double? collapsedHeight;
  final double? bottomPadding;
  final PreferredSizeWidget? tabBar;
  final String? url;
  final TabController? tabController;
  final Widget? bottomHeader;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  @override
  Widget build(final BuildContext context) {
    final bool hasTabs = tabs != null || tabBar != null;
    return SliverAppBar(
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: Icon(Icons.adaptive.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      backgroundColor: backgroundColor,
      title: SliverAppBarTitle(child: appBarWidget),
      pinned: true,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      actions: <Widget>[
        if (url != null)
          if (url != null) ShareButton(url!),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: padding ??
              EdgeInsets.only(
                top: 16,
                right: 24,
                left: 24,
                bottom: hasTabs ? 40 : 0,
              ),
          child: flexibleBackgroundWidget,
        ),
      ),
      bottom: hasTabs
          ? PreferredSize(
              preferredSize: Size.fromHeight(bottomPadding ?? 0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: bottomHeader ?? Container(),
                  ),
                  if (tabBar != null)
                    tabBar!
                  else
                    TabBar(
                      controller: tabController,
                      tabs: List<Tab>.generate(
                        tabs!.length,
                        (final int index) => Tab(
                          text: tabs![index],
                        ),
                      ),
                    ),
                ],
              ),
            )
          : null,
    );
  }
}

class SliverAppBarTitle extends StatefulWidget {
  const SliverAppBarTitle({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  SliverAppBarTitleState createState() => SliverAppBarTitleState();
}

class SliverAppBarTitleState extends State<SliverAppBarTitle> {
  ScrollPosition? _position;
  bool? _visible;
  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context).position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(final BuildContext context) => SizeExpandedSection(
        axisAlignment: -1,
        expand: _visible,
        child: widget.child,
      );
}
