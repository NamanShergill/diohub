import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' hide Text;
import 'package:onehub/common/markdown_body.dart';
import 'package:onehub/common/profile_image.dart';
import 'package:onehub/models/issues/issue_timeline_event_model.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';

class DiscussionComment extends StatelessWidget {
  final IssuesTimelineEventModel item;
  DiscussionComment(this.item);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: AppColor.onBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ProfileInfo(
                      item.user.avatarUrl,
                      userLogin: item.user.login,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.user.login,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        if (item.authorAssociation !=
                                AuthorAssociation.MEMBER &&
                            item.authorAssociation != AuthorAssociation.NONE)
                          Builder(
                            builder: (context) {
                              String str;
                              if (item.authorAssociation ==
                                  AuthorAssociation.COLLABORATOR)
                                str = 'Collaborator';
                              else if (item.authorAssociation ==
                                  AuthorAssociation.CONTRIBUTOR)
                                str = 'Contributor';
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
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
                  getDate(item.createdAt.toString(), shorten: false),
                  style: TextStyle(color: AppColor.grey3, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 8),
            Divider(),
            Row(
              children: [
                Flexible(child: MarkdownBody(markdownToHtml(item.body))),
              ],
            ),
            // Todo: Add reactions later.
            // APIWrapper<List<ReactionsModel>>(
            //   apiCall: ReactionsService.getCommitCommentReactions(item.url),
            //   responseBuilder: (context, data) {
            //     return Wrap(
            //       children: List.generate(
            //           data.length,
            //           (index) => Text(
            //               EmojiParser().emojify(":${data[index].content}:"))),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
