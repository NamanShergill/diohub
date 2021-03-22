import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/issues/issue_label.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';

class PullListCard extends StatelessWidget {
  final PullRequestModel item;
  final bool compact;
  final bool disableMaterial;
  final EdgeInsets padding;
  PullListCard(this.item,
      {this.compact = false,
      this.disableMaterial = false,
      this.padding = const EdgeInsets.symmetric(horizontal: 8.0)});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: disableMaterial ? EdgeInsets.zero : padding,
      child: Material(
        elevation: disableMaterial ? 0 : 2,
        color: disableMaterial ? Colors.transparent : AppColor.background,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        child: InkWell(
          borderRadius: AppThemeBorderRadius.medBorderRadius,
          onTap: () {
            AutoRouter.of(context).push(PullScreenRoute(pullURL: item.url));
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    getIcon(item.state, item.mergedAt)!,
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '#${item.number}',
                      style: TextStyle(color: AppColor.grey3),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  item.title!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 14),
                ),
                if (!compact)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        item.state == IssueState.CLOSED
                            ? item.mergedAt != null
                                ? 'By ${item.user!.login}, merged ${getDate(item.mergedAt.toString(), shorten: false)}.'
                                : 'By ${item.user!.login}, closed ${getDate(item.closedAt.toString(), shorten: false)}.'
                            : 'Opened ${getDate(item.createdAt.toString(), shorten: false)} by ${item.user!.login}',
                        style: TextStyle(color: AppColor.grey3, fontSize: 12),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Wrap(
                        children: List.generate(
                            item.labels!.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, bottom: 8),
                                  child: IssueLabel(item.labels![index]),
                                )),
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

Widget? getIcon(IssueState? state, DateTime? mergedAt) {
  switch (state) {
    case IssueState.CLOSED:
      if (mergedAt == null)
        return Icon(
          Octicons.git_pull_request,
          color: Colors.red,
          size: 15,
        );
      else
        return Icon(
          Octicons.git_merge,
          color: Colors.deepPurple,
          size: 15,
        );
    case IssueState.OPEN:
      return Icon(
        Octicons.git_pull_request,
        color: Colors.green,
        size: 15,
      );
    default:
      return null;
  }
}
