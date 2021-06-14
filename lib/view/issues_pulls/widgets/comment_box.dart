import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/bottom_sheet.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/markdown_body.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:provider/provider.dart';

typedef LoadingFuture = Future<void> Function();

void showCommentSheet(BuildContext context,
    {required LoadingFuture onSubmit,
    String type = 'Comment',
    required String? initialData,
    required ValueChanged<String> onChanged,
    required String owner,
    required String repoName}) {
  bool markdownView = false;
  bool loading = false;
  showBottomActionsMenu(context, fullScreen: true, header: (context, setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              markdownView = !markdownView;
            });
          },
          icon: const Icon(Icons.remove_red_eye_rounded),
          color: markdownView
              ? Provider.of<PaletteSettings>(context)
                  .currentSetting
                  .baseElements
              : Provider.of<PaletteSettings>(context).currentSetting.faded3,
        ),
        Expanded(
          child: InkWell(
            borderRadius: AppThemeBorderRadius.medBorderRadius,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      type,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        IconButton(
          onPressed: loading
              ? null
              : () async {
                  setState(() {
                    loading = true;
                  });
                  await onSubmit().then((_) {
                    setState(() {
                      loading = false;
                    });
                    Navigator.pop(context);
                  });
                },
          disabledColor: Provider.of<PaletteSettings>(context)
              .currentSetting
              .faded3
              .withOpacity(0.5),
          icon: loading
              ? const LoadingIndicator()
              : const Icon(
                  Icons.reply,
                ),
        )
      ],
    );
  }, childWidget: (buildContext, setState) {
    return Expanded(
        child: CommentBox(
      repoName: owner + '/' + repoName,
      markdownView: markdownView,
      initialData: initialData,
      onChanged: loading ? null : onChanged,
    ));
  });
}

class CommentBox extends StatefulWidget {
  final String repoName;
  final String? initialData;
  final ValueChanged<String>? onChanged;
  final bool markdownView;
  final ScrollController? scrollController;
  const CommentBox({
    Key? key,
    this.scrollController,
    required this.initialData,
    required this.onChanged,
    required this.markdownView,
    required this.repoName,
  }) : super(key: key);

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  bool loading = false;
  late String data;

  @override
  void initState() {
    data = widget.initialData ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget textBox() {
      return MarkdownTextInput(
        initialValue: data,
        autoFocus: true,
        onTextChanged: widget.onChanged != null
            ? (value) {
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
            color: Provider.of<PaletteSettings>(context)
                .currentSetting
                .background),
        inkwellBorderRadius: AppThemeBorderRadius.medBorderRadius,
        boxDecoration: BoxDecoration(
          color:
              Provider.of<PaletteSettings>(context).currentSetting.onBackground,
        ),
      );
    }

    return Container(
      color: Provider.of<PaletteSettings>(context).currentSetting.onBackground,
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
