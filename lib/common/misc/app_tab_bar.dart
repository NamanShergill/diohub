import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/controller/dynamic_tabs.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTabBar extends StatelessWidget {
  AppTabBar({TabController? controller, required List<String> tabs, Key? key})
      : _tabController = controller,
        dynamicController = null,
        tabs = tabs.map((e) => DynamicTab(e, isDismissible: false)).toList(),
        super(key: key);
  AppTabBar.dynamic({required this.dynamicController, Key? key})
      : _tabController = dynamicController!.controller,
        tabs = dynamicController.currentTabs,
        super(key: key);
  final TabController? _tabController;
  final DynamicTabsController? dynamicController;

  final List<DynamicTab> tabs;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<PaletteSettings>(context).currentSetting.primary,
      child: Column(
        children: [
          // Divider(
          //   height: 0,
          //   color: Provider.of<PaletteSettings>(context).currentSetting.grey3,
          //   thickness: 0.2,
          // ),
          TabBar(
            physics: const BouncingScrollPhysics(),
            isScrollable: true,
            controller: _tabController,
            indicator: BoxDecoration(
                borderRadius: bigBorderRadius,
                color: Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .accent),
            unselectedLabelColor:
                Provider.of<PaletteSettings>(context).currentSetting.faded3,
            labelStyle: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            indicatorPadding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 0),
            labelPadding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 0),
            tabs: tabs
                .map((e) => Tab(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(e.label),
                            if (e.isDismissible)
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      dynamicController?.closeTab(e.identifier);
                                    },
                                    onLongPress: () {
                                      dynamicController?.closeTab(e.identifier,
                                          bypassFuture: true);
                                    },
                                    borderRadius: medBorderRadius,
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.close,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
          // Divider(
          //   height: 0,
          //   color: Provider.of<PaletteSettings>(context).currentSetting.grey3,
          //   thickness: 0.2,
          // ),
        ],
      ),
    );
  }
}
