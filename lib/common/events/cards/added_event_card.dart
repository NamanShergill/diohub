import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/events/cards/base_card.dart';
import 'package:onehub/common/profile_card.dart';
import 'package:onehub/common/repository_card.dart';
import 'package:onehub/models/events/events_model.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/style/colors.dart';

class AddedEventCard extends StatelessWidget {
  final EventsModel event;
  final String eventTextMiddle;
  final RepositoryModel? repo;
  final String? branch;
  AddedEventCard(this.event, this.eventTextMiddle, {this.branch, this.repo});
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
      ],
      userLogin: event.actor!.login,
      date: event.createdAt,
      avatarUrl: event.actor!.avatarUrl,
      childPadding: EdgeInsets.zero,
      child: Container(
        color: AppColor.onBackground,
        child: Column(
          children: [
            ProfileCard(
              event.payload.member,
              compact: true,
            ),
            SizedBox(
              height: 8,
            ),
            RepoCardLoading(
              repo != null ? repo!.url : event.repo!.url,
              repo != null ? repo!.name : event.repo!.name,
              elevation: 0,
              branch: branch,
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
