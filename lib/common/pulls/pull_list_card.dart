import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/issues/issue_label.dart';
import 'package:dio_hub/common/misc/tappable_card.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/pull_requests/pull_request_model.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:dio_hub/view/issues_pulls/issue_pull_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PullListCard extends StatelessWidget {
  const PullListCard(
    this.item, {
    this.compact = false,
    // this.disableMaterial = false,
    this.showRepoName = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    super.key,
    this.cardLinkType = CardLinkType.none,
  });
  final CardLinkType cardLinkType;
  final PullRequestModel item;
  final bool compact;
  // final bool disableMaterial;
  final EdgeInsets padding;
  final bool showRepoName;

  @override
  Widget build(final BuildContext context) => BasicCard.linked(
        cardLinkType: cardLinkType,
        onTap: () async => AutoRouter.of(context)
            .push(issuePullScreenRoute(PathData.fromURL(item.issueUrl!))),
        // color: disableMaterial
        //     ? transparent
        //     : Provider.of<PaletteSettings>(context).currentSetting.primary,
        // borderRadius: medBorderRadius,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GetPullIcon(item.state!, item.mergedAt),
                  const SizedBox(
                    width: 4,
                  ),
                  if (showRepoName)
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(
                          item.links!.self!.href!
                              .replaceAll(
                                'https://api.github.com/repos/',
                                '',
                              )
                              .split('/')
                              .sublist(0, 2)
                              .join('/'),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              // color: Provider.of<PaletteSettings>(context)
                              //     .currentSetting
                              //     .faded3,
                              ),
                        ),
                      ),
                    ),
                  Text(
                    '#${item.number}',
                    style: const TextStyle(
                        // color: Provider.of<PaletteSettings>(context)
                        //     .currentSetting
                        //     .faded3,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                item.title!,
                // style: Theme.of(context).textTheme.bodyMedium,
              ),
              if (!compact)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      item.state == IssueState.CLOSED
                          ? item.mergedAt != null
                              ? 'By ${item.user!.login}, merged ${getDate(item.mergedAt.toString(), shorten: false)}.'
                              : 'By ${item.user!.login}, closed ${getDate(item.closedAt.toString(), shorten: false)}.'
                          : 'Opened ${getDate(item.createdAt.toString(), shorten: false)} by ${item.user!.login}',
                      style: context.textTheme.bodySmall?.asHint(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      children: List<Widget>.generate(
                        item.labels!.length,
                        (final int index) => Padding(
                          padding: const EdgeInsets.only(
                            right: 8,
                            bottom: 8,
                          ),
                          child: IssueLabel(item.labels![index]),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
}

class GetPullIcon extends StatelessWidget {
  const GetPullIcon(this.state, this.mergedAt, {super.key});

  final IssueState state;
  final DateTime? mergedAt;

  @override
  Widget build(final BuildContext context) {
    switch (state) {
      case IssueState.CLOSED:
        if (mergedAt == null) {
          return const Icon(
            Octicons.git_pull_request,
            // color: red,
            size: 15,
          );
        } else {
          return const Icon(
            Octicons.git_merge,
            // color: deepPurple,
            size: 15,
          );
        }
      case IssueState.OPEN:
      case IssueState.REOPENED:
        return const Icon(
          Octicons.git_pull_request,
          // color: green,
          size: 15,
        );
    }
  }
}
