import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/auth_popup/auth_popup.dart';
import 'package:onehub/common/scaffold_body/scaffold_body.dart';
import 'package:onehub/providers/landing_navigation_provider.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/home/home.dart';
import 'package:onehub/view/notifications/notifications.dart';
import 'package:onehub/view/search/search.dart';
import 'package:onehub/view/settings/settings.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    //Show auth popup if user is not authenticated.
    showAuthPopup();
    super.initState();
  }

  void showAuthPopup() async {
    await Future.delayed(Duration(seconds: 1));
    if (!BlocProvider.of<AuthenticationBloc>(context).state.authenticated) {
      showDialog(
          context: context,
          builder: (_) {
            return AuthPopup();
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _navProvider = Provider.of<NavigationProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: ScaffoldBody(
          child: PageView(
            controller: _navProvider.controller,
            onPageChanged: (index) {
              _navProvider.setCurrentIndex(index);
            },
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              SearchScreen(),
              NotificationsScreen(),
              SettingsScreen(),
              Container(),
            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
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
                    icon: LineIcons.user,
                    text: 'Profile',
                    heroTag: 'settingsNavButton',
                  ),
                  GButton(
                    icon: LineIcons.infoCircle,
                    text: 'About',
                    heroTag: 'aboutNavButton',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
