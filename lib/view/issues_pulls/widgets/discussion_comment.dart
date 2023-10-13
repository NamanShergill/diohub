import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio_hub/common/markdown_view/markdown_body.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/common/misc/menu_button.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/misc/reaction_bar.dart';
import 'package:dio_hub/common/misc/tappable_card.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/utils/copy_to_clipboard.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:provider/provider.dart';
import 'package:pull_down_button/pull_down_button.dart';

class BaseComment extends StatefulWidget {
  const BaseComment({
    required this.onQuote,
    required this.isMinimized,
    required this.reactions,
    required this.viewerCanDelete,
    required this.viewerCanMinimize,
    required this.viewerCannotUpdateReasons,
    required this.viewerCanReact,
    required this.viewerCanUpdate,
    required this.viewerDidAuthor,
    required this.createdAt,
    required this.author,
    required this.body,
    required this.lastEditedAt,
    required this.bodyHTML,
    required this.authorAssociation,
    super.key,
    // this.headerPadding = const EdgeInsets.symmetric(horizontal: 16),
    // this.header,
    this.minimizedReason,
    this.leading,
    this.description,
    this.footer,
    this.footerPadding = const EdgeInsets.only(top: 8, left: 8, right: 8),
  });
  final ActorMixin? author;
  final CommentAuthorAssociation authorAssociation;
  final String body;
  final IconData? leading;
  final String? bodyHTML;
  // TODO(namanshergill): Temp nullable
  final List<ReactionGroupsMixin> reactions;
  final DateTime? lastEditedAt;
  final DateTime createdAt;
  final bool isMinimized;
  final String? minimizedReason;
  final bool viewerCanMinimize;
  final bool viewerCanDelete;
  final bool viewerCanUpdate;
  final bool viewerDidAuthor;
  // TODO(namanshergill): Temp nullable
  final List<CommentCannotUpdateReason>? viewerCannotUpdateReasons;
  final bool viewerCanReact;
  final Widget? footer;
  final String? description;
  // final Widget? header;
  final VoidCallback onQuote;
  // final EdgeInsets headerPadding;
  final EdgeInsets footerPadding;

  @override
  BaseCommentState createState() => BaseCommentState();
}

class BaseCommentState extends State<BaseComment> {
  void addQuote(final String data) {
    context.read<CommentProvider>().addQuote(widget.body);
  }

