import 'package:dio_hub/common/events/cards/base_card.dart';
import 'package:dio_hub/common/issues/issue_list_card.dart';
import 'package:dio_hub/models/events/events_model.dart' hide Key;
import 'package:flutter/material.dart';

class IssuesEventCard extends StatelessWidget {
  const IssuesEventCard(this.event, this.trailingHeaderText,
      {this.time, Key? key})
      : super(key: key);
  final EventsModel event;
  final DateTime? time;
  final String trailingHeaderText;
  @override
  Widget build(BuildContext context) {
    return BaseEventCard(
      actor: event.actor!.login,
      headerText: [
        TextSpan(text: ' ${event.payload!.action} $trailingHeaderText '),
        TextSpan(
          text: event.repo!.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
      userLogin: event.actor!.login,
      date: event.createdAt,
      avatarUrl: event.actor!.avatarUrl,
      childPadding: EdgeInsets.zero,
      child: IssueListCard(
        event.payload!.issue!,
        commentsSince: time,
        disableMaterial: true,
        compact: true,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
