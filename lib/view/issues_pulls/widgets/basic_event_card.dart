import 'package:flutter/material.dart';
import 'package:onehub/common/issues/issue_label.dart';
import 'package:onehub/common/issues/issue_list_card.dart';
import 'package:onehub/common/profile_banner.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/issues/issue_timeline_event_model.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';

TextStyle basicCardTheme =
    TextStyle(fontWeight: FontWeight.bold, color: AppColor.grey3);

class BasicEventCard extends StatelessWidget {
  final UserInfoModel user;
  final IconData leading;
  final Color iconColor;
  final String date;
  final Widget content;
  BasicEventCard(
      {this.user, this.content, this.date, this.leading, this.iconColor});
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
              ProfileTile(
                user.avatarUrl,
                showName: true,
                size: 20,
                textStyle: TextStyle(fontSize: 14),
                padding: EdgeInsets.all(4),
                userLogin: user.login,
              ),
              SizedBox(
                width: 2,
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
  final UserInfoModel content;
  BasicEventAssignedCard(
      {this.user, this.content, this.date, this.leading, this.iconColor});
  @override
  Widget build(BuildContext context) {
    return BasicEventCard(
      iconColor: iconColor,
      content: Row(
        children: [
          Text(
            'Assigned',
            style: basicCardTheme,
          ),
          SizedBox(
            width: 4,
          ),
          ProfileTile(
            content.avatarUrl,
            showName: true,
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            padding: EdgeInsets.all(4),
            userLogin: content.login,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            'to the issue.',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: AppColor.grey3),
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
            style:
                TextStyle(fontWeight: FontWeight.bold, color: AppColor.grey3),
          ),
        ],
      ),
      date: date,
      user: user,
      leading: leading,
    );
  }
}

class BasicEventCrossReferencedCard extends StatelessWidget {
  final UserInfoModel user;
  final IconData leading;
  final Color iconColor;
  final String date;
  final Source content;
  BasicEventCrossReferencedCard(
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
            'Mentioned this issue',
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
