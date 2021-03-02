import 'package:flutter/material.dart';
import 'package:onehub/common/collapsible_app_bar.dart';
import 'package:onehub/common/login_check_wrapper.dart';
import 'package:onehub/providers/notifications/notifications_provider.dart';
import 'package:onehub/style/colors.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _notificationsProvider = Provider.of<NotificationsProvider>(context);
    final _media = MediaQuery.of(context).size;
    return LoginCheckWrapper(
      child: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                expandedHeight: 150,
                collapsedHeight: 100,
                pinned: true,
                elevation: 2,
                backgroundColor: AppColor.background,
                flexibleSpace: CollapsibleAppBar(
                  minHeight: 100,
                  maxHeight: 150,
                  expandedParentPadding: 0,
                  title: 'Notifications',
                  trailing: IconButton(
                    icon: Icon(Icons.sort),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ];
        },
        body: Builder(
          builder: (context) {
            NestedScrollView.sliverOverlapAbsorberHandleFor(context);
            return Container(
              color: Colors.red,
            );
          },
        ),
      ),
      replacement: Column(
        children: [
          SizedBox(
            height: _media.height * 0.08,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notifications',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: IconButton(
                          icon: Icon(Icons.sort),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginPromptBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
