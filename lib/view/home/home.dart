import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/app/global.dart';
import 'package:onehub/common/login_check_wrapper.dart';
import 'package:onehub/providers/landing_navigation_provider.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/home/widgets/homeTabs/home_tabs.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _media = MediaQuery.of(context).size;
    final _navigation = Provider.of<NavigationProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: _media.height * 0.08,
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
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
                        // child: CachedNetworkImage(
                        //   // imageUrl: _currentUser.currentUserInfo.avatarUrl,
                        // ),
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
                      Global.customRouter.push(SearchOverlayScreenRoute());
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
        Expanded(child: LoginCheckWrapper(child: HomeTabs())),
      ],
    );
  }
}
