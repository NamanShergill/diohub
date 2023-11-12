import 'package:diohub/common/events/cards/base_card.dart';
import 'package:diohub/common/issues/issue_list_card.dart';
import 'package:diohub/models/events/events_model.dart' hide Key;
import 'package:flutter/material.dart';

class IssuesEventCard extends StatelessWidget {
  const IssuesEventCard(
    this.event,
    this.trailingHeaderText, {
    this.time,
    super.key,
  });
  final EventsModel event;
  final DateTime? time;
  final String trailingHeaderText;
  @override
  Widget build(final BuildContext context) => BaseEventCard.singular(
        actor: event.actor!.login,
        headerText: <TextSpan>[
          TextSpan(text: ' ${event.payload!.action} $trailingHeaderText '),
          TextSpan(
            text: event.repo!.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
        userLogin: event.actor!.login,
        date: event.createdAt,
        avatarUrl: event.actor!.avatarUrl,
        child: IssueListCard(
          event.payload!.issue!,
          commentsSince: time,
          // disableMaterial: true,
          compact: true,
        ),
      );
}
