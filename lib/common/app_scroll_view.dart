import 'package:flutter/material.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/style/colors.dart';

import 'app_tab_bar.dart';

class AppScrollView extends StatelessWidget {
  final ScrollViewAppBar? scrollViewAppBar;
  final List<Widget>? tabViews;
  final bool loading;
  final TabController? tabController;
  final Color childrenColor;
  AppScrollView(
      {this.scrollViewAppBar,
      this.tabController,
      this.tabViews,
      this.childrenColor = AppColor.onBackground,
      this.loading = false});
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(headerSliverBuilder: (context, value) {
      return [
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverSafeArea(
            sliver: scrollViewAppBar!,
          ),
        )
      ];
    }, body: Builder(builder: (context) {
      NestedScrollView.sliverOverlapAbsorberHandleFor(context);

      return AnimatedSwitcher(
        duration: Duration(milliseconds: 50),
        child: loading
            ? Container(
                color: childrenColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: LoadingIndicator(),
                    ),
                  ],
                ))
            : Container(
                color: childrenColor,
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
  final TabController? tabController;
  final Widget? bottomHeader;
  ScrollViewAppBar(
      {this.tabs,
      this.appBarWidget,
      this.bottomHeader,
      this.tabController,
      this.bottomPadding,
      this.flexibleBackgroundWidget,
      this.collapsedHeight,
      this.expandedHeight});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      title: SliverAppBarTitle(child: appBarWidget),
      pinned: true,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding:
              const EdgeInsets.only(top: 16, right: 24, left: 24, bottom: 60),
          child: flexibleBackgroundWidget,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(bottomPadding ?? 0),
        child: Container(
          color: AppColor.background,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
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
        ),
      ),
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
    return new _SliverAppBarTitleState();
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
