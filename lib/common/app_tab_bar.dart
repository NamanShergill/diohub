import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  final TabController? _tabController;
  final List<AppTab>? tabs;
  const AppTabBar({TabController? controller, this.tabs, Key? key})
      : _tabController = controller,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      child: Column(
        children: [
          // Divider(
          //   height: 0,
          //   color: AppColor.grey3,
          //   thickness: 0.2,
          // ),
          TabBar(
            physics: const BouncingScrollPhysics(),
            isScrollable: true,
            controller: _tabController,
            indicator: BoxDecoration(
                borderRadius: AppThemeBorderRadius.bigBorderRadius,
                color: AppColor.accent),
            unselectedLabelColor: AppColor.grey3,
            labelStyle: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            indicatorPadding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
            labelPadding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
            tabs: tabs!,
          ),
          // Divider(
          //   height: 0,
          //   color: AppColor.grey3,
          //   thickness: 0.2,
          // ),
        ],
      ),
    );
  }
}

class AppTab extends StatelessWidget {
  final String? title;
  const AppTab({this.title, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(title!),
      ),
    );
  }
}
