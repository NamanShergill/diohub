import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/api_wrapper_widget.dart';
import 'package:onehub/common/pulls/pull_list_card.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/services/pulls/pulls_service.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class PullLoadingCard extends StatelessWidget {
  final String url;
  final bool compact;
  final IssueModel? issueModel;
  PullLoadingCard(this.url, {this.compact = false, this.issueModel});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: AppColor.background,
      borderRadius: AppThemeBorderRadius.medBorderRadius,
      child: APIWrapper<PullRequestModel>(
        getCall: PullsService.getPullInformation(fullUrl: url),
        loadingBuilder: (context) {
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
                      SizedBox(
                        width: 4,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text(
                            issueModel!.url!
                                .replaceAll('https://api.github.com/repos/', '')
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
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    issueModel!.title!,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ShimmerWidget(
                    borderRadius: AppThemeBorderRadius.smallBorderRadius,
                    child: Container(
                      height: 20,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
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
    );
  }
}
