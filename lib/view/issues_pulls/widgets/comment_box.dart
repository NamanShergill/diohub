import 'package:dio_hub/common/button.dart';
import 'package:dio_hub/common/markdown_body.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';

class CommentBox extends StatefulWidget {
  final String issueURL;
  final ValueChanged<bool> onSubmit;
  final String? initText;
  CommentBox(
      {Key? key, required this.issueURL, this.initText, required this.onSubmit})
      : super(key: key);

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  late String commentBody;
  int index = 0;
  bool loading = false;

  @override
  void initState() {
    commentBody = widget.initText ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget textBox() {
      return MarkdownTextInput(
        initialValue: commentBody,
        maxLines: 999999,
        onTextChanged: (value) {
          setState(() {
            commentBody = value;
          });
        },
        toolbarDecoration: BoxDecoration(color: AppColor.background),
        inkwellBorderRadius: AppThemeBorderRadius.medBorderRadius,
        boxDecoration: BoxDecoration(
          color: AppColor.onBackground,
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        color: AppColor.onBackground,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: index,
                sizing: StackFit.expand,
                children: [
                  loading
                      ? IgnorePointer(
                          child: textBox(),
                        )
                      : textBox(),
                  Container(
                    color: AppColor.onBackground,
                    child: SingleChildScrollView(
                      child: MarkdownBody(
                        commentBody,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 0,
            ),
            Button(
              onTap: () {
                setState(() {
                  if (index == 0) {
                    index = 1;
                  } else {
                    index = 0;
                  }
                });
              },
              padding: EdgeInsets.all(0),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(index == 0 ? 'Preview' : 'Edit'),
              ),
              color: AppColor.background,
              borderRadius: 0,
              listenToLoadingController: false,
            ),
            Divider(
              height: 0,
            ),
            Button(
              onTap: () async {
                setState(() {
                  loading = true;
                });
                bool status = await IssuesService.addComment(
                    widget.issueURL, commentBody);
                setState(() {
                  loading = false;
                });
                widget.onSubmit(status);
                Navigator.pop(context);
              },
              padding: EdgeInsets.all(0),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Add Comment'),
              ),
              color: AppColor.background,
              borderRadius: 0,
            ),
          ],
        ),
      ),
    );
  }
}
