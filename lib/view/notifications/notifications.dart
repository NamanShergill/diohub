import 'package:flutter/material.dart';
import 'package:gitapp/common/loading_indicator.dart';
import 'package:gitapp/models/notiifications/notifications_model.dart';
import 'package:gitapp/providers/notifications/notifications_provider.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final _notificationsProvider = Provider.of<NotificationsProvider>(context);
    return Center(
      child: FutureBuilder(
        future: _notificationsProvider.getAllNotifications(),
        builder: (BuildContext context,
            AsyncSnapshot<List<NotificationModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      snapshot.data[index].subject.title,
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                });
          }
          return LoadingIndicator();
        },
      ),
    );
  }
}
