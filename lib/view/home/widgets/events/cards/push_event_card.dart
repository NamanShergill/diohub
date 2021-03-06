import 'package:flutter/material.dart';
import 'package:onehub/common/branch_label.dart';
import 'package:onehub/common/custom_expansion_tile.dart';
import 'package:onehub/models/events/events_model.dart';
import 'package:onehub/models/events/payloads/push_event_payload_model.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/style/textStyles.dart';
import 'package:onehub/view/home/widgets/events/cards/base_card.dart';

class PushEventCard extends StatelessWidget {
  final EventsModel event;
  final PushEventPayloadModel data;
  PushEventCard(this.event, Map payload)
      : data = PushEventPayloadModel.fromJson(payload);
  @override
  Widget build(BuildContext context) {
    return BaseEventCard(
      childPadding: EdgeInsets.all(8),
      actor: event.actor.login,
      headerText: [
        TextSpan(text: ' pushed to ', style: AppThemeTextStyles.eventHeaderMed),
        TextSpan(
            text: event.repo.name, style: AppThemeTextStyles.eventHeaderBold)
      ],
      avatarUrl: event.actor.avatarUrl,
      child: CustomExpansionTile(
        expanded: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${data.size} commit${data.size > 1 ? 's' : ''} to',
              style: AppThemeTextStyles.eventChildTitleSmall,
            ),
            BranchLabel(
              data.ref.split('/').last,
              size: 12,
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: data.commits.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                        TextSpan(
                            text:
                                ' #${data.commits[index].sha.substring(0, 6)}',
                            style: TextStyle(color: AppColor.accent)),
                        TextSpan(text: '  ' + data.commits[index].message)
                      ]));
                }),
          )
        ],
      ),
    );
  }
}
