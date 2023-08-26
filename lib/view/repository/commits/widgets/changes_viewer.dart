import 'package:auto_route/annotations.dart';
import 'package:dio_hub/common/misc/patch_viewer.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChangesViewer extends StatefulWidget {
  const ChangesViewer(this.patch, this.contentURL, this.fileType, {Key? key})
      : super(key: key);
  final String? patch;
  final String? contentURL;
  final String? fileType;

  @override
  ChangesViewerState createState() => ChangesViewerState();
}

class ChangesViewerState extends State<ChangesViewer> {
  bool wrap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          WrapIconButton(
            wrap: wrap,
            onWrap: (value) {
              setState(() {
                wrap = value;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: PatchViewer(
          patch: widget.patch,
          fileType: widget.fileType,
          contentURL: widget.contentURL,
          wrap: wrap,
        ),
      ),
    );
  }
}
