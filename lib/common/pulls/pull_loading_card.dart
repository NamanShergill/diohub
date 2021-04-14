import 'package:flutter/material.dart';
import 'package:onehub/common/api_wrapper_widget.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/pulls/pull_list_card.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';
import 'package:onehub/services/pulls/pulls_service.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class PullLoadingCard extends StatelessWidget {
  final String url;
  final bool compact;
  PullLoadingCard(this.url, {this.compact = false});
  @override
  Widget build(BuildContext context) {
    return APIWrapper<PullRequestModel>(
      getCall: PullsService.getPullInformation(fullUrl: url),
      loadingBuilder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Material(
            elevation: 2,
            color: AppColor.background,
            borderRadius: AppThemeBorderRadius.medBorderRadius,
            child:
                Container(height: 80, child: Center(child: LoadingIndicator())),
          ),
        );
      },
      responseBuilder: (context, data) {
        return PullListCard(
          data,
          compact: compact,
          padding: EdgeInsets.only(top: 8),
        );
      },
    );
  }
}
