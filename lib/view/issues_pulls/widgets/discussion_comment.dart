import 'dart:ui';

import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/markdown_body.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseComment extends StatefulWidget {
  final ActorMixin? author;
  final CommentAuthorAssociation authorAssociation;
  final String body;
  final IconData? leading;
  final String bodyHTML;
  // Todo: Temp nullable
  final List<ReactionsMixin>? reactions;
  final DateTime? lastEditedAt;
  final DateTime createdAt;
  final bool isMinimized;
  final String? minimizedReason;
  final bool viewerCanMinimize;
  final bool viewerCanDelete;
  final bool viewerCanUpdate;
  final bool viewerDidAuthor; // Todo: Temp nullable

  final List<CommentCannotUpdateReason>? viewerCannotUpdateReasons;
  final bool viewerCanReact;
  final Widget? footer;
  final String? description;
  final Widget? header;
  final EdgeInsets headerPadding;
  const BaseComment(
      {Key? key,
      this.headerPadding = const EdgeInsets.symmetric(horizontal: 16),
      this.header,
      required this.isMinimized,
      this.minimizedReason,
      this.leading,
      required this.reactions,
      required this.viewerCanDelete,
      required this.viewerCanMinimize,
      this.description,
      this.footer,
      required this.viewerCannotUpdateReasons,
      required this.viewerCanReact,
      required this.viewerCanUpdate,
      required this.viewerDidAuthor,
      required this.createdAt,
      required this.author,
      required this.body,
      required this.lastEditedAt,
      required this.bodyHTML,
      required this.authorAssociation})
      : super(key: key);

  @override
  _BaseCommentState createState() => _BaseCommentState();
}

class _BaseCommentState extends State<BaseComment> {
  bool optionsExpanded = false;

  void addQuote(String data) {
    context.read<CommentProvider>().addQuote(widget.body);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                if (widget.leading != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      widget.leading,
                      size: 16,
                      color: AppColor.grey3,
                    ),
                  ),
                ProfileTile(
                  widget.author?.avatarUrl.toString(),
                  userLogin: widget.author?.login,
                  size: 25,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.author?.login ?? 'N/A',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    if (widget.authorAssociation !=
                            CommentAuthorAssociation.member &&
                        widget.authorAssociation !=
                            CommentAuthorAssociation.none)
                      Builder(
                        builder: (context) {
                          String? str;
                          if (widget.authorAssociation ==
                              CommentAuthorAssociation.collaborator) {
                            str = 'Collaborator';
                          } else if (widget.authorAssociation ==
                              CommentAuthorAssociation.contributor) {
                            str = 'Contributor';
                          } else if (widget.authorAssociation ==
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
                      getDate(widget.createdAt.toString(), shorten: false),
                      style: const TextStyle(
                          color: AppColor.grey3,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    if (widget.lastEditedAt != null)
                      Text(
                        'Edited ' +
                            getDate(widget.lastEditedAt.toString(),
                                shorten: false),
                        style: const TextStyle(
                            color: AppColor.grey3, fontSize: 10),
                      ),
                  ],
                ),
                widget.body.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            optionsExpanded = !optionsExpanded;
                          });
                        },
                        icon: const Icon(
                          Icons.more_vert_rounded,
                          color: AppColor.grey3,
                        ))
                    : const SizedBox(
                        width: 8,
                        height: 32,
                      ),
              ],
            ),
          ],
        ),
        // const SizedBox(height: 8),
        SizeExpandedSection(
          expand: optionsExpanded,
          child: Column(
            children: [
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.format_quote,
                ),
                onTap: () => addQuote(widget.body),
                dense: true,
                title: const Text(
                  'Quote Reply',
                  // style: TextStyle(fontSize: 13),
                ),
              ),
              const Divider(),
              ListTile(
                dense: true,
                leading: const Icon(Icons.content_copy),
                title: const Text('Select Text'),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => _SelectAndCopy(widget.body),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        if (widget.description != null)
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              widget.description!,
              style: AppThemeTextStyles.basicIssueEventCardText.copyWith(
                  fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
            ),
          ),
        if (widget.header != null)
          Padding(
            padding: widget.headerPadding,
            child: widget.header!,
          ),
        if (widget.bodyHTML.isNotEmpty)
          Row(
            children: [
              Flexible(
                  child: MarkdownBody(
                widget.bodyHTML,
              )),
            ],
          ),
        if (widget.footer != null && widget.bodyHTML.isEmpty)
          const SizedBox(
            height: 8,
          ),
        if (widget.footer != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: widget.footer!,
          ),
        if (widget.footer == null && widget.bodyHTML.isEmpty)
          const SizedBox(
            height: 8,
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