  @override
  Widget build(final BuildContext context) => MenuButton(
        itemBuilder: (final BuildContext context) => <PullDownMenuEntry>[
          PullDownMenuActionsRow.medium(
            items: <PullDownMenuItem>[
              PullDownMenuItem(
                onTap: () {
                  // addQuote(widget.body);
                  // widget.onQuote();
                },
                title: 'Edit',
                icon: Icons.edit_rounded,
              ),
              // PullDownMenuItem(
              //   onTap: () {
              //     // addQuote(widget.body);
              //     // widget.onQuote();
              //   },
              //   title: 'History',
              //   icon: Icons.history_rounded,
              // ),
              PullDownMenuItem(
                onTap: () {
                  // addQuote(widget.body);
                  // widget.onQuote();
                },
                title: 'React',
                icon: Icons.emoji_emotions_rounded,
              ),
              // PullDownMenuItem(
              //   onTap: () async => showDialog(
              //     context: context,
              //     builder: (final BuildContext cxt) =>
              //     ListenableProvider<CommentProvider>.value(
              //       value: Provider.of<CommentProvider>(context),
              //       builder: (final BuildContext context,
              //           final Widget? child) =>
              //           _SelectAndCopy(
              //             widget.body,
              //             onQuote: widget.onQuote,
              //           ),
              //     ),
              //   ),
              //   title: 'Select',
              //   icon: MdiIcons.clipboardSearch,
              // ),
            ],
          ),
          PullDownMenuActionsRow.medium(
            items: <PullDownMenuItem>[
              PullDownMenuItem(
                onTap: () {
                  addQuote(widget.body);
                  widget.onQuote();
                },
                title: 'Share',
                icon: Icons.adaptive.share_rounded,
              ),
              PullDownMenuItem(
                onTap: () {
                  addQuote(widget.body);
                  widget.onQuote();
                },
                title: 'Quote',
                icon: Icons.format_quote_rounded,
              ),
              PullDownMenuItem(
                onTap: () async => showDialog(
                  context: context,
                  builder: (final BuildContext cxt) =>
                      ListenableProvider<CommentProvider>.value(
                    value: Provider.of<CommentProvider>(context),
                    builder:
                        (final BuildContext context, final Widget? child) =>
                            SelectAndCopy(
                      widget.body,
                      onQuote: widget.onQuote,
                    ),
                  ),
                ),
                title: 'Select',
                icon: MdiIcons.clipboardSearch,
              ),
            ],
          ),
          const PullDownMenuDivider.large(),
          PullDownMenuHeader(
            leading: CachedNetworkImage(
              imageUrl: widget.author!.avatarUrl.toString(),
            ),
            title: widget.author!.login,
            subtitle: 'Go to profile',
            onTap: () async {
              await context.router.push(
                OtherUserProfileRoute(login: widget.author!.login),
              );
            },
          ).themed(context),
        ],
        builder: (
          final BuildContext context,
          final Widget button,
          final Future<void> Function() showMenu,
        ) =>
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CardHeader(
              child: _buildHeader(context, button),
            ),
            // const SizedBox(height: 8),

            BasicCard.linked(
              cardLinkType:
                  _reactionsNotEmpty() ? CardLinkType.both : CardLinkType.atTop,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: <Widget>[
                    if (widget.description != null)
                      Text(
                        widget.description!,
                        // style: AppThemeTextStyles.basicIssueEventCardText(context)
                        //     .copyWith(
                        //   fontWeight: FontWeight.bold,
                        //   fontStyle: FontStyle.italic,
                        // ),
                      ),
                    if (widget.bodyHTML?.isNotEmpty ?? false)
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Theme(
                              data: context.themeData.copyWith(
                                cardTheme: context.themeData.cardTheme
                                    .copyWith(elevation: 3),
                                colorScheme: context.colorScheme.copyWith(
                                  surfaceVariant: context
                                      .colorScheme.surfaceVariant
                                      .asHint(),
                                  background:
                                      context.colorScheme.background.asHint(),
                                ),
                              ),
                              child: MarkdownBody(
                                widget.bodyHTML!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (widget.footer != null)
                      Padding(
                        padding: widget.footerPadding,
                        child: widget.footer,
                      ),
                    if (widget.footer == null &&
                        (widget.bodyHTML?.isEmpty ?? false))
                      const SizedBox(
                        height: 8,
                      ),
                  ],
                ),
              ),
            ),

            if (_reactionsNotEmpty())
              BasicCard.linked(
                color: context.colorScheme.surfaceVariant,
                // elevation: 0,
                cardLinkType: CardLinkType.atTop,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ReactionBar(
                    widget.reactions,
                    viewerCanReact: widget.viewerCanReact,
                  ),
                ),
              ),
          ],
        ),
      );

  bool _reactionsNotEmpty() => widget.reactions
      .where(
        (final ReactionGroupsMixin element) => element.reactors.totalCount > 0,
      )
      .isNotEmpty;

  Widget _buildHeader(
    final BuildContext context,
    final Widget button,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                if (widget.leading != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      widget.leading,
                      size: 16,
                      // color: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .faded3,
                    ),
                  ),
                const SizedBox(
                  width: 4,
                ),
                ProfileTile.avatar(
                  avatarUrl: widget.author?.avatarUrl.toString(),
                  userLogin: widget.author?.login,
                  padding: EdgeInsets.zero,
                  size: 32,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.author?.login ?? 'N/A',
                      style: context.textTheme.bodyMedium,
                    ),
                    if (widget.authorAssociation !=
                            CommentAuthorAssociation.member &&
                        widget.authorAssociation !=
                            CommentAuthorAssociation.none)
                      Builder(
                        builder: (final BuildContext context) {
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
                          return Text(
                            str ?? '',
                            style: context.textTheme.bodySmall?.asHint(),
                          );
                        },
                      ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        text: getDate(widget.createdAt.toString()),
                        style: context.textTheme.bodySmall?.asHint(),
                        children: <InlineSpan>[
                          if (widget.lastEditedAt != null)
                            TextSpan(
                              text:
                                  ' • Edited ${getDate(widget.lastEditedAt.toString())}',
                              // style: context.textTheme.bodySmall?.asHint(),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                button,
              ],
            ),
          ],
        ),
      );
}

class SelectAndCopy extends StatefulWidget {
  const SelectAndCopy(this.data, {this.onQuote});
  final String data;
  final VoidCallback? onQuote;

  @override
  _SelectAndCopyState createState() => _SelectAndCopyState();
}

class _SelectAndCopyState extends State<SelectAndCopy> {
  String selectedText = '';
  @override
  Widget build(final BuildContext context) => AlertDialog(
        title: Text(
          'Select and copy',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: SingleChildScrollView(
          child: SelectableText(
            widget.data,
            style: Theme.of(context).textTheme.bodyMedium,
            onSelectionChanged: (
              final TextSelection selection,
              final SelectionChangedCause? cause,
            ) {
              setState(() {
                selectedText = selection.textInside(widget.data);
              });
            },
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Cancel'),
            ),
          ),
          MaterialButton(
            onPressed: selectedText.isNotEmpty
                ? () async {
                    await copyToClipboard(selectedText);
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                : null,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Copy'),
            ),
          ),
          if (widget.onQuote != null)
            MaterialButton(
              onPressed: selectedText.isNotEmpty
                  ? () {
                      context.read<CommentProvider>().addQuote(selectedText);
                      Navigator.pop(context);

                      widget.onQuote!();
                    }
                  : null,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Quote'),
              ),
            ),
        ],
      );
}
