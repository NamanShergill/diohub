import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/Dio/response_handler.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/models/repositories/commit_list_model.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/utils/http_to_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class _CommitTiles extends StatefulWidget {
  final bool highlighted;
  final ValueChanged<String>? onSelected;
  final String sha;
  final String message;
  final String? authorAvatarUrl;
  final String? authorLogin;
  final DateTime date;
  final String url;
  final bool compact;
  final Color? backgroundColor;
  const _CommitTiles(
      {Key? key,
      this.compact = false,
      this.highlighted = false,
      this.onSelected,
      this.backgroundColor,
      required this.message,
      required this.url,
      required this.date,
      required this.authorAvatarUrl,
      required this.authorLogin,
      required this.sha})
      : super(key: key);

  @override
  _CommitTilesState createState() => _CommitTilesState();
}

class _CommitTilesState extends State<_CommitTiles> {
  bool expanded = false;

  void copySha() async {
    Clipboard.setData(ClipboardData(text: widget.sha));
    ResponseHandler.setSuccessMessage(
        AppPopupData(title: 'Copied SHA to clipboard.'));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: AppThemeBorderRadius.medBorderRadius,
      color: widget.highlighted
          ? Provider.of<PaletteSettings>(context).currentSetting.accent
          : widget.backgroundColor ??
              Provider.of<PaletteSettings>(context).currentSetting.onBackground,
      child: InkWell(
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        onTap: () {
          setState(() {
            expanded = !expanded;
          });
        },
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.message,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              if (!widget.compact)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        ProfileTile(
                                          widget.authorAvatarUrl,
                                          size: 13,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          widget.authorLogin ?? 'N/A',
                                          style: const TextStyle(fontSize: 11),
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
                    children: [
                      Row(
                        children: [
                          Icon(
                            Octicons.git_commit,
                            size: 11,
                            color: widget.highlighted
                                ? Provider.of<PaletteSettings>(context)
                                    .currentSetting
                                    .elementsOnColors
                                : Provider.of<PaletteSettings>(context)
                                    .currentSetting
                                    .faded3,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.sha.substring(0, 6),
                            style: TextStyle(
                              fontSize: 11,
                              color: widget.highlighted
                                  ? Provider.of<PaletteSettings>(context)
                                      .currentSetting
                                      .elementsOnColors
                                  : Provider.of<PaletteSettings>(context)
                                      .currentSetting
                                      .faded3,
                            ),
                          ),
                          Icon(
                            expanded
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            size: 13,
                            color: widget.highlighted
                                ? Provider.of<PaletteSettings>(context)
                                    .currentSetting
                                    .elementsOnColors
                                : Provider.of<PaletteSettings>(context)
                                    .currentSetting
                                    .faded3,
                          ),
                        ],
                      ),
                      if (!widget.compact)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.timelapse_outlined,
                                  size: 11,
                                  color: widget.highlighted
                                      ? Provider.of<PaletteSettings>(context)
                                          .currentSetting
                                          .elementsOnColors
                                      : Provider.of<PaletteSettings>(context)
                                          .currentSetting
                                          .faded3,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  getDate(widget.date.toString(),
                                      shorten: false),
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: widget.highlighted
                                        ? Provider.of<PaletteSettings>(context)
                                            .currentSetting
                                            .elementsOnColors
                                        : Provider.of<PaletteSettings>(context)
                                            .currentSetting
                                            .faded3,
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
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      height: 0,
                    ),
                    InkWell(
                      onTap: () {
                        if (widget.onSelected != null) {
                          widget.onSelected!(widget.sha);
                        } else {
                          AutoRouter.of(context).push(RepositoryScreenRoute(
                            repositoryURL:
                                toRepoAPIResource(widget.url, endIndex: 2),
                            index: 2,
                            initSHA: widget.sha,
                          ));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
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
                      onTap: () {
                        AutoRouter.of(context)
                            .push(CommitInfoScreenRoute(commitURL: widget.url));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
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
                      onTap: () {
                        copySha();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Copy SHA',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(LineIcons.copy),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class CommitTilesREST extends StatelessWidget {
  final CommitListModel item;
  final bool highlighted;
  final ValueChanged<String>? onSelected;
  const CommitTilesREST(
      {Key? key, required this.item, this.highlighted = false, this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CommitTiles(
        highlighted: highlighted,
        onSelected: onSelected,
        message: item.commit!.message!,
        url: item.url!,
        date: item.commit!.committer!.date!,
        authorAvatarUrl: item.author!.avatarUrl,
        authorLogin: item.author!.login!,
        sha: item.sha!);
  }
}

class CommitTilesGQL extends StatelessWidget {
  final CommitMixin item;
  final bool highlighted;
  final bool compact;
  final Color? backgroundColor;
  final ValueChanged<String>? onSelected;
  const CommitTilesGQL(
      {Key? key,
      required this.item,
      this.highlighted = false,
      this.onSelected,
      this.compact = true,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CommitTiles(
        highlighted: highlighted,
        onSelected: onSelected,
        backgroundColor: backgroundColor ??
            Provider.of<PaletteSettings>(context).currentSetting.onBackground,
        compact: compact,
        message: item.messageHeadline,
        url: toApiURL,
        date: item.authoredDate,
        authorAvatarUrl: item.author?.user?.avatarUrl.toString(),
        authorLogin: item.author?.user?.login,
        sha: item.oid);
  }

  String get toApiURL {
    List<String> temp = item.commitUrl
        .toString()
        .replaceAll('https://github.com/', '')
        .split('/');
    temp[2] = 'commits';
    return toRepoAPIResource(temp.join('/'));
  }
}
