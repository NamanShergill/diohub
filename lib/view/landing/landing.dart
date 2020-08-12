import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/common/loading_indicator.dart';
import 'package:gitapp/providers/landing_navigation_provider.dart';
import 'package:gitapp/providers/users/current_user_provider.dart';
import 'package:gitapp/style/colors.dart';
import 'package:gitapp/view/home/home.dart';
import 'package:gitapp/view/notifications/notifications.dart';
import 'package:gitapp/view/search/search.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final _currentUser = Provider.of<CurrentUserProvider>(context);
    final _navProvider = Provider.of<NavigationProvider>(context);
    return SafeArea(
      child: _currentUser != null
          ? Scaffold(
              backgroundColor: AppColor.background,
              body: PageView(
                controller: _navProvider.controller,
                onPageChanged: (index) {
                  _navProvider.setCurrentIndex(index);
                },
                children: [
                  HomeScreen(),
                  SearchScreen(),
                  NotificationsScreen(),
                ],
              ),
              bottomNavigationBar: CustomNavigationBar(
                backgroundColor: AppColor.background,
                currentIndex: _navProvider.currentIndex,
                onTap: (index) {
                  _navProvider.animateToPage(index);
                },
                padding: 16,
                unSelectedColor: AppColor.grey,
                selectedColor: AppColor.accent,
                items: [
                  CustomNavigationBarItem(
                      icon: LineIcons.home, heroTag: 'homeNavButton'),
                  CustomNavigationBarItem(
                      icon: LineIcons.search, heroTag: 'searchNavButton'),
                  CustomNavigationBarItem(
                      icon: LineIcons.bell, heroTag: 'notificationNavButton'),
                ],
              ),
            )
          : Scaffold(
              backgroundColor: AppColor.background,
              body: Center(
                child: LoadingIndicator(),
              ),
            ),
    );
  }
}
