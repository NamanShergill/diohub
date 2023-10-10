import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/issues/issue_label.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/pulls/pull_loading_card.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/view/issues_pulls/issue_pull_screen.dart';
import 'package:flutter/material.dart' hide State;
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class IssueListCard extends StatelessWidget {
  const IssueListCard(
    this.item, {
    this.compact = false,
    this.showRepoName = true,
    // this.disableMaterial = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.commentsSince,
    super.key,
  });
  final IssueModel item;
  final bool compact;
  final EdgeInsets padding;
  // final bool disableMaterial;
  final DateTime? commentsSince;
  final bool showRepoName;
  @override
  Widget build(final BuildContext context) {
    if (item.pullRequest != null) {
      return PullLoadingCard(
        item.pullRequest!.url!,
        issueModel: item,
        // disableMaterial: disableMaterial,
        compact: compact,
        padding: padding,
      );
    }
    return Padding(
      padding: padding,
      child: Card(
        // elevation: disableMaterial ? 0 : 2,
        // color: disableMaterial
        //     ? Colors.transparent
        //     : Provider.of<PaletteSettings>(context).currentSetting.primary,
        // borderRadius: medBorderRadius,
        child: InkWell(
          borderRadius: medBorderRadius,
          onTap: () async {
            await AutoRouter.of(context)
                .push(issuePullScreenRoute(PathData.fromURL(item.url!)));
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    getIcon(item.state!),
                    const SizedBox(
                      width: 4,
                    ),
                    if (showRepoName)
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Text(
                            item.url!
                                .replaceAll('https://api.github.com/repos/', '')
                                .split('/')
                                .sublist(0, 2)
                                .join('/'),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                // color: Provider.of<PaletteSettings>(context)
                                //     .currentSetting
                                //     .faded3,
                                ),
                          ),
                        ),
                      ),
                    Text(
                      '#${item.number}',
                      style: TextStyle(
                          // color: Provider.of<PaletteSettings>(context)
                          //     .currentSetting
                          //     .faded3,
                          ),
                    ),
                    if (item.comments != 0)
                      Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Octicons.comment,
                            // color: Provider.of<PaletteSettings>(context)
                            //     .currentSetting
                            //     .faded3,
                            size: 11,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '${item.comments} comments',
                            style: TextStyle(
                              // color: Provider.of<PaletteSettings>(context)
                              //     .currentSetting
                              //     .faded3,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  item.title!,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 14),
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
                            ? 'By ${item.user!.login}, closed ${getDate(item.closedAt.toString(), shorten: false)}.'
                            : 'Opened ${getDate(item.createdAt.toString(), shorten: false)} by ${item.user!.login}',
                        style: TextStyle(
                          // color: Provider.of<PaletteSettings>(context)
                          //     .currentSetting
                          //     .faded3,
                          fontSize: 12,
                        ),
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
        ),
      ),
    );
  }
}

Widget getIcon(final IssueState state) {
  switch (state) {
    case IssueState.CLOSED:
      return const Icon(
        Octicons.issue_closed,
        color: Colors.red,
        size: 15,
      );
    case IssueState.OPEN:
      return const Icon(
        Octicons.issue_opened,
        color: Colors.green,
        size: 15,
      );
    case IssueState.REOPENED:
      return const Icon(
        Octicons.issue_reopened,
        color: Colors.green,
        size: 15,
      );
  }
}

class IssueLoadingCard extends StatelessWidget {
  const IssueLoadingCard(
    this.url, {
    this.compact = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    // this.backgroundColor,
    super.key,
  });
  final String url;
  // final Color? backgroundColor;
  final bool compact;
  final EdgeInsets padding;
  @override
  Widget build(final BuildContext context) => Padding(
        padding: padding,
        child: APIWrapper<IssueModel>(
          apiCall: ({required final bool refresh}) async =>
              IssuesService.getIssueInfo(fullUrl: url, refresh: refresh),
          loadingBuilder: (final BuildContext context) => const SizedBox(
            height: 80,
            child: Center(child: LoadingIndicator()),
          ),
          responseBuilder:
              (final BuildContext context, final IssueModel data) =>
                  IssueListCard(
            data,
            compact: compact,
            // disableMaterial: true,
            padding: EdgeInsets.zero,
          ),
        ),
      );
}
