import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/app_bar.dart';
import 'package:dio_hub/common/misc/app_tab_bar.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class AppScrollView extends StatelessWidget {
  final Widget? scrollViewAppBar;
  final List<Widget>? tabViews;
  final Widget? child;
  final bool loading;
  final TabController? tabController;
  final Color? childrenColor;
  final ScrollController scrollController;
  const AppScrollView(
      {this.scrollViewAppBar,
      this.tabController,
      this.tabViews,
      required this.scrollController,
      this.child,
      this.childrenColor,
      this.loading = false,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                sliver: scrollViewAppBar!,
              ),
            )
          ];
        },
        body: Builder(builder: (context) {
          NestedScrollView.sliverOverlapAbsorberHandleFor(context);

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            child: loading
                ? Container(
                    color: childrenColor ?? AppColor.onBackground,
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 48.0),
                          child: LoadingIndicator(),
                        ),
                      ],
                    ))
                : child ??
                    Container(
                      color: childrenColor ?? AppColor.onBackground,
                      child: TabBarView(
                        controller: tabController,
                        children: List.generate(
                            tabViews!.length, (index) => tabViews![index]),
                      ),
                    ),
          );
        }));
  }
}

class ScrollViewAppBar extends StatelessWidget {
  final List<String>? tabs;
  final Widget? appBarWidget;
  final double? expandedHeight;
  final Widget? flexibleBackgroundWidget;
  final double? collapsedHeight;
  final double? bottomPadding;
  final String? url;

  final TabController? tabController;
  final Widget? bottomHeader;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  const ScrollViewAppBar(
      {this.tabs,
      this.appBarWidget,
      this.bottomHeader,
      this.backgroundColor,
      this.url,
      this.tabController,
      this.bottomPadding,
      this.padding,
      this.flexibleBackgroundWidget,
      this.collapsedHeight,
      this.expandedHeight,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
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
      actions: [
        if (url != null)
          if (url != null) ShareButton(url!),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: padding ??
              EdgeInsets.only(
                  top: 16, right: 24, left: 24, bottom: tabs != null ? 60 : 0),
          child: flexibleBackgroundWidget,
        ),
      ),
      bottom: tabs != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(bottomPadding ?? 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: bottomHeader ?? Container(),
                  ),
                  AppTabBar(
                    controller: tabController,
                    tabs: List.generate(
                        tabs!.length,
                        (index) => AppTab(
                              title: tabs![index],
                            )),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}

class SliverAppBarTitle extends StatefulWidget {
  final Widget? child;
  const SliverAppBarTitle({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  _SliverAppBarTitleState createState() {
    return _SliverAppBarTitleState();
  }
}

class _SliverAppBarTitleState extends State<SliverAppBarTitle> {
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
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType();
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeExpandedSection(
      axisAlignment: -1.0,
      expand: _visible,
      child: widget.child,
    );
  }
}
