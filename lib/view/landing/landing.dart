import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/common/loading_indicator.dart';
import 'package:gitapp/models/enums/status_enum.dart';
import 'package:gitapp/models/users/current_user_info_model.dart';
import 'package:gitapp/providers/landing_navigation_provider.dart';
import 'package:gitapp/providers/users/current_user_provider.dart';
import 'package:gitapp/style/colors.dart';
import 'package:gitapp/view/home/home.dart';
import 'package:gitapp/view/notifications/notifications.dart';
import 'package:gitapp/view/search/search.dart';
import 'package:gitapp/view/settings/settings.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  CurrentUserInfoModel _currentUser;
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  Future<void> getUserInfo() async {
    _currentUser = await context.read<CurrentUserProvider>().getUserInfo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _navProvider = Provider.of<NavigationProvider>(context);
    final _userProvider = Provider.of<CurrentUserProvider>(context);
    return SafeArea(
      child: Visibility(
        visible: _userProvider.status == Status.Loaded,
        child: Scaffold(
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
              SettingsScreen(),
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
              CustomNavigationBarItem(
                  icon: LineIcons.cog, heroTag: 'settingsNavButton'),
            ],
          ),
        ),
        replacement: Scaffold(
          backgroundColor: AppColor.background,
          body: Center(
            child: LoadingIndicator(),
          ),
        ),
      ),
    );
  }
}
