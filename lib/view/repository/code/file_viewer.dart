import 'dart:convert';
import 'dart:typed_data';

import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/code_block_view.dart';
import 'package:dio_hub/common/misc/markdown_body.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/models/repositories/blob_model.dart';
import 'package:dio_hub/services/git_database/git_database_service.dart';
import 'package:dio_hub/utils/parse_base64.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:provider/provider.dart';

class FileViewerAPI extends StatefulWidget {
  const FileViewerAPI(this.sha,
      {this.repoURL, this.fileName, this.branch, this.repoName, Key? key})
      : super(key: key);
  final String? repoURL;
  final String? branch;
  final String? repoName;
  final String? fileName;
  final String? sha;

  @override
  _FileViewerAPIState createState() => _FileViewerAPIState();
}

class _FileViewerAPIState extends State<FileViewerAPI> {
  final ContentViewController contentViewController = ContentViewController();

  String? fileExtension;
  String? fileType;
  bool wrapText = false;
  // bool editing = false;
  late bool enableWrap;

  @override
  void initState() {
    fileType = lookupMimeType(widget.fileName!);
    fileExtension = widget.fileName!.split('.').last;
    enableWrap = checkFileForWrap();
    super.initState();
  }

  bool checkFileForWrap() {
    if (fileType != null && fileType!.startsWith('image')) {
      return false;
    } else if (fileExtension == 'md') {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Provider.of<PaletteSettings>(context).currentSetting.primary,
      appBar: AppBar(
        title: Text(
          widget.fileName!,
          style: const TextStyle(fontSize: 14),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.edit,
          //     color: editing ? Provider.of<PaletteSettings>(context).currentSetting.accent : Colors.white,
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
                color: wrapText
                    ? Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .baseElements
                    : Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .faded3,
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
          if (fileType != null && fileType!.startsWith('image')) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: InteractiveViewer(
                        child: Image.memory(Uint8List.fromList(
                            base64Decode(blob.content!.split('\n').join())))),
                  ),
                ),
              ],
            );
          }
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
  late bool Function() wrap;
  bool Function()? edit;
}

class TextViewer extends StatefulWidget {
  const TextViewer(this.blob, this.fileName,
      {this.contentViewController, this.branch, this.repoName, Key? key})
      : super(key: key);
  final BlobModel blob;
  final String? fileName;
  final ContentViewController? contentViewController;
  final String? branch;
  final String? repoName;
  @override
  _TextViewerState createState() => _TextViewerState();
}

class _TextViewerState extends State<TextViewer> {
  bool loading = true;
  late List<String> content;
  bool wrapText = false;
  // bool editing = false;
  int numberOfMaxChars = 0;
  String? fileType;
  // final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    setupController();
    content = parseBase64(widget.blob.content!).split('\n');
    for (final str in content) {
      if (str.length > numberOfMaxChars) {
        numberOfMaxChars = str.length;
      }
    }
    fileType = widget.fileName!.split('.').last;
    super.initState();
  }

  void setupController() {
    widget.contentViewController?.wrap = changeWrap;
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
        if (fileType == 'md') {
          return SingleChildScrollView(
            child: MarkdownRenderAPI(content.join('\n'),
                repoName: widget.repoName),
          );
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
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
                        ? Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .primary
                        : Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            (index + 1).toString(),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Flexible(
                            child: CodeBlockView(
                              content[index],
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
