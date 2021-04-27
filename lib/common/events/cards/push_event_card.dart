import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/branch_label.dart';
import 'package:dio_hub/common/custom_expansion_tile.dart';
import 'package:dio_hub/common/events/cards/base_card.dart';
import 'package:dio_hub/models/events/events_model.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/borderRadiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/style/textStyles.dart';
import 'package:flutter/material.dart';

class PushEventCard extends StatelessWidget {
  final EventsModel event;
  final Payload data;
  PushEventCard(this.event, this.data);
  @override
  Widget build(BuildContext context) {
    return BaseEventCard(
      onTap: () {
        AutoRouter.of(context).push(RepositoryScreenRoute(
            repositoryURL: event.repo!.url,
            branch: data.ref!.split('/').last,
            index: 2));
      },
      userLogin: event.actor!.login,
      date: event.createdAt,
      childPadding: EdgeInsets.all(8),
      actor: event.actor!.login,
      headerText: [
        TextSpan(
            text: ' pushed to ', style: AppThemeTextStyles.eventCardHeaderMed),
        TextSpan(
            text: event.repo!.name,
            style: AppThemeTextStyles.eventCardHeaderBold)
      ],
      avatarUrl: event.actor!.avatarUrl,
      child: CustomExpansionTile(
        expanded: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${data.size} commit${data.size! > 1 ? 's' : ''} to',
              style: AppThemeTextStyles.eventCardChildTitleSmall,
            ),
            Flexible(
              child: BranchLabel(
                data.ref!.split('/').last,
                size: 12,
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: data.commits!.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0,
                  );
                },
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    borderRadius: AppThemeBorderRadius.smallBorderRadius,
                    onTap: () {
                      AutoRouter.of(context).push(CommitInfoScreenRoute(
                          commitURL: data.commits![index].url));
                    },
                    onLongPress: () {
                      AutoRouter.of(context).push(RepositoryScreenRoute(
                          index: 2,
                          branch: data.ref!.split('/').last,
                          repositoryURL: event.repo!.url,
                          initSHA: data.commits![index].sha));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 8),
                      child: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                            TextSpan(
                                text:
                                    '#${data.commits![index].sha!.substring(0, 6)}',
                                style: TextStyle(color: AppColor.accent)),
                            TextSpan(text: '  ' + data.commits![index].message!)
                          ])),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
