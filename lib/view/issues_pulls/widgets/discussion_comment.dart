import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/markdown_body.dart';
import 'package:onehub/common/profile_banner.dart';
import 'package:onehub/common/reaction_bar.dart';
import 'package:onehub/models/issues/issue_comments_model.dart';
import 'package:onehub/models/issues/issue_timeline_event_model.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/providers/users/current_user_provider.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';
import 'package:provider/provider.dart';

class TimelineDiscussionComment extends StatelessWidget {
  final TimelineEventModel? item;
  final bool? isLocked;
  TimelineDiscussionComment(this.item, this.isLocked);
  @override
  Widget build(BuildContext context) {
    return BaseComment(
      body: item!.body,
      user: item!.user,
      url: item!.url,
      authorAssociation: item!.authorAssociation,
      createdAt: item!.createdAt,
      isLocked: isLocked,
    );
  }
}

class DiscussionComment extends StatelessWidget {
  final IssueCommentsModel item;
  DiscussionComment(this.item);
  @override
  Widget build(BuildContext context) {
    return BaseComment(
      body: item.body,
      user: item.user,
      authorAssociation: item.authorAssociation,
      createdAt: item.createdAt,
      url: item.url,
    );
  }
}

class BaseComment extends StatelessWidget {
  final UserInfoModel? user;
  final AuthorAssociation? authorAssociation;
  final DateTime? createdAt;
  final String? body;
  final bool? isLocked;
  final String? url;
  BaseComment(
      {this.authorAssociation,
      this.url,
      this.user,
      this.createdAt,
      this.body,
      this.isLocked = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                ProfileTile(
                  user!.avatarUrl,
                  userLogin: user!.login,
                  size: 30,
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user!.login!,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    if (authorAssociation != AuthorAssociation.MEMBER &&
                        authorAssociation != AuthorAssociation.NONE)
                      Builder(
                        builder: (context) {
                          String? str;
                          if (authorAssociation ==
                              AuthorAssociation.COLLABORATOR)
                            str = 'Collaborator';
                          else if (authorAssociation ==
                              AuthorAssociation.CONTRIBUTOR)
                            str = 'Contributor';
                          else if (authorAssociation == AuthorAssociation.OWNER)
                            str = 'Owner';
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              str ?? '',
                              style: TextStyle(
                                  fontSize: 12, color: AppColor.grey3),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ],
            ),
            Text(
              getDate(createdAt.toString(), shorten: false),
              style: TextStyle(color: AppColor.grey3, fontSize: 12),
            ),
          ],
        ),
        SizedBox(height: 8),
        Divider(),
        Row(
          children: [
            Flexible(child: MarkdownBody(body)),
          ],
        ),
        if (url != null)
          ReactionBar(
              url,
              Provider.of<CurrentUserProvider>(context, listen: false)
                  .currentUserInfo!
                  .login,
              !isLocked!),
      ],
    );
  }
}
