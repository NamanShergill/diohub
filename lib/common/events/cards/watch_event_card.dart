import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio_hub/common/events/cards/base_card.dart';
import 'package:dio_hub/common/repository_card.dart';
import 'package:dio_hub/models/events/events_model.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';

class RepoEventCard extends StatelessWidget {
  final EventsModel event;
  final String eventTextMiddle;
  final RepositoryModel? repo;
  final String? eventTextEnd;
  final String? branch;
  RepoEventCard(this.event, this.eventTextMiddle,
      {this.eventTextEnd, this.branch, this.repo});
  @override
  Widget build(BuildContext context) {
    return BaseEventCard(
      actor: event.actor!.login,
      headerText: [
        TextSpan(text: ' $eventTextMiddle '),
        TextSpan(
          text: event.repo!.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        if (eventTextEnd != null) TextSpan(text: ' $eventTextEnd'),
      ],
      userLogin: event.actor!.login,
      date: event.createdAt,
      avatarUrl: event.actor!.avatarUrl,
      childPadding: EdgeInsets.zero,
      child: RepoCardLoading(
        repo != null ? repo!.url : event.repo!.url,
        repo != null ? repo!.name : event.repo!.name,
        elevation: 0,
        branch: branch,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
