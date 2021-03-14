import 'package:flutter/material.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/common/markdown_body.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class CommentBox extends StatefulWidget {
  CommentBox({Key key}) : super(key: key);

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  String string = 'askniuabiubbuisa';
  int index = 0;
  final MarkdownBodyController controller = MarkdownBodyController();

  @override
  Widget build(BuildContext context) {
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
                  MarkdownTextInput(
                    initialValue: string,
                    maxLines: 999999,
                    onTextChanged: (value) {
                      controller.update(value);
                    },
                    toolbarDecoration:
                        BoxDecoration(color: AppColor.background),
                    inkwellBorderRadius: AppThemeBorderRadius.medBorderRadius,
                    boxDecoration: BoxDecoration(
                      color: AppColor.onBackground,
                    ),
                  ),
                  Container(
                    color: AppColor.onBackground,
                    child: SingleChildScrollView(
                      child: MarkdownBody(
                        string,
                        controller: controller,
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
                  if (index == 0)
                    index = 1;
                  else
                    index = 0;
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
          ],
        ),
      ),
    );
  }
}
