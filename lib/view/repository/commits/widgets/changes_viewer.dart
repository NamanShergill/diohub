import 'package:flutter/material.dart';
import 'package:onehub/common/patch_viewer.dart';

class ChangesViewer extends StatelessWidget {
  final String patch;
  final String rawFileURL;
  final String fileType;
  ChangesViewer(this.patch, this.rawFileURL, this.fileType);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: PatchViewer(
          patch: patch,
          fileType: fileType,
          rawFileURL: rawFileURL,
        ),
      ),
    );
  }
}
