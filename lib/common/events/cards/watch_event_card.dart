import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/events/cards/base_card.dart';
import 'package:onehub/common/repository_card.dart';
import 'package:onehub/models/events/events_model.dart';

class WatchEventCard extends StatelessWidget {
  // Todo: Add repo info fetch. API fetch wrapper needed?
  final EventsModel event;
  WatchEventCard(this.event);
  @override
  Widget build(BuildContext context) {
    return BaseEventCard(
      actor: event.actor!.login,
      headerText: [
        TextSpan(text: ' starred '),
        TextSpan(
            text: event.repo!.name,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      userLogin: event.actor!.login,
      date: event.createdAt,
      avatarUrl: event.actor!.avatarUrl,
      childPadding: EdgeInsets.zero,
      child: RepoCardLoading(
        event.repo!.url,
        event.repo!.name,
        elevation: 0,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
