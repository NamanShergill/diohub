import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide State;
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/issues/issue_label.dart';
import 'package:onehub/common/pulls/pull_loading_card.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';

class IssueListCard extends StatelessWidget {
  final IssueModel item;
  final bool compact;
  final EdgeInsets padding;
  final bool disableMaterial;
  final DateTime? commentsSince;
  final bool showRepoName;
  IssueListCard(this.item,
      {this.compact = false,
      this.showRepoName = true,
      this.disableMaterial = false,
      this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
      this.commentsSince});
  @override
  Widget build(BuildContext context) {
    if (item.pullRequest != null)
      return PullLoadingCard(item.pullRequest!.url!);
    return Padding(
      padding: padding,
      child: Material(
        elevation: disableMaterial ? 0 : 2,
        color: disableMaterial ? Colors.transparent : AppColor.background,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        child: InkWell(
          borderRadius: AppThemeBorderRadius.medBorderRadius,
          onTap: () {
            AutoRouter.of(context).push(IssueScreenRoute(
                issueURL: item.url,
                repoURL: item.repositoryUrl,
                commentsSince: commentsSince,
                initialIndex: commentsSince != null ? 1 : 0));
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    getIcon(item.state)!,
                    SizedBox(
                      width: 4,
                    ),
                    if (showRepoName)
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text(
                            item.url!
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
                      '#${item.number}',
                      style: TextStyle(color: AppColor.grey3),
                    ),
                    if (item.comments != 0)
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Octicons.comment,
                            color: AppColor.grey3,
                            size: 11,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '${item.comments} comments',
                            style:
                                TextStyle(color: AppColor.grey3, fontSize: 12),
                          ),
                        ],
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
                            ? 'By ${item.user!.login}, closed ${getDate(item.closedAt.toString(), shorten: false)}.'
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

Widget? getIcon(IssueState? state) {
  switch (state) {
    case IssueState.CLOSED:
      return Icon(
        Octicons.issue_closed,
        color: Colors.red,
        size: 15,
      );
    case IssueState.OPEN:
      return Icon(
        Octicons.issue_opened,
        color: Colors.green,
        size: 15,
      );
    default:
      return null;
  }
}
