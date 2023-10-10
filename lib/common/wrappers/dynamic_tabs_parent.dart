import 'package:dio_hub/common/misc/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_tabs/flutter_dynamic_tabs.dart';

class DynamicTabsParent extends StatelessWidget {
  const DynamicTabsParent({
    required this.controller,
    required this.tabs,
    required this.builder,
    this.onTabClose,
    this.tabBuilder,
    super.key,
  });
  final DynamicTabsController controller;
  final Future<bool> Function(String idenitifier, String? label)? onTabClose;
  final List<DynamicTab> tabs;
  final Widget Function(BuildContext context, DynamicTab tab)? tabBuilder;
  final Widget Function(
    BuildContext context,
    PreferredSizeWidget tabBar,
    Widget tabView,
  ) builder;

  @override
  Widget build(final BuildContext context) => DynamicTabsWrapper(
        controller: controller,
        tabs: tabs,
        tabBarSettings: DynamicTabSettings(
            // indicatorPadding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            ),
        tabBuilder: (final BuildContext context, final DynamicTab tab) =>
            tabBuilder?.call(context, tab) ??
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(right: tab.isDismissible ? 0 : 16),
                    child: Text(
                      tab.identifier,
                    ),
                  ),
                  if (tab.isDismissible)
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: RoundButton(
                        // color: context.palette.elementsOnColors,
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
                          // color: context.colorScheme.accent,
                        ),
                      ),
                    ),
                ],
              ),
            ),
        onTabClose: onTabClose,
        builder: builder,
      );
}
