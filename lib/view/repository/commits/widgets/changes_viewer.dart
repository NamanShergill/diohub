import 'package:auto_route/annotations.dart';
import 'package:diohub/common/misc/patch_viewer.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChangesViewer extends StatefulWidget {
  const ChangesViewer(this.patch, this.contentURL, this.fileType, {super.key});
  final String? patch;
  final String? contentURL;
  final String? fileType;

  @override
  ChangesViewerState createState() => ChangesViewerState();
}

class ChangesViewerState extends State<ChangesViewer> {
  bool wrap = false;
  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            WrapIconButton(
              wrap: wrap,
              onWrap: (final bool value) {
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
