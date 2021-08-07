import 'dart:ui';

import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/markdown_body.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:dio_hub/utils/copy_to_clipboard.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseComment extends StatefulWidget {
  const BaseComment(
      {Key? key,
      required this.onQuote,
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
      this.footerPadding = const EdgeInsets.only(top: 8.0, left: 8, right: 8),
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
  final ActorMixin? author;
  final CommentAuthorAssociation authorAssociation;
  final String body;
  final IconData? leading;
  final String? bodyHTML;
  // Todo: Temp nullable
  final List<ReactionsMixin>? reactions;
  final DateTime? lastEditedAt;
  final DateTime createdAt;
  final bool isMinimized;
  final String? minimizedReason;
  final bool viewerCanMinimize;
  final bool viewerCanDelete;
  final bool viewerCanUpdate;
  final bool viewerDidAuthor;
  // Todo: Temp nullable
  final List<CommentCannotUpdateReason>? viewerCannotUpdateReasons;
  final bool viewerCanReact;
  final Widget? footer;
  final String? description;
  final Widget? header;
  final VoidCallback onQuote;
  final EdgeInsets headerPadding;
  final EdgeInsets footerPadding;

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
                      color: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .faded3,
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
                          fontWeight: FontWeight.bold, fontSize: 12),
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
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Provider.of<PaletteSettings>(context)
                                      .currentSetting
                                      .faded3),
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
                      style: TextStyle(
                          color: Provider.of<PaletteSettings>(context)
                              .currentSetting
                              .faded3,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    if (widget.lastEditedAt != null)
                      Text(
                        'Edited ${getDate(widget.lastEditedAt.toString(), shorten: false)}',
                        style: TextStyle(
                            color: Provider.of<PaletteSettings>(context)
                                .currentSetting
                                .faded3,
                            fontSize: 10),
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
                        icon: Icon(
                          Icons.more_vert_rounded,
                          color: Provider.of<PaletteSettings>(context)
                              .currentSetting
                              .faded3,
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
                onTap: () {
                  addQuote(widget.body);
                  widget.onQuote();
                },
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
                  builder: (cxt) => ListenableProvider.value(
                    value: Provider.of<CommentProvider>(context),
                    builder: (context, child) => _SelectAndCopy(
                      widget.body,
                      onQuote: widget.onQuote,
                    ),
                  ),
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
              style:
                  AppThemeTextStyles.basicIssueEventCardText(context).copyWith(
                fontWeight: FontWeight.bold,
                // fontStyle: FontStyle.italic,
              ),
            ),
          ),
        if (widget.header != null)
          Padding(
            padding: widget.headerPadding,
            child: widget.header!,
          ),
        if (widget.bodyHTML?.isNotEmpty == true)
          Row(
            children: [
              Flexible(
                  child: MarkdownBody(
                widget.bodyHTML!,
              )),
            ],
          ),
        if (widget.footer != null && widget.bodyHTML?.isEmpty == true)
          const SizedBox(
            height: 8,
          ),
        if (widget.footer != null)
          Padding(
            padding: widget.footerPadding,
            child: widget.footer!,
          ),
        if (widget.footer == null && widget.bodyHTML?.isEmpty == true)
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
  const _SelectAndCopy(this.data, {Key? key, required this.onQuote})
      : super(key: key);
  final String data;
  final VoidCallback onQuote;

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
            setState(() {
              selectedText = selection.textInside(widget.data);
            });
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
          onPressed: selectedText.isNotEmpty
              ? () {
                  copyToClipboard(selectedText);
                  Navigator.pop(context);
                }
              : null,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Copy'),
          ),
        ),
        MaterialButton(
          onPressed: selectedText.isNotEmpty
              ? () {
                  context.read<CommentProvider>().addQuote(selectedText);
                  Navigator.pop(context);

                  widget.onQuote();
                }
              : null,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Quote'),
          ),
        ),
      ],
    );
  }
}
