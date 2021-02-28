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
import 'package:google_nav_bar/google_nav_bar.dart';
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
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              backgroundColor: AppColor.background,
              selectedIndex: _navProvider.currentIndex,
              onTabChange: (index) {
                _navProvider.animateToPage(index);
              },
              gap: 10,
              color: AppColor.grey,
              activeColor: Colors.white,
              rippleColor: Colors.grey[800],
              hoverColor: Colors.grey[700],
              iconSize: 20,
              textStyle: TextStyle(fontSize: 16, color: Colors.white),
              tabBackgroundColor: Colors.grey[900],
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16.5),
              duration: Duration(milliseconds: 250),
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  heroTag: 'homeNavButton',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                  heroTag: 'searchNavButton',
                ),
                GButton(
                  icon: LineIcons.bell,
                  text: 'Notifications',
                  heroTag: 'notificationsNavButton',
                ),
                GButton(
                  icon: LineIcons.cog,
                  text: 'Settings',
                  heroTag: 'settingsNavButton',
                ),
              ],
            ),
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
