import 'package:animations/animations.dart';
import 'package:auto_route/annotations.dart';
import 'package:diohub/adapters/deep_linking_handler.dart';
import 'package:diohub/common/misc/scaffold_body.dart';
import 'package:diohub/providers/users/current_user_provider.dart';
import 'package:diohub/view/home/home.dart';
import 'package:diohub/view/notifications/notifications.dart';
import 'package:diohub/view/profile/current_user_profile_screen.dart';
import 'package:diohub/view/search/search.dart';
import 'package:diohub/view/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

@RoutePage()
class LandingScreen extends StatefulWidget {
  const LandingScreen({this.deepLinkData, super.key});

  final PathData? deepLinkData;

  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  // late TabController _controller;
  @override
  void initState() {
    currentIndex = getPath(widget.deepLinkData?.path);
    // _controller = TabController(
    //   length: 5,
    //   vsync: this,
    //   initialIndex: getPath(widget.deepLinkData?.path),
    // );

    ColorScheme.fromImageProvider(
      brightness: Brightness.dark,
      provider:
          NetworkImage(context.read<CurrentUserProvider>().data.avatarUrl!),
    ).then((value) {
      print(value);
    });
    super.initState();
  }

  late int currentIndex;

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
        child:
            // ThemeFromImage(
            //   builder: (context, buildThemePZero) =>
            Scaffold(
          body: ScaffoldBody(
            child: PageTransitionSwitcher(
              transitionBuilder: (
                final Widget child,
                final Animation<double> primaryAnimation,
                final Animation<double> secondaryAnimation,
              ) =>
                  FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
              child: switch (currentIndex) {
                0 => HomeScreen(
                    deepLinkData: widget.deepLinkData,
                    // buildThemePZero: buildThemePZero,
                    tabNavigators: (
                      toProfile: () {
                        setState(() {
                          currentIndex = 3;
                        });
                      },
                      toSearch: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      }
                    ),
                  ),
                1 => const SearchScreen(),
                2 => const NotificationsScreen(),
                3 => const CurrentUserProfileScreen(),
                4 => const SettingsScreen(),
                _ => throw UnimplementedError(),
              },
            ),
          ),
          bottomNavigationBar: NavigationBar(
            // backgroundColor: Provider.of<PaletteSettings>(context)
            //     .currentSetting
            //     .primary,
            onDestinationSelected: (final int value) {
              setState(() {
                currentIndex = value;
              });
            },
            selectedIndex: currentIndex,
            // onTabChange: _controller.animateTo,
            // gap: 10,
            // color: Provider.of<PaletteSettings>(context)
            //     .currentSetting
            //     .faded1,
            // activeColor: Provider.of<PaletteSettings>(context)
            //     .currentSetting
            //     .baseElements,
            // rippleColor: Provider.of<PaletteSettings>(context)
            //     .currentSetting
            //     .faded3
            //     .withOpacity(0.4),
            // hoverColor: Provider.of<PaletteSettings>(context)
            //     .currentSetting
            //     .faded3
            //     .withOpacity(0.3),
            // iconSize: 20,
            // textStyle: TextStyle(
            //    14,
            //   // color: Provider.of<PaletteSettings>(context)
            //   //     .currentSetting
            //   //     .baseElements,
            // ),
            // tabBackgroundColor: Provider.of<PaletteSettings>(context)
            //     .currentSetting
            //     .faded3
            //     .withOpacity(0.3),
            // padding: const EdgeInsets.symmetric(
            //   horizontal: 12,
            //   vertical: 16.5,
            // ),
            // duration: const Duration(milliseconds: 250),
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(MdiIcons.home),
                label: 'Home',
                // heroTag: 'homeNavButton',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_rounded),
                label: 'Search',
                // heroTag: 'homeNavButton',
              ),
              NavigationDestination(
                icon: Icon(MdiIcons.bell),
                label: 'Inbox',
                // heroTag: 'homeNavButton',
              ),
              NavigationDestination(
                icon: Icon(MdiIcons.account),
                label: 'Profile',
                // heroTag: 'homeNavButton',
              ),
              NavigationDestination(
                icon: Icon(MdiIcons.cog),
                label: 'Settings',
                // heroTag: 'homeNavButton',
              ),
            ],
          ),
        ),
        // ),
      );
}
