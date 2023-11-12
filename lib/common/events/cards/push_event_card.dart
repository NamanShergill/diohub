import 'package:auto_route/auto_route.dart';
import 'package:diohub/common/events/cards/base_card.dart';
import 'package:diohub/common/misc/branch_label.dart';
import 'package:diohub/common/misc/custom_expansion_tile.dart';
import 'package:diohub/models/events/events_model.dart' hide Key;
import 'package:diohub/routes/router.gr.dart';
import 'package:diohub/style/border_radiuses.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';

class PushEventCard extends StatelessWidget {
  const PushEventCard(this.event, this.data, {super.key});
  final EventsModel event;
  final Payload data;
  @override
  Widget build(final BuildContext context) => BaseEventCard.singular(
        onTap: () async {
          await AutoRouter.of(context).push(
            RepositoryRoute(
              repositoryURL: event.repo!.url!,
              branch: data.ref!.split('/').last,
              index: 2,
            ),
          );
        },
        userLogin: event.actor!.login,
        date: event.createdAt,
        actor: event.actor!.login,
        headerText: <TextSpan>[
          const TextSpan(
            text: ' pushed to ',
            // style: AppThemeTextStyles.eventCardHeaderMed(context),
          ),
          TextSpan(
            text: event.repo!.name,
            // style: AppThemeTextStyles.eventCardHeaderBold(context),
          ),
        ],
        avatarUrl: event.actor!.avatarUrl,
        child: CustomExpansionTile(
          expanded: false,
          title: Row(
            children: <Widget>[
              Text(
                '${data.size} commit${data.size! > 1 ? 's' : ''} to',
                // style: AppThemeTextStyles.eventCardChildTitleSmall(context),
              ),
              Flexible(
                child: BranchLabel(
                  data.ref!.split('/').last,
                ),
              ),
            ],
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: data.commits!.length,
                separatorBuilder:
                    (final BuildContext context, final int index) =>
                        const Divider(
                  height: 0,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (final BuildContext context, final int index) =>
                    InkWell(
                  borderRadius: smallBorderRadius,
                  onTap: () async {
                    await AutoRouter.of(context).push(
                      CommitInfoRoute(
                        commitURL: data.commits![index].url!,
                      ),
                    );
                  },
                  onLongPress: () async {
                    await AutoRouter.of(context).push(
                      RepositoryRoute(
                        index: 2,
                        branch: data.ref!.split('/').last,
                        repositoryURL: event.repo!.url!,
                        initSHA: data.commits![index].sha,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 8,
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: <InlineSpan>[
                          TextSpan(
                            text:
                                '#${data.commits![index].sha!.substring(0, 6)}',
                            style: TextStyle(
                              color: context.colorScheme.primary,
                            ),
                          ),
                          TextSpan(text: '  ${data.commits![index].message!}'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
