import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/app/Dio/response_handler.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/profile_image.dart';
import 'package:onehub/models/popup/popup_type.dart';
import 'package:onehub/models/repositories/commit_model.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';

class CommitBrowserTiles extends StatefulWidget {
  final CommitModel item;
  final bool highlighted;
  final ValueChanged<String> onSelected;

  CommitBrowserTiles({Key key, this.item, this.highlighted, this.onSelected})
      : super(key: key);

  @override
  _CommitBrowserTilesState createState() => _CommitBrowserTilesState();
}

class _CommitBrowserTilesState extends State<CommitBrowserTiles> {
  bool expanded = false;

  void copySha() async {
    Clipboard.setData(ClipboardData(text: widget.item.sha));
    ResponseHandler.setSuccessMessage(
        AppPopupData(title: 'Copied SHA to clipboard.'));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: AppThemeBorderRadius.medBorderRadius,
      color: widget.highlighted ? AppColor.accent : AppColor.onBackground,
      child: InkWell(
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        onTap: () {
          setState(() {
            expanded = !expanded;
          });
        },
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            widget.item.commit.message,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            ProfileImage(
                              widget.item.author.avatarUrl,
                              size: 13,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.item.author.login,
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
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
                                ? Colors.white
                                : AppColor.grey3,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${widget.item.sha.substring(0, 6)}',
                            style: TextStyle(
                              fontSize: 11,
                              color: widget.highlighted
                                  ? Colors.white
                                  : AppColor.grey3,
                            ),
                          ),
                          Icon(
                            expanded
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            size: 13,
                            color: widget.highlighted
                                ? Colors.white
                                : AppColor.grey3,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timelapse_outlined,
                            size: 11,
                            color: widget.highlighted
                                ? Colors.white
                                : AppColor.grey3,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            getDate(
                                widget.item.commit.committer.date.toString(),
                                shorten: false),
                            style: TextStyle(
                              fontSize: 11,
                              color: widget.highlighted
                                  ? Colors.white
                                  : AppColor.grey3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
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
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      height: 0,
                    ),
                    InkWell(
                      onTap: () {
                        widget.onSelected(widget.item.sha);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                    Divider(
                      height: 0,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                    Divider(
                      height: 0,
                    ),
                    InkWell(
                      onTap: () {copySha();},
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
