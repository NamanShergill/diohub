import 'package:dio_hub/common/misc/markdown_body.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:provider/provider.dart';

class CommentBox extends StatefulWidget {
  final String issueURL;
  final String repoName;
  final ValueChanged<bool> onSubmit;
  final bool markdownView;
  final ScrollController? scrollController;
  const CommentBox(
      {Key? key,
      this.scrollController,
      required this.markdownView,
      required this.repoName,
      required this.issueURL,
      required this.onSubmit})
      : super(key: key);

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Widget textBox() {
      return MarkdownTextInput(
        initialValue: Provider.of<CommentProvider>(context).data,
        autoFocus: true,
        onTextChanged: (value) {
          setState(() {
            Provider.of<CommentProvider>(context, listen: false)
                .updateData(value);
          });
        },
        maxLines: null,
        toolbarDecoration: const BoxDecoration(color: AppColor.background),
        inkwellBorderRadius: AppThemeBorderRadius.medBorderRadius,
        boxDecoration: const BoxDecoration(
          color: AppColor.onBackground,
        ),
      );
    }

    return Container(
      color: AppColor.onBackground,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: widget.markdownView
          ? MarkdownRenderAPI(
              Provider.of<CommentProvider>(context).data,
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
//   color: AppColor.background,
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
//   color: AppColor.background,
//   borderRadius: 0,
// ),

/// Widget with markdown buttons
class MarkdownTextInput extends StatefulWidget {
  /// Callback called when text changed
  final ValueChanged<String>? onTextChanged;

  /// Initial value you want to display
  final String? initialValue;

  /// Validator for the TextFormField
  final FormFieldValidator<String>? validator;

  /// String displayed at hintText in TextFormField
  final String label;

  /// Change the text direction of the input (RTL / LTR)
  final TextDirection textDirection;

  /// The maximum of lines that can be display in the input
  final int? maxLines;

  /// Text Box decoration.
  final BoxDecoration? boxDecoration;

  /// Toolbar decoration.
  final BoxDecoration? toolbarDecoration;

  /// Inkwell border radius.
  final BorderRadius? inkwellBorderRadius;

  final bool autoFocus;

  /// Constructor for [MarkdownTextInput]
  MarkdownTextInput(
      {this.initialValue,
      this.label = '',
      this.autoFocus = false,
      this.validator,
      this.onTextChanged,
      this.boxDecoration,
      this.inkwellBorderRadius,
      this.toolbarDecoration,
      this.textDirection = TextDirection.ltr,
      this.maxLines = 1});

  @override
  _MarkdownTextInputState createState() => _MarkdownTextInputState();
}

class _MarkdownTextInputState extends State<MarkdownTextInput> {
  final _controller = TextEditingController();
  TextSelection textSelection =
      const TextSelection(baseOffset: 0, extentOffset: 0);

  void onTap(MarkdownType type, {int titleSize = 1}) {
    HapticFeedback.vibrate();
    final basePosition = textSelection.baseOffset;
    var noTextSelected =
        (textSelection.baseOffset - textSelection.extentOffset) == 0;

    final result = FormatMarkdown.convertToMarkdown(
      type,
      _controller.text,
      textSelection.baseOffset,
      textSelection.extentOffset,
    );

    _controller.value = _controller.value.copyWith(
        text: result.data,
        selection:
            TextSelection.collapsed(offset: basePosition + result.cursorIndex));

    if (noTextSelected) {
      _controller.selection = TextSelection.collapsed(
          offset: _controller.selection.end - result.replaceCursorIndex!);
    }
  }

  @override
  void initState() {
    _controller.text = widget.initialValue!;
    _controller.addListener(() {
      if (_controller.selection.baseOffset != -1)
        textSelection = _controller.selection;
      if (widget.onTextChanged != null) widget.onTextChanged!(_controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.boxDecoration ??
          BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.newline,
              maxLines: widget.maxLines,
              minLines: 1,
              autofocus: widget.autoFocus,
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              validator: widget.validator,
              cursorColor: Theme.of(context).primaryColor,
              textDirection: widget.textDirection ?? TextDirection.ltr,
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText: widget.label,
                hintStyle:
                    const TextStyle(color: Color.fromRGBO(63, 61, 86, 0.5)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
            ),
          ),
          Container(
            decoration: widget.toolbarDecoration?.copyWith(
                border: Border(
                    top: BorderSide(color: Theme.of(context).accentColor))),
            width: double.infinity,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        borderRadius: widget.inkwellBorderRadius,
                        key: const Key('bold_button'),
                        onTap: () => onTap(MarkdownType.bold),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.format_bold,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: widget.inkwellBorderRadius,
                        key: const Key('italic_button'),
                        onTap: () => onTap(MarkdownType.italic),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.format_italic,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: widget.inkwellBorderRadius,
                        key: const Key('code_button'),
                        onTap: () => onTap(MarkdownType.code),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.code,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: widget.inkwellBorderRadius,
                        key: Key('H_button'),
                        onTap: () => onTap(MarkdownType.title),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'H',
                            style: TextStyle(
                                fontSize: (15).toDouble(),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: widget.inkwellBorderRadius,
                        onTap: () => onTap(MarkdownType.code_block),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.check_box_outline_blank_rounded,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: widget.inkwellBorderRadius,
                        onTap: () => onTap(MarkdownType.strike_through),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.strikethrough_s_rounded,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: widget.inkwellBorderRadius,
                        key: const Key('quote_button'),
                        onTap: () => onTap(MarkdownType.quote),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.format_quote,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: widget.inkwellBorderRadius,
                        key: const Key('link_button'),
                        onTap: () => onTap(MarkdownType.link),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.link,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: widget.inkwellBorderRadius,
                        key: const Key('list_button'),
                        onTap: () => onTap(MarkdownType.list),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.list,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: widget.inkwellBorderRadius,
                        key: const Key('task_button'),
                        onTap: () => onTap(MarkdownType.taskList),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.check_box_outlined,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
