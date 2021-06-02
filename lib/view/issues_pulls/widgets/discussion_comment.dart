import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/markdown_body.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseComment extends StatefulWidget {
  final IssueCommentMixin comment;
  const BaseComment(this.comment, {Key? key}) : super(key: key);

  @override
  _BaseCommentState createState() => _BaseCommentState();
}

class _BaseCommentState extends State<BaseComment> {
  bool optionsExpanded = false;

  void addQuote(String data) {
    print(RegExp('\n').hasMatch('\\n'));
    context.read<CommentProvider>().addQuote(widget.comment.bodyText);
  }

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
                  widget.comment.author?.avatarUrl.toString(),
                  userLogin: widget.comment.author!.login,
                  size: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.comment.author?.login ?? 'N/A',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    if (widget.comment.authorAssociation !=
                            CommentAuthorAssociation.member &&
                        widget.comment.authorAssociation !=
                            CommentAuthorAssociation.none)
                      Builder(
                        builder: (context) {
                          String? str;
                          if (widget.comment.authorAssociation ==
                              CommentAuthorAssociation.collaborator) {
                            str = 'Collaborator';
                          } else if (widget.comment.authorAssociation ==
                              CommentAuthorAssociation.contributor) {
                            str = 'Contributor';
                          } else if (widget.comment.authorAssociation ==
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
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      getDate(widget.comment.createdAt.toString(),
                          shorten: false),
                      style: const TextStyle(
                          color: AppColor.grey3,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    if (widget.comment.lastEditedAt != null)
                      Text(
                        'Edited ' +
                            getDate(widget.comment.createdAt.toString(),
                                shorten: false),
                        style: const TextStyle(
                            color: AppColor.grey3, fontSize: 10),
                      ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        optionsExpanded = !optionsExpanded;
                      });
                    },
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: AppColor.grey3,
                    ))
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizeExpandedSection(
          expand: optionsExpanded,
          child: Column(
            children: [
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.format_quote,
                ),
                onTap: () => addQuote(widget.comment.body),
                dense: true,
                title: Text(
                  'Quote Reply',
                  // style: TextStyle(fontSize: 13),
                ),
              ),
              const Divider(),
              ListTile(
                dense: true,
                leading: Icon(Icons.content_copy),
                title: Text('Select Text'),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => _SelectAndCopy(widget.comment.body),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Row(
          children: [
            Flexible(
                child: MarkdownBody(
              widget.comment.bodyHTML,
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

class _SelectAndCopy extends StatefulWidget {
  final String data;
  const _SelectAndCopy(this.data, {Key? key}) : super(key: key);

  @override
  __SelectAndCopyState createState() => __SelectAndCopyState();
}

class __SelectAndCopyState extends State<_SelectAndCopy> {
  String selectedText = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select and copy',
        style: Theme.of(context).textTheme.headline6,
      ),
      content: SingleChildScrollView(
        child: SelectableText(
          widget.data,
          style: Theme.of(context).textTheme.bodyText2,
          onSelectionChanged: (selection, cause) {
            selectedText = selection.textInside(widget.data);
          },
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Cancel'),
          ),
        ),
        MaterialButton(
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Copy'),
          ),
        ),
        MaterialButton(
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Quote'),
          ),
        ),
      ],
    );
  }
}
