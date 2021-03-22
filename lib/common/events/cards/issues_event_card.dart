import 'package:flutter/material.dart';
import 'package:onehub/common/events/cards/base_card.dart';
import 'package:onehub/common/issues/issue_list_card.dart';
import 'package:onehub/models/events/events_model.dart';

class IssuesEventCard extends StatelessWidget {
  final EventsModel event;
  IssuesEventCard(this.event);
  @override
  Widget build(BuildContext context) {
    return BaseEventCard(
      actor: event.actor!.login,
      headerText: [
        TextSpan(
            text:
                ' ${actionValues.reverse[event.payload.action]} an issue in '),
        TextSpan(
          text: event.repo!.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
      userLogin: event.actor!.login,
      date: event.createdAt,
      avatarUrl: event.actor!.avatarUrl,
      childPadding: EdgeInsets.zero,
      child: IssueListCard(
        event.payload.issue,
        disableMaterial: true,
        compact: true,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
