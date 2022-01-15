import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_tabs/flutter_dynamic_tabs.dart';

class DynamicTabsParent extends StatelessWidget {
  const DynamicTabsParent({
    required this.controller,
    required this.tabs,
    required this.tabViews,
    required this.builder,
    this.onTabClose,
    this.tabBuilder,
    Key? key,
  }) : super(key: key);
  final DynamicTabsController controller;
  final Future<bool> Function(String idenitifier, String? label)? onTabClose;
  final List<DynamicTab> tabs;
  final Widget Function(BuildContext context, DynamicTab tab)? tabBuilder;
  final List<DynamicTabView> tabViews;
  final Widget Function(
      BuildContext context, PreferredSizeWidget tabBar, Widget tabView) builder;

  @override
  Widget build(BuildContext context) {
    return DynamicTabsWrapper.segregated(
        controller: controller,
        tabs: tabs,
        tabBarSettings: DynamicTabSettings(
          indicatorPadding:
              const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 0),
        ),
        tabBuilder: (context, tab) => Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(right: tab.isDismissible ? 0 : 16),
                    child: Text(
                      tab.label!,
                    ),
                  ),
                  if (tab.isDismissible)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: RoundButton(
                        color: elementsOnColors(context),
                        padding: const EdgeInsets.all(4),
                        onPressed: () {
                          controller.closeTab(tab.identifier, showDialog: true);
                        },
                        onLongPress: () {
                          controller.closeTab(tab.identifier);
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          size: 12,
                          color: accent(context),
                        ),
                      ),
                    )
                ],
              ),
            ),
        onTabClose: onTabClose,
        tabViews: tabViews,
        builder: builder);
  }
}
