import 'package:flutter/material.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/models/notifications/notifications_model.dart';
import 'package:onehub/providers/notifications/notifications_provider.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/notifications/widgets/notification_card.dart';
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
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerScroll) {
        return <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: _media.height * 0.15,
            collapsedHeight: _media.height * 0.1,
            backgroundColor: AppColor.background,
            flexibleSpace: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(left: 16, bottom: 16),
                    title: Row(
                      children: [
                        Text(
                          'Notifications',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
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
          ),
        ];
      },
      body: FutureBuilder(
        future: _notificationsProvider.getAllNotifications(),
        builder: (BuildContext context,
            AsyncSnapshot<List<NotificationModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return NotificationCard(snapshot.data[index]);
                });
          }
          return LoadingIndicator();
        },
      ),
    );
  }
}
