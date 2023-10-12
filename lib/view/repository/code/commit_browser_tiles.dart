import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/api_handler/response_handler.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/models/repositories/commit_list_model.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/utils/http_to_api.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class _CommitTiles extends StatefulWidget {
  const _CommitTiles({
    required this.message,
    required this.url,
    required this.date,
    required this.authorAvatarUrl,
    required this.authorLogin,
    required this.sha,
    this.compact = false,
    this.highlighted = false,
    this.onSelected,
    // this.backgroundColor,
  });
  final bool highlighted;
  final ValueChanged<String>? onSelected;
  final String sha;
  final String message;
  final String? authorAvatarUrl;
  final String? authorLogin;
  final DateTime date;
  final String url;
  final bool compact;
  // final Color? backgroundColor;

  @override
  _CommitTilesState createState() => _CommitTilesState();
}

class _CommitTilesState extends State<_CommitTiles> {
  bool expanded = false;

  Future<void> copySha() async {
    await Clipboard.setData(ClipboardData(text: widget.sha));
    ResponseHandler.setSuccessMessage(
      AppPopupData(title: 'Copied SHA to clipboard.'),
    );
  }

  @override
  Widget build(final BuildContext context) => Card(
        elevation: 2,
        // borderRadius: medBorderRadius,
        color: widget.highlighted ? context.colorScheme.primary : null,
        child: InkWell(
          borderRadius: medBorderRadius,
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    widget.message,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                if (!widget.compact)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          ProfileTile.avatar(
                                            avatarUrl: widget.authorAvatarUrl,
                                            size: 13,
                                            padding: EdgeInsets.zero,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            widget.authorLogin ?? 'N/A',
                                            style:
                                                const TextStyle(fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Octicons.git_commit,
                              size: 11,
                              color: widget.highlighted
                                  ? context.colorScheme.onPrimary
                                  : context.colorScheme.onSurface,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.sha.substring(0, 6),
                              style: TextStyle(
                                fontSize: 11,
                                color: widget.highlighted
                                    ? context.colorScheme.onPrimary
                                    : null,
                              ),
                            ),
                            Icon(
                              expanded
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              size: 13,
                              color: widget.highlighted
                                  ? context.colorScheme.onPrimary
                                  : null,
                            ),
                          ],
                        ),
                        if (!widget.compact)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.timelapse_outlined,
                                    size: 11,
                                    color: widget.highlighted
                                        ? context.colorScheme.onPrimary
                                        : context.colorScheme.onSurface,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    getDate(
                                      widget.date.toString(),
                                      shorten: false,
                                    ),
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: widget.highlighted
                                          ? context.colorScheme.onPrimary
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: expanded ? 8 : 16,
              ),
              SizeExpandedSection(
                expand: expanded,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      height: 0,
                    ),
                    InkWell(
                      onTap: () async {
                        if (widget.onSelected != null) {
                          widget.onSelected!(widget.sha);
                        } else {
                          await AutoRouter.of(context).push(
                            RepositoryRoute(
                              repositoryURL:
                                  toRepoAPIResource(widget.url, endIndex: 2),
                              index: 2,
                              initSHA: widget.sha,
                            ),
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'View Code',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Octicons.code),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                    ),
                    InkWell(
                      onTap: () async {
                        await AutoRouter.of(context)
                            .push(CommitInfoRoute(commitURL: widget.url));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Commit Details',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Octicons.git_commit),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                    ),
                    InkWell(
                      onTap: copySha,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Copy SHA',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(MdiIcons.contentCopy),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class CommitTilesREST extends StatelessWidget {
  const CommitTilesREST({
    required this.item,
    super.key,
    this.highlighted = false,
    this.onSelected,
  });
  final CommitListModel item;
  final bool highlighted;
  final ValueChanged<String>? onSelected;

  @override
  Widget build(final BuildContext context) => _CommitTiles(
        highlighted: highlighted,
        onSelected: onSelected,
        message: item.commit!.message!,
        url: item.url!,
        date: item.commit!.committer!.date!,
        authorAvatarUrl: item.author!.avatarUrl,
        authorLogin: item.author!.login,
        sha: item.sha!,
      );
}

class CommitTilesGQL extends StatelessWidget {
  const CommitTilesGQL({
    required this.item,
    super.key,
    this.highlighted = false,
    this.onSelected,
    this.compact = true,
    this.backgroundColor,
  });
  final CommitMixin item;
  final bool highlighted;
  final bool compact;
  final Color? backgroundColor;
  final ValueChanged<String>? onSelected;

  @override
  Widget build(final BuildContext context) => _CommitTiles(
        highlighted: highlighted,
        onSelected: onSelected,
        // backgroundColor: backgroundColor ??
        //     Provider.of<PaletteSettings>(context).currentSetting.secondary,
        compact: compact,
        message: item.messageHeadline,
        url: toApiURL,
        date: item.authoredDate,
        authorAvatarUrl: item.author?.user?.avatarUrl.toString(),
        authorLogin: item.author?.user?.login,
        sha: item.oid,
      );

  String get toApiURL {
    final List<String> temp = item.commitUrl
        .toString()
        .replaceAll('https://github.com/', '')
        .split('/');
    temp[2] = 'commits';
    return toRepoAPIResource(temp.join('/'));
  }
}
