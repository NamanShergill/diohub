import 'package:flutter/material.dart';
import 'package:onehub/common/api_wrapper_widget.dart';
import 'package:onehub/common/issues/issue_label.dart';
import 'package:onehub/common/issues/issue_list_card.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/profile_banner.dart';
import 'package:onehub/common/pulls/pull_list_card.dart';
import 'package:onehub/models/events/events_model.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/issues/issue_timeline_event_model.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/services/pulls/pulls_service.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';
import 'package:onehub/view/repository/commits/widgets/commit_s_h_a_button.dart';

TextStyle basicCardTheme = TextStyle(color: AppColor.grey3);

class BasicEventCard extends StatelessWidget {
  final UserInfoModel user;
  final IconData leading;
  final String name;
  final Color iconColor;
  final String date;
  final Widget content;
  BasicEventCard(
      {this.user,
      this.content,
      this.date,
      this.leading,
      this.iconColor,
      this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                leading,
                size: 16,
                color: iconColor ?? AppColor.grey3,
              ),
              SizedBox(
                width: 4,
              ),
              if (user != null)
                ProfileTile(
                  user.avatarUrl,
                  showName: true,
                  size: 20,
                  textStyle: TextStyle(
                      fontSize: 12,
                      color: AppColor.grey3,
                      fontWeight: FontWeight.bold),
                  padding: EdgeInsets.all(4),
                  userLogin: user.login,
                ),
              if (name != null)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor.grey3,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              Text(
                'on ${getDate(date, shorten: false)}',
                style: TextStyle(fontSize: 12, color: AppColor.grey3),
              ),
            ],
          ),
          Divider(),
          SizedBox(
            height: 4,
          ),
          Flexible(
            child: content,
          ),
        ],
      ),
    );
  }
}

class BasicEventTextCard extends StatelessWidget {
  final UserInfoModel user;
  final IconData leading;
  final Color iconColor;
  final String date;
  final String content;
  BasicEventTextCard(
      {this.user, this.content, this.date, this.leading, this.iconColor});
  @override
  Widget build(BuildContext context) {
    return BasicEventCard(
      iconColor: iconColor,
      content: Text(
        content,
        style: basicCardTheme,
      ),
      date: date,
      user: user,
      leading: leading,
    );
  }
}

class BasicEventAssignedCard extends StatelessWidget {
  final UserInfoModel user;
  final IconData leading;
  final Color iconColor;
  final String date;
  final bool isAssigned;
  final UserInfoModel content;
  BasicEventAssignedCard(
      {this.user,
      this.content,
      this.isAssigned,
      this.date,
      this.leading,
      this.iconColor});
  @override
  Widget build(BuildContext context) {
    return BasicEventCard(
      iconColor: iconColor,
      content: Row(
        children: [
          Text(
            isAssigned ? 'Assigned' : 'Unassigned',
            style: basicCardTheme,
          ),
          SizedBox(
            width: 4,
          ),
          content.login != user.login
              ? ProfileTile(
                  content.avatarUrl,
                  showName: true,
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColor.grey3),
                  padding: EdgeInsets.all(4),
                  userLogin: content.login,
                )
              : Text(
                  'themselves',
                  style: basicCardTheme,
                ),
          SizedBox(
            width: 4,
          ),
          Text(
            '${isAssigned ? 'to' : 'from'} the issue.',
            style: basicCardTheme,
          ),
        ],
      ),
      date: date,
      user: user,
      leading: leading,
    );
  }
}

class BasicEventLabeledCard extends StatelessWidget {
  final UserInfoModel user;
  final IconData leading;
  final Color iconColor;
  final String date;
  final Label content;
  final bool added;
  BasicEventLabeledCard(
      {this.user,
      this.content,
      this.added,
      this.date,
      this.leading,
      this.iconColor});
  @override
  Widget build(BuildContext context) {
    return BasicEventCard(
      iconColor: iconColor,
      content: Row(
        children: [
          Text(
            '${added ? 'Added' : 'Removed'} the',
            style: basicCardTheme,
          ),
          SizedBox(
            width: 8,
          ),
          IssueLabel(content),
          SizedBox(
            width: 8,
          ),
          Text(
            'label ${added ? 'to' : 'from'} the issue.',
            style: basicCardTheme,
          ),
        ],
      ),
      date: date,
      user: user,
      leading: leading,
    );
  }
}

class BasicIssueCrossReferencedCard extends StatelessWidget {
  final UserInfoModel user;
  final IconData leading;
  final Color iconColor;
  final String date;
  final Source content;
  BasicIssueCrossReferencedCard(
      {this.user, this.content, this.date, this.leading, this.iconColor});
  @override
  Widget build(BuildContext context) {
    return BasicEventCard(
      iconColor: iconColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mentioned this.',
            style: basicCardTheme,
          ),
          IssueListCard(
            IssueModel.fromJson(content.issue.toJson()),
            compact: true,
            padding: EdgeInsets.only(top: 8),
          ),
        ],
      ),
      date: date,
      user: user,
      leading: leading,
    );
  }
}

class BasicPullCrossReferencedCard extends StatelessWidget {
  final UserInfoModel user;
  final IconData leading;
  final Color iconColor;
  final String date;
  final Source content;
  BasicPullCrossReferencedCard(
      {this.user, this.content, this.date, this.leading, this.iconColor});
  @override
  Widget build(BuildContext context) {
    return BasicEventCard(
      iconColor: iconColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mentioned this.',
            style: basicCardTheme,
          ),
          APIWrapper<PullRequestModel>(
            getCall: PullsService.getPullInformation(
                fullUrl: content.issue.pullRequest.url),
            loadingBuilder: (context) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Material(
                  elevation: 2,
                  color: AppColor.background,
                  borderRadius: AppThemeBorderRadius.medBorderRadius,
                  child: Container(
                      height: 80, child: Center(child: LoadingIndicator())),
                ),
              );
            },
            responseBuilder: (context, data) {
              return PullListCard(
                data,
                compact: true,
                padding: EdgeInsets.only(top: 8),
              );
            },
          ),
        ],
      ),
      date: date,
      user: user,
      leading: leading,
    );
  }
}

class BasicEventCommitCard extends StatelessWidget {
  final Author user;
  final IconData leading;
  final Color iconColor;
  final String date;
  final String sha;
  final String message;
  final String commitURL;
  BasicEventCommitCard(
      {this.user,
      this.sha,
      this.commitURL,
      this.date,
      this.message,
      this.leading,
      this.iconColor});
  @override
  Widget build(BuildContext context) {
    return BasicEventCard(
      iconColor: iconColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Added commit.',
            style: basicCardTheme.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            message,
            style: basicCardTheme,
          ),
          SizedBox(
            height: 8,
          ),
          CommitSHAButton(sha, commitURL),
        ],
      ),
      date: date,
      name: user.name,
      leading: leading,
    );
  }
}
