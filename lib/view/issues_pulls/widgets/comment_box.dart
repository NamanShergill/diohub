import 'package:dio_hub/common/button.dart';
import 'package:dio_hub/common/markdown_body.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:provider/provider.dart';

class CommentBox extends StatefulWidget {
  final String issueURL;
  final String repoName;
  final ValueChanged<bool> onSubmit;
  final bool markdownView;
  const CommentBox(
      {Key? key,
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
        onTextChanged: (value) {
          setState(() {
            Provider.of<CommentProvider>(context, listen: false)
                .updateData(value);
          });
        },
        toolbarDecoration: const BoxDecoration(color: AppColor.background),
        inkwellBorderRadius: AppThemeBorderRadius.medBorderRadius,
        boxDecoration: const BoxDecoration(
          color: AppColor.onBackground,
        ),
      );
    }

    return Container(
      color: AppColor.onBackground,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: IndexedStack(
              index: widget.markdownView ? 1 : 0,
              children: [
                loading
                    ? IgnorePointer(
                        child: textBox(),
                      )
                    : textBox(),
                Container(
                  color: AppColor.onBackground,
                  child: SingleChildScrollView(
                    child: MarkdownRenderAPI(
                      Provider.of<CommentProvider>(context).data,
                      repoName: widget.repoName,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0,
          ),
          Button(
            onTap: () {},
            padding: const EdgeInsets.all(0),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Preview'),
            ),
            color: AppColor.background,
            borderRadius: 0,
            listenToLoadingController: false,
          ),
          const Divider(
            height: 0,
          ),
          Button(
            onTap: () async {
              setState(() {
                loading = true;
              });
              bool status = await IssuesService.addComment(widget.issueURL,
                  Provider.of<CommentProvider>(context, listen: false).data);
              setState(() {
                loading = false;
              });
              widget.onSubmit(status);
              Navigator.pop(context);
            },
            padding: const EdgeInsets.all(0),
            elevation: 0,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Add Comment'),
            ),
            color: AppColor.background,
            borderRadius: 0,
          ),
        ],
      ),
    );
  }
}
