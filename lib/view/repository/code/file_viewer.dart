import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:mime/mime.dart';
import 'package:onehub/common/api_wrapper_widget.dart';
import 'package:onehub/common/markdown_body.dart';
import 'package:onehub/models/repositories/blob_model.dart';
import 'package:onehub/services/git_database/git_database_service.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/parse_base64.dart';

class FileViewerAPI extends StatefulWidget {
  final String repoURL;
  final String branch;
  final String repoName;
  final String fileName;
  final String sha;
  FileViewerAPI(this.sha,
      {this.repoURL, this.fileName, this.branch, this.repoName});

  @override
  _FileViewerAPIState createState() => _FileViewerAPIState();
}

class _FileViewerAPIState extends State<FileViewerAPI> {
  final ContentViewController contentViewController = ContentViewController();

  String fileExtension;
  String fileType;
  bool wrapText = false;
  // bool editing = false;
  bool enableWrap;

  @override
  void initState() {
    fileType = lookupMimeType(widget.fileName);
    fileExtension = widget.fileName.split('.').last;
    enableWrap = checkFileForWrap();
    super.initState();
  }

  bool checkFileForWrap() {
    if (fileType != null && fileType.startsWith('image'))
      return false;
    else if (fileExtension == 'md') return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: Text(
          widget.fileName,
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.edit,
          //     color: editing ? AppColor.accent : Colors.white,
          //   ),
          //   onPressed: () {
          //     setState(() {
          //       editing = contentViewController.edit();
          //     });
          //   },
          // ),
          Visibility(
            visible: enableWrap,
            child: IconButton(
              icon: Icon(
                Icons.wrap_text,
                color: wrapText ? AppColor.accent : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  wrapText = contentViewController.wrap();
                });
              },
            ),
          ),
        ],
      ),
      body: APIWrapper<BlobModel>(
        apiCall: GitDatabaseService.getBlob(
            sha: widget.sha, repoURL: widget.repoURL),
        responseBuilder: (context, blob) {
          if (fileType != null && fileType.startsWith('image'))
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: InteractiveViewer(
                        child: Image.memory(Uint8List.fromList(
                            base64Decode(blob.content.split('\n').join())))),
                  ),
                ),
              ],
            );
          return TextViewer(
            blob,
            widget.fileName,
            contentViewController: contentViewController,
            repoName: widget.repoName,
            branch: widget.branch,
          );
        },
      ),
    );
  }
}

class ContentViewController {
  bool Function() wrap;
  bool Function() edit;
}

class TextViewer extends StatefulWidget {
  final BlobModel blob;
  final String fileName;
  final ContentViewController contentViewController;
  final String branch;
  final String repoName;
  TextViewer(this.blob, this.fileName,
      {this.contentViewController, this.branch, this.repoName});
  @override
  _TextViewerState createState() => _TextViewerState(contentViewController);
}

class _TextViewerState extends State<TextViewer> {
  _TextViewerState(ContentViewController contentViewController) {
    if (contentViewController != null) {
      contentViewController.wrap = changeWrap;
      // contentViewController.edit = edit;
    }
  }
  bool loading = true;
  List<String> content;
  bool wrapText = false;
  // bool editing = false;
  int numberOfMaxChars = 0;
  String fileType;
  // final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    content = parseBase64(widget.blob.content);
    for (String str in content)
      if (str.length > numberOfMaxChars) numberOfMaxChars = str.length;
    fileType = widget.fileName.split('.').last;
    super.initState();
  }

  bool changeWrap() {
    setState(() {
      wrapText = !wrapText;
    });
    return wrapText;
  }

  // bool edit() {
  //   setState(() {
  //     editing = !editing;
  //   });
  //   return editing;
  // }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      // visible: !editing,
      child: Builder(builder: (context) {
        if (fileType == 'md')
          return SingleChildScrollView(
            child: MarkdownBody(md.markdownToHtml(content.join('\n')),
                branch: widget.branch, repo: widget.repoName),
          );
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: wrapText
                ? MediaQuery.of(context).size.width
                : numberOfMaxChars.toDouble() * 10 >
                        MediaQuery.of(context).size.width
                    ? numberOfMaxChars.toDouble() * 10
                    : MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: content.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: index % 2 == 0
                        ? AppColor.background
                        : AppColor.onBackground,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            (index + 1).toString(),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Flexible(
                            child: HighlightView(
                              content[index],
                              backgroundColor: Colors.transparent,
                              theme: monokaiSublimeTheme,
                              language: fileType,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
      }),
    );
  }
}
