import 'package:auto_route/annotations.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/scaffold_body.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/view/home/home.dart';
import 'package:dio_hub/view/notifications/notifications.dart';
import 'package:dio_hub/view/profile/current_user_profile_screen.dart';
import 'package:dio_hub/view/search/search.dart';
import 'package:dio_hub/view/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LandingScreen extends StatefulWidget {
  const LandingScreen({this.deepLinkData, super.key});
  final PathData? deepLinkData;
  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(
      length: 5,
      vsync: this,
      initialIndex: getPath(widget.deepLinkData?.path),
    );
    super.initState();
  }

  int getPath(final String? path) {
    if (path == 'search') {
      return 1;
    } else if (path == 'notifications') {
      return 2;
    } else {
      return 0;
    }
  }

  @override
  Widget build(final BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor:
              Provider.of<PaletteSettings>(context).currentSetting.primary,
          body: ScaffoldBody(
            child: TabBarView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                HomeScreen(
                  deepLinkData: widget.deepLinkData,
                  parentTabController: _controller,
                ),
                const SearchScreen(),
                const NotificationsScreen(),
                const CurrentUserProfileScreen(),
                const SettingsScreen(),
              ],
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4),
                child: GNav(
                  backgroundColor: Provider.of<PaletteSettings>(context)
                      .currentSetting
                      .primary,
                  selectedIndex: _controller.index,
                  onTabChange: _controller.animateTo,
                  gap: 10,
                  color: Provider.of<PaletteSettings>(context)
                      .currentSetting
                      .faded1,
                  activeColor: Provider.of<PaletteSettings>(context)
                      .currentSetting
                      .baseElements,
                  rippleColor: Provider.of<PaletteSettings>(context)
                      .currentSetting
                      .faded3
                      .withOpacity(0.4),
                  hoverColor: Provider.of<PaletteSettings>(context)
                      .currentSetting
                      .faded3
                      .withOpacity(0.3),
                  iconSize: 20,
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .baseElements,
                  ),
                  tabBackgroundColor: Provider.of<PaletteSettings>(context)
                      .currentSetting
                      .faded3
                      .withOpacity(0.3),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 16.5,),
                  duration: const Duration(milliseconds: 250),
                  tabs: const <GButton>[
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                      // heroTag: 'homeNavButton',
                    ),
                    GButton(
                      icon: LineIcons.search,
                      text: 'Search',
                      // heroTag: 'searchNavButton',
                    ),
                    GButton(
                      icon: LineIcons.bell,
                      text: 'Inbox',
                      // heroTag: 'notificationsNavButton',
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                      // heroTag: 'settingsNavButton',
                    ),
                    GButton(
                      icon: LineIcons.cog,
                      text: 'Settings',
                      // heroTag: 'aboutNavButton',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
