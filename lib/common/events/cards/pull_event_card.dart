import 'package:dio_hub/common/events/cards/base_card.dart';
import 'package:dio_hub/common/pulls/pull_list_card.dart';
import 'package:dio_hub/models/events/events_model.dart' hide Key;
import 'package:flutter/material.dart';

class PullEventCard extends StatelessWidget {
  const PullEventCard(this.event, {super.key});
  final EventsModel event;
  @override
  Widget build(final BuildContext context) => BaseEventCard(
        actor: event.actor!.login,
        headerText: <TextSpan>[
          TextSpan(text: ' ${event.payload!.action} a pull request in '),
          TextSpan(
            text: event.repo!.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
        userLogin: event.actor!.login,
        date: event.createdAt,
        avatarUrl: event.actor!.avatarUrl,
        childPadding: EdgeInsets.zero,
        child: PullListCard(
          event.payload!.pullRequest!,
          disableMaterial: true,
          compact: true,
          padding: EdgeInsets.zero,
        ),
      );
}
