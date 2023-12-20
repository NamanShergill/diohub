import 'package:auto_route/auto_route.dart';
import 'package:diohub/adapters/deep_linking_handler.dart';
import 'package:diohub/common/misc/ink_pot.dart';
import 'package:diohub/common/misc/loading_indicator.dart';
import 'package:diohub/common/misc/shimmer_widget.dart';
import 'package:diohub/common/pulls/pull_list_card.dart';
import 'package:diohub/common/wrappers/api_wrapper_widget.dart';
import 'package:diohub/models/issues/issue_model.dart';
import 'package:diohub/models/pull_requests/pull_request_model.dart';
import 'package:diohub/services/pulls/pulls_service.dart';
import 'package:diohub/view/issues_pulls/issue_pull_screen.dart';
import 'package:flutter/material.dart';

class PullLoadingCard extends StatelessWidget {
  const PullLoadingCard(
    this.url, {
    this.compact = false,
    this.issueModel,
    // this.disableMaterial = false,
    super.key,
  });

  final String url;
  final bool compact;
  final IssueModel? issueModel;

  // final bool disableMaterial;

  @override
  Widget build(final BuildContext context) =>
      APIWrapper<PullRequestModel>.deferred(
        apiCall: ({required final bool refresh}) async =>
            PullsService.getPullInformation(fullUrl: url, refresh: refresh),
        loadingBuilder: (final BuildContext context) {
          if (issueModel != null) {
            return InkPot(
              onTap: () async {
                await AutoRouter.of(context).push(
                  issuePullScreenRoute(PathData.fromURL(issueModel!.url!)),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        // const GetPullIcon(null, null),
                        const SizedBox(
                          width: 4,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Text(
                              issueModel!.url!
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
                          '#${issueModel!.number}',
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
                      issueModel!.title!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    if (!compact)
                      Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 16,
                          ),
                          ShimmerWidget.container(),
                        ],
                      ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox(
            height: 80,
            child: Center(
              child: LoadingIndicator(),
            ),
          );
        },
        builder: (final BuildContext context, final PullRequestModel data) =>
            PullListCard(
          data,
          compact: compact,
          padding: EdgeInsets.zero,
        ),
      );
}
