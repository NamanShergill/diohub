import 'package:flutter/material.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class AppTabBar extends StatelessWidget {
  final TabController? _tabController;
  final List<AppTab>? tabs;
  AppTabBar({TabController? controller, this.tabs})
      : _tabController = controller;
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
            physics: BouncingScrollPhysics(),
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
                EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
            labelPadding: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
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
  AppTab({this.title});
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
