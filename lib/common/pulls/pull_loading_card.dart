import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/common/pulls/pull_list_card.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/pull_requests/pull_request_model.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/pulls/pulls_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class PullLoadingCard extends StatelessWidget {
  final String url;
  final bool compact;
  final IssueModel? issueModel;
  final EdgeInsets padding;
  const PullLoadingCard(this.url,
      {this.compact = false,
      this.issueModel,
      this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        elevation: 2,
        color: AppColor.background,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        child: APIWrapper<PullRequestModel>(
          apiCall: PullsService.getPullInformation(fullUrl: url),
          loadingBuilder: (context) {
            if (issueModel != null) {
              return InkWell(
                borderRadius: AppThemeBorderRadius.medBorderRadius,
                onTap: () {
                  AutoRouter.of(context).push(PullScreenRoute(pullURL: url));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          getIcon(null, null)!,
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
                                style: TextStyle(color: AppColor.grey3),
                              ),
                            ),
                          ),
                          Text(
                            '#${issueModel!.number}',
                            style: TextStyle(color: AppColor.grey3),
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
                              borderRadius:
                                  AppThemeBorderRadius.smallBorderRadius,
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
