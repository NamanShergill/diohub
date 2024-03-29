import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/annotations.dart';
import 'package:diohub/common/markdown_view/markdown_body.dart';
import 'package:diohub/common/misc/code_block_view.dart';
import 'package:diohub/common/wrappers/api_wrapper_widget.dart';
import 'package:diohub/models/repositories/blob_model.dart';
import 'package:diohub/services/git_database/git_database_service.dart';
import 'package:diohub/utils/parse_base64.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

@RoutePage()
class FileViewerAPI extends StatefulWidget {
  const FileViewerAPI(
    this.sha, {
    this.repoURL,
    this.fileName,
    this.branch,
    this.repoName,
    super.key,
  });
  final String? repoURL;
  final String? branch;
  final String? repoName;
  final String? fileName;
  final String? sha;

  @override
  FileViewerAPIState createState() => FileViewerAPIState();
}

class FileViewerAPIState extends State<FileViewerAPI> {
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
    } else if (fileExtension == 'md' || fileType == 'markdown') {
      return false;
    }
    return true;
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        // backgroundColor:
        // Provider.of<PaletteSettings>(context).currentSetting.primary,
        appBar: AppBar(
          title: Text(
            widget.fileName!,
            // style: const TextStyle(14),
          ),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(
            //     Icons.edit,
            //     color: editing ? Provider.of<PaletteSettings>(context).currentSetting.accent : white,
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
                  color: context.colorScheme.onSurface
                      .withOpacity(wrapText ? 1 : 0.3),
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
        body: APIWrapper<BlobModel>.deferred(
          apiCall: ({required final bool refresh}) async =>
              GitDatabaseService.getBlob(
            sha: widget.sha,
            repoURL: widget.repoURL,
          ),
          builder: (final BuildContext context, final BlobModel blob) {
            if (fileType != null && fileType!.startsWith('image')) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: InteractiveViewer(
                      child: Image.memory(
                        Uint8List.fromList(
                          base64Decode(blob.content!.split('\n').join()),
                        ),
                      ),
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

class ContentViewController {
  late bool Function() wrap;
  bool Function()? edit;
}

class TextViewer extends StatefulWidget {
  const TextViewer(
    this.blob,
    this.fileName, {
    this.contentViewController,
    this.branch,
    this.repoName,
    super.key,
  });
  final BlobModel blob;
  final String? fileName;
  final ContentViewController? contentViewController;
  final String? branch;
  final String? repoName;
  @override
  TextViewerState createState() => TextViewerState();
}

class TextViewerState extends State<TextViewer> {
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
    for (final String str in content) {
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
  Widget build(final BuildContext context) => Visibility(
        // visible: !editing,
        child: Builder(
          builder: (final BuildContext context) {
            if (fileType == 'md' || fileType == 'markdown') {
              return SingleChildScrollView(
                child: MarkdownRenderAPI(
                  content.join('\n'),
                  repoContext: widget.repoName,
                ),
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
                  itemBuilder: (final BuildContext context, final int index) =>
                      ColoredBox(
                    color: index.isEven
                        ? context.colorScheme.surface
                        : context.colorScheme.background,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: <Widget>[
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
                  ),
                ),
              ),
            );
          },
        ),
      );
}
