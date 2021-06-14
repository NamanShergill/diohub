import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/scaffold_body.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/providers/landing_navigation_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/view/home/home.dart';
import 'package:dio_hub/view/notifications/notifications.dart';
import 'package:dio_hub/view/profile/current_user_profile_screen.dart';
import 'package:dio_hub/view/search/search.dart';
import 'package:dio_hub/view/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  final DeepLinkData? deepLinkData;
  const LandingScreen({this.deepLinkData, Key? key}) : super(key: key);
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    context.read<NavigationProvider>().setPath(widget.deepLinkData?.path);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _navProvider = Provider.of<NavigationProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Provider.of<PaletteSettings>(context).currentSetting.primary,
        body: ScaffoldBody(
          notificationController:
              Provider.of<CurrentUserProvider>(context).notificationController,
          child: PageView(
            controller: _navProvider.controller,
            onPageChanged: (index) {
              _navProvider.setCurrentIndex(index);
            },
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(
                deepLinkData: widget.deepLinkData,
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
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GNav(
                backgroundColor: Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .primary,
                selectedIndex: _navProvider.currentIndex,
                onTabChange: (index) {
                  _navProvider.animateToPage(index);
                },
                gap: 10,
                color:
                    Provider.of<PaletteSettings>(context).currentSetting.faded1,
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
                    fontSize: 16,
                    color: Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .baseElements),
                tabBackgroundColor: Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .faded3
                    .withOpacity(0.3),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16.5),
                duration: const Duration(milliseconds: 250),
                tabs: const [
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
                    text: 'Inbox',
                    heroTag: 'notificationsNavButton',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                    heroTag: 'settingsNavButton',
                  ),
                  GButton(
                    icon: LineIcons.cog,
                    text: 'Settings',
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
