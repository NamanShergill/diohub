import 'package:flutter/material.dart';
import 'package:onehub/common/patch_viewer.dart';
import 'package:onehub/style/colors.dart';

class ChangesViewer extends StatefulWidget {
  final String patch;
  final String contentURL;
  final String fileType;
  ChangesViewer(this.patch, this.contentURL, this.fileType);

  @override
  _ChangesViewerState createState() => _ChangesViewerState();
}

class _ChangesViewerState extends State<ChangesViewer> {
  bool wrap = false;
  final PatchViewController controller = PatchViewController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.wrap_text,
                color: wrap ? Colors.white : AppColor.grey3,
              ),
              onPressed: () {
                setState(() {
                  wrap = controller.wrap();
                });
              })
        ],
      ),
      body: SingleChildScrollView(
        child: PatchViewer(
          controller: controller,
          patch: widget.patch,
          fileType: widget.fileType,
          contentURL: widget.contentURL,
          wrap: wrap,
        ),
      ),
    );
  }
}
