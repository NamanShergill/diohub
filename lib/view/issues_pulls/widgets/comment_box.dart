import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/markdown_body.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:provider/provider.dart';

typedef LoadingFuture = Future<void> Function();

void showCommentSheet(
  final BuildContext context, {
  required final LoadingFuture onSubmit,
  required final String? initialData,
  required final ValueChanged<String> onChanged,
  required final String owner,
  required final String repoName,
  final String type = 'Comment',
}) {
  var markdownView = false;
  var loading = false;
  showDHBottomSheet(
    context,
    isScrollControlled: true,
    builder: (final context) => DHBottomSheet(
      headerBuilder: (final context, final setState) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              setState.call(
                () {
                  markdownView = !markdownView;
                },
              );
            },
            icon: const Icon(Icons.remove_red_eye_rounded),
            color: markdownView
                ? context.palette.baseElements
                : context.palette.faded3,
          ),
          Expanded(
            child: InkWell(
              borderRadius: medBorderRadius,
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        type,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: loading
                ? null
                : () async {
                    setState(() {
                      loading = true;
                    });
                    await onSubmit().then((final _) {
                      setState.call(
                        () {
                          loading = false;
                        },
                      );
                      Navigator.pop(context);
                    });
                  },
            disabledColor: context.palette.faded3.withOpacity(0.5),
            icon: loading
                ? const LoadingIndicator()
                : const Icon(
                    Icons.reply,
                  ),
          ),
        ],
      ),
      builder: (final context, final setState) => Expanded(
        child: CommentBox(
          repoName: '$owner/$repoName',
          markdownView: markdownView,
          initialData: initialData,
          onChanged: loading ? null : onChanged,
        ),
      ),
    ),
  );
}

class CommentBox extends StatefulWidget {
  const CommentBox({
    required this.initialData,
    required this.onChanged,
    required this.markdownView,
    required this.repoName,
    super.key,
    this.scrollController,
  });
  final String repoName;
  final String? initialData;
  final ValueChanged<String>? onChanged;
  final bool markdownView;
  final ScrollController? scrollController;

  @override
  CommentBoxState createState() => CommentBoxState();
}

class CommentBoxState extends State<CommentBox> {
  bool loading = false;
  late String data;

  @override
  void initState() {
    data = widget.initialData ?? '';
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    Widget textBox() => MarkdownTextInput(
          initialValue: data,
          autoFocus: true,
          onTextChanged: widget.onChanged != null
              ? (final value) {
                  setState(() {
                    // Provider.of<CommentProvider>(context, listen: false)
                    //     .updateData(value);
                    data = value;
                  });
                  widget.onChanged!(value);
                }
              : null,
          maxLines: null,
          toolbarDecoration: BoxDecoration(
            color: Provider.of<PaletteSettings>(context).currentSetting.primary,
          ),
          inkwellBorderRadius: medBorderRadius,
          boxDecoration: BoxDecoration(
            color:
                Provider.of<PaletteSettings>(context).currentSetting.secondary,
          ),
        );

    return Container(
      color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: widget.markdownView
          ? MarkdownRenderAPI(
              data,
              repoName: widget.repoName,
            )
          : textBox(),
    );
  }
}

// const Divider(
//   height: 0,
// ),
// Button(
//   onTap: () {},
//   padding: const EdgeInsets.all(0),
//   elevation: 0,
//   child: Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Text('Preview'),
//   ),
//   color: Provider.of<PaletteSettings>(context).currentSetting.background,
//   borderRadius: 0,
//   listenToLoadingController: false,
// ),
// const Divider(
//   height: 0,
// ),
// Button(
//   onTap: () async {
//     setState(() {
//       loading = true;
//     });
//     bool status = await IssuesService.addComment(widget.issueURL,
//         Provider.of<CommentProvider>(context, listen: false).data);
//     setState(() {
//       loading = false;
//     });
//     widget.onSubmit(status);
//     Navigator.pop(context);
//   },
//   padding: const EdgeInsets.all(0),
//   elevation: 0,
//   child: const Padding(
//     padding: EdgeInsets.all(16.0),
//     child: Text('Add Comment'),
//   ),
//   color: Provider.of<PaletteSettings>(context).currentSetting.background,
//   borderRadius: 0,
// ),
