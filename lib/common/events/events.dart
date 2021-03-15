import 'package:flutter/material.dart';
import 'package:onehub/common/events/cards/push_event_card.dart';
import 'package:onehub/common/events/cards/watch_event_card.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/models/events/events_model.dart';
import 'package:onehub/providers/users/current_user_provider.dart';
import 'package:onehub/services/activity/events_service.dart';
import 'package:provider/provider.dart';

class Events extends StatelessWidget {
  final bool privateEvents;
  final String specificUser;
  Events({this.privateEvents = true, this.specificUser});
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<CurrentUserProvider>(context);
    return InfiniteScrollWrapper<EventsModel>(
      firstDivider: false,
      topSpacing: 24,
      spacing: 32,
      future: (pageNumber, pageSize, refresh, _) {
        if (specificUser != null)
          return EventsService.getUserEvents(specificUser,
              page: pageNumber, perPage: pageSize, refresh: refresh);
        else if (privateEvents)
          return EventsService.getReceivedEvents(_user.currentUserInfo.login,
              page: pageNumber, perPage: pageSize, refresh: refresh);
        else
          return EventsService.getPublicEvents(_user.currentUserInfo.login,
              page: pageNumber, perPage: pageSize, refresh: refresh);
      },
      builder: (context, EventsModel item, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Builder(builder: (context) {
            if (item.type == EventsType.PushEvent)
              return PushEventCard(item, item.payload);
            else if (item.type == EventsType.WatchEvent)
              return WatchEventCard(item);
            return Padding(
              padding: const EdgeInsets.all(
                42.0,
              ),
              child: Center(
                child: Text('Unimplemented.'),
              ),
            );
          }),
        );
      },
    );
  }
}
