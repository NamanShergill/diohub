import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/common/pulls/pull_list_card.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/pull_requests/pull_request_model.dart';
import 'package:dio_hub/services/pulls/pulls_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/view/issues_pulls/issue_pull_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PullLoadingCard extends StatelessWidget {
  const PullLoadingCard(this.url,
      {this.compact = false,
      this.issueModel,
      this.disableMaterial = false,
      this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
      Key? key})
      : super(key: key);
  final String url;
  final bool compact;
  final IssueModel? issueModel;
  final EdgeInsets padding;
  final bool disableMaterial;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        elevation: disableMaterial ? 0 : 2,
        color: Provider.of<PaletteSettings>(context).currentSetting.primary,
        borderRadius: medBorderRadius,
        child: APIWrapper<PullRequestModel>(
          apiCall: (refresh) => PullsService.getPullInformation(fullUrl: url),
          loadingBuilder: (context) {
            if (issueModel != null) {
              return InkWell(
                borderRadius: medBorderRadius,
                onTap: () {
                  AutoRouter.of(context).push(
                      issuePullScreenRoute(PathData.fromURL(issueModel!.url!)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const GetIcon(null, null),
                          const SizedBox(
                            width: 4,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Text(
                                issueModel!.url!
                                    .replaceAll(
                                        'https://api.github.com/repos/', '')
                                    .split('/')
                                    .sublist(0, 2)
                                    .join('/'),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Provider.of<PaletteSettings>(context)
                                        .currentSetting
                                        .faded3),
                              ),
                            ),
                          ),
                          Text(
                            '#${issueModel!.number}',
                            style: TextStyle(
                                color: Provider.of<PaletteSettings>(context)
                                    .currentSetting
                                    .faded3),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        issueModel!.title!,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 14),
                      ),
                      if (!compact)
                        Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            ShimmerWidget(
                              borderRadius: smallBorderRadius,
                              child: Container(
                                height: 20,
                                width: double.infinity,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox(
                height: 80, child: Center(child: LoadingIndicator()));
          },
          responseBuilder: (context, data) {
            return PullListCard(
              data,
              compact: compact,
              disableMaterial: true,
              padding: EdgeInsets.zero,
            );
          },
        ),
      ),
    );
  }
}
