import 'package:dio_hub/common/markdown_body.dart';
import 'package:dio_hub/common/profile_banner.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseComment extends StatelessWidget {
  final IssueCommentMixin comment;
  const BaseComment(this.comment, {Key? key}) : super(key: key);
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
                  comment.author!.avatarUrl.toString(),
                  userLogin: comment.author!.login,
                  size: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.author!.login,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    if (comment.authorAssociation !=
                            CommentAuthorAssociation.member &&
                        comment.authorAssociation !=
                            CommentAuthorAssociation.none)
                      Builder(
                        builder: (context) {
                          String? str;
                          if (comment.authorAssociation ==
                              CommentAuthorAssociation.collaborator) {
                            str = 'Collaborator';
                          } else if (comment.authorAssociation ==
                              CommentAuthorAssociation.contributor) {
                            str = 'Contributor';
                          } else if (comment.authorAssociation ==
                              CommentAuthorAssociation.owner) {
                            str = 'Owner';
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              str ?? '',
                              style: const TextStyle(
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
              getDate(comment.createdAt.toString(), shorten: false),
              style: const TextStyle(color: AppColor.grey3, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(),
        Row(
          children: [
            Flexible(
                child: MarkdownRenderAPI(
              comment.bodyHTML,
            )),
          ],
        ),
        // if (url != null)
        //   ReactionBar(
        //     url,
        //     Provider.of<CurrentUserProvider>(context, listen: false)
        //         .currentUserInfo
        //         ?.login,
        //     isEnabled: !isLocked!,
        //   ),
      ],
    );
  }
}
