import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/app_bar.dart';
import 'package:dio_hub/common/misc/app_tab_bar.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppScrollView extends StatefulWidget {
  const AppScrollView(
      {this.scrollViewAppBar,
      this.tabController,
      this.tabViews,
      required this.nestedScrollViewController,
      this.child,
      this.childrenColor,
      this.loading = false,
      Key? key})
      : super(key: key);
  final Widget? scrollViewAppBar;
  final List<Widget>? tabViews;
  final Widget? child;
  final bool loading;
  final TabController? tabController;
  final Color? childrenColor;
  final ScrollController nestedScrollViewController;

  @override
  _AppScrollViewState createState() => _AppScrollViewState();
}

class _AppScrollViewState extends State<AppScrollView> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: widget.nestedScrollViewController,
        headerSliverBuilder: (context, value) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                sliver: widget.scrollViewAppBar!,
              ),
            )
          ];
        },
        body: Builder(builder: (context) {
          NestedScrollView.sliverOverlapAbsorberHandleFor(context);

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            child: widget.loading
                ? Container(
                    color: widget.childrenColor ??
                        Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .secondary,
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 48.0),
                          child: LoadingIndicator(),
                        ),
                      ],
                    ))
                : Container(
                    color: widget.childrenColor ??
                        Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .secondary,
                    child: widget.child ??
                        TabBarView(
                          controller: widget.tabController,
                          children: widget.tabViews!,
                        ),
                  ),
          );
        }));
  }
}

class ScrollViewAppBar extends StatelessWidget {
  const ScrollViewAppBar(
      {this.tabs,
      required this.appBarWidget,
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
      Key? key})
      : super(key: key);
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
  Widget build(BuildContext context) {
    final hasTabs = tabs != null || tabBar != null;
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
                  top: 16, right: 24, left: 24, bottom: hasTabs ? 40 : 0),
          child: flexibleBackgroundWidget,
        ),
      ),
      bottom: hasTabs
          ? PreferredSize(
              preferredSize: Size.fromHeight(bottomPadding ?? 0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: bottomHeader ?? Container(),
                    ),
                    tabBar != null
                        ? tabBar!
                        : AppTabBar(
                            controller: tabController,
                            tabs: List.generate(
                              tabs!.length,
                              (index) => tabs![index],
                            ),
                          ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}

class SliverAppBarTitle extends StatefulWidget {
  const SliverAppBarTitle({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
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
    final settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final visible =
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
