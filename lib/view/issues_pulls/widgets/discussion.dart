import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:dio_hub/view/issues_pulls/widgets/comment_box.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:dio_hub/view/issues_pulls/widgets/timeline_item.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Discussion extends StatefulWidget {
  const Discussion({
    required this.number,
    required this.owner,
    required this.repoName,
    required this.initComment,
    required this.issueUrl,
    required this.isPull,
    this.commentsSince,
    this.pullNodeID,
    this.isLocked,
    // required this.nestedScrollViewController,
    this.createdAt,
    super.key,
  });

  // final ScrollController nestedScrollViewController;

  /// Show  comments since.
  final DateTime? commentsSince;
  final String repoName;
  final String owner;
  final String? pullNodeID;
  final BaseComment initComment;
  final Uri issueUrl;
  final int number;
  final bool? isLocked;
  final bool isPull;
  final DateTime? createdAt;

  @override
  DiscussionState createState() => DiscussionState();
}

class DiscussionState extends State<Discussion> {
  DateTime? commentsSince;

  InfiniteScrollWrapperController commentsSinceController =
      InfiniteScrollWrapperController();

  @override
  void initState() {
    commentsSince = widget.commentsSince;
    super.initState();
  }

  Future<void> openCommentSheet() async {
    await showCommentSheet(
      context,
      onSubmit: () async {
        await IssuesService.addComment(
          widget.issueUrl.toString(),
          context.read<CommentProvider>().data,
        );
        if (context.mounted) {
          context.read<CommentProvider>().clearData();
        }
        setState(() {
          commentsSince = DateTime.now();
          commentsSinceController.refresh();
        });
        return;
      },
      initialData: context.read<CommentProvider>().data,
      onChanged: (final String value) {
        Provider.of<CommentProvider>(context, listen: false).updateData(value);
      },
      owner: widget.owner,
      repoName: widget.repoName,
    );
  }

  @override
  Widget build(final BuildContext context) {
    // final theme = Provider.of<PaletteSettings>(context).currentSetting;

    final Widget header = commentsSince != null
        ? Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Button(
                  // color: Provider.of<PaletteSettings>(context)
                  //     .currentSetting
                  //     .secondary,
                  padding: const EdgeInsets.all(12),
                  onTap: () {
                    setState(() {
                      commentsSince = null;
                    });
                    commentsSinceController.refresh();
                  },
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Showing timeline since ${DateFormat('d MMM yyyy').format(commentsSince!)}.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Load the whole timeline?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.initComment.createdAt.isAfter(
                commentsSince!.subtract(const Duration(seconds: 30)),
              ))
                PaddingWrap(
                  child: widget.initComment,
                ),
            ],
          )
        : Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Button(
                  // color: Provider.of<PaletteSettings>(context)
                  //     .currentSetting
                  //     .secondary,
                  onTap: () async {
                    await DatePicker.showDateTimePicker(
                      context,
                      // theme: DatePickerTheme(
                      //   cancelStyle: TextStyle(
                      // color: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .baseElements,
                      // ),
                      // doneStyle: TextStyle(
                      // color: context.colorScheme.
                      //     .accent,
                      // ),
                      // itemStyle: TextStyle(
                      //   color: Provider.of<PaletteSettings>(context)
                      //       .currentSetting
                      //       .baseElements,
                      // ),
                      // backgroundColor: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .primary,
                      // ),
                      maxTime: DateTime.now(),
                      onConfirm: (final DateTime date) {
                        setState(() {
                          commentsSince = date;
                        });
                        commentsSinceController.refresh();
                      },
                      currentTime: widget.createdAt,
                    );
                  },
                  child: const Text(
                    'Show timeline from a specific time?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 16,
              // ),
              PaddingWrap(
                child: widget.initComment,
              ),
            ],
          );
    return Column(
      children: <Widget>[
        Expanded(
          child: InfiniteScrollWrapper<dynamic>(
            future: (
              final ({
                dynamic lastItem,
                int pageNumber,
                int pageSize,
                bool refresh
              }) data,
            ) async =>
                IssuesService.getTimeline(
              repo: widget.repoName,
              after: data.lastItem?.cursor,
              number: widget.number,
              owner: widget.owner,
              refresh: data.refresh,
              since:
                  commentsSince?.toUtc().subtract(const Duration(seconds: 30)),
            ),
            // scrollController: widget.nestedScrollViewController,
            controller: commentsSinceController,
            firstPageLoadingBuilder: (final BuildContext context) =>
                const LoadingIndicator(),
            // scrollController: widget.nestedScrollViewController,
            header: (final BuildContext context) => header,
            // topSpacing: 8,
            // separatorBuilder: (final BuildContext context, final int index) =>
            //     const Divider(
            //   height: 0,
            // ),
            builder: (
              final BuildContext context,
              final ({int index, dynamic item, bool refresh}) data,
            ) =>
                TimelineItem(
              data.item.node,
              pullNodeID: widget.pullNodeID,
              onQuote: openCommentSheet,
            ),
          ),
        ),
        _CommentButton(
          onTap: openCommentSheet,
          isLocked: widget.isLocked!,
        ),
      ],
    );
  }
}

class _CommentButton extends StatelessWidget {
  const _CommentButton({
    required this.onTap,
    this.isLocked = false,
  });
  final bool isLocked;
  final GestureTapCallback onTap;

  @override
  Widget build(final BuildContext context) {
    // final DioHubPalette theme =
    //     Provider.of<PaletteSettings>(context).currentSetting;

    return Material(
      // elevation: 2,
      color: isLocked
          ? context.colorScheme.onSurface
          : context.colorScheme.primary,
      child: InkWell(
        onTap: isLocked ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Add a comment',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onPrimary,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  isLocked ? Octicons.lock : Icons.comment_rounded,
                  color: context.colorScheme.onPrimary,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
