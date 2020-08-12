import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/models/users/current_user_info_model.dart';
import 'package:gitapp/providers/landing_navigation_provider.dart';
import 'package:gitapp/routes/router.gr.dart';
import 'package:gitapp/style/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    final _currentUser = Provider.of<CurrentUserInfoModel>(context);
    final _navigation = Provider.of<NavigationProvider>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            SizedBox(
              height: _media.height * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Home',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: _currentUser.avatarUrl,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Hero(
              tag: 'test',
              child: Material(
                borderRadius: BorderRadius.circular(75),
                color: AppColor.onBackground,
                child: InkWell(
                  borderRadius: BorderRadius.circular(75),
                  onTap: () {
                    ExtendedNavigator.of(context)
                        .push(Routes.searchOverlayScreen);
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              LineIcons.search,
                              color: AppColor.grey3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Search or Jump to...',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      color: AppColor.grey3.withOpacity(0.7)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
