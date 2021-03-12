import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/models/repositories/blob_model.dart';
import 'package:onehub/services/git_database/git_database_service.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/parse_base64.dart';

class PatchViewController {
  bool Function() wrap;
}

// Todo: I know this code is very messy. I wrote it 6 months ago and did not document it so I will figure this out and rewrite it later.
class PatchViewer extends StatefulWidget {
  final String patch;
  final String contentURL;
  final String fileType;
  final bool wrap;
  final PatchViewController controller;

  /// Pass this as true before starting parsing to prevent lag.
  /// Todo: Remove?
  final bool waitBeforeLoad;
  PatchViewer(
      {Key key,
      this.patch,
      this.wrap = false,
      this.contentURL,
      this.fileType,
      this.controller,
      this.waitBeforeLoad = true})
      : super(key: key);

  @override
  _PatchViewerState createState() => _PatchViewerState(controller);
}

class _PatchViewerState extends State<PatchViewer> {
  _PatchViewerState(PatchViewController controller) {
    if (controller != null) controller.wrap = changeWrap;
  }
  String patch;
  int maxChars = 0;
  List<String> rawData;
  bool loading = true;
  final PatchViewController controller = PatchViewController();

  bool wrap;

  @override
  void initState() {
    patch = widget.patch;
    wrap = widget.wrap;
    startUp();
    super.initState();
  }

  bool changeWrap() {
    setState(() {
      wrap = !wrap;
    });
    controller.wrap();
    return wrap;
  }

  void startUp() async {
    List<Future> futures = [];
    if (widget.contentURL != null) futures.add(fetchBlobFile());
    await Future.wait(futures);
    regex();
    setState(() {
      loading = false;
    });
  }

  Future fetchBlobFile() async {
    BlobModel blob =
        await GitDatabaseService.getFileContents(widget.contentURL);
    String data = blob.content;
    rawData = parseBase64(data);
    for (String str in rawData)
      if (str.length > maxChars) maxChars = str.length;
  }

  void regex() async {
    RegExpMatch firstHeader = RegExp(r"(?:@@ )(.*)(?: @@)").firstMatch(patch);
    makeCodeChunks(firstHeader);
    patch = patch.replaceFirst(RegExp(r"(?=@@)(.*)(?<=@@)"), '', 0);
    RegExp(r"(?:\n)(?:@@ )(.*)(?: @@)").allMatches(patch).forEach((element) {
      makeCodeChunks(element);
    });
    codeSplit.addAll(patch.split(RegExp(r"(?:\n)(?=@@)(.*)(?<=@@)")));
    for (int i = 0; i < codeSplit.length; i++) {
      codeChunks[i]['code'] = codeSplit[i].split('\n');
      for (String str in codeChunks[i]['code']) {
        if (str.length > maxChars) maxChars = str.length;
      }
    }
  }

  void makeCodeChunks(element) {
    CodeChunk info = CodeChunk();
    displayHeader.add("@@ ${element.group(1)} @@");
    List<String> _splitHeader = element.group(1).split(' ');
    _splitHeader.forEach((element) {
      List<String> _headerValuesString = [];
      List<int> _headerValues = [];
      _headerValuesString.addAll(element.split(','));
      _headerValues.add(int.parse(_headerValuesString[0]));
      _headerValues.add(int.parse(_headerValuesString[1]));
      if (_headerValues[0] < 0) {
        info.removeStartLine = _headerValues[0].abs();
        info.removeStartingLength = _headerValues[1];
      }
      if (_headerValues[0] > 0) {
        info.addStartLine = _headerValues[0];
        info.addStartingLength = _headerValues[1];
      }
    });
    codeChunks.add(info.getMap());
  }

  List<Map> codeChunks = [];
  List<String> codeSplit = [];
  List<String> displayHeader = [];

  Widget showCodeChunk(List displayCode, int chunkIndex) {
    int getRemoveIndex = codeChunks[chunkIndex]['startRemove'];

    int getAddIndex = codeChunks[chunkIndex]['startAdd'];

    List<String> displayCodeWithoutFirstLine = displayCode.sublist(1);

    return ListView.builder(
        shrinkWrap: true,
        itemCount: displayCodeWithoutFirstLine.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, lineIndex) {
          return Container(
            color: getColor(displayCodeWithoutFirstLine[lineIndex], lineIndex),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: 35,
                    child: Text(
                      displayCodeWithoutFirstLine[lineIndex][0] == '+'
                          ? ''
                          : '${getRemoveIndex++}',
                    )),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 35,
                  child: Text(displayCodeWithoutFirstLine[lineIndex][0] == '-'
                      ? ''
                      : '${getAddIndex++}'),
                ),
                SizedBox(
                  width: 5,
                  child: Text(
                    displayCodeWithoutFirstLine[lineIndex].isNotEmpty
                        ? displayCodeWithoutFirstLine[lineIndex][0]
                        : " ",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: HighlightView(
                    displayCodeWithoutFirstLine[lineIndex].length > 0
                        ? displayCodeWithoutFirstLine[lineIndex].substring(1)
                        : " ",
                    backgroundColor: Colors.transparent,
                    theme: monokaiSublimeTheme,
                    language: widget.fileType,
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              LoadingIndicator(),
            ],
          ))
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: wrap
                  ? MediaQuery.of(context).size.width
                  : maxChars.toDouble() * 10,
              child: ListView.builder(
                  itemCount: codeChunks.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    List<String> displayCode = codeChunks[index]['code'];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ChunkHeader(
                          codeChunks: codeChunks,
                          displayCode: displayCode,
                          displayHeader: displayHeader,
                          index: index,
                          startRemove: codeChunks[index]['startRemove'],
                          maxChars: maxChars,
                          fileType: widget.fileType,
                          rawData: rawData,
                          wrap: wrap,
                          controller: controller,
                          startAdd: codeChunks[index]['startAdd'],
                        ),
                        showCodeChunk(displayCode, index),
                      ],
                    );
                  }),
            ),
          );
  }

  Color getColor(String char, int index) {
    char.isNotEmpty ? char = char[0] : char = '';
    switch (char) {
      case ('+'):
        return AppColor.success.withOpacity(0.2);
      case ('-'):
        return AppColor.error.withOpacity(0.2);
      default:
        if (index % 2 == 0) {
          return AppColor.background;
        } else {
          return AppColor.onBackground;
        }
    }
  }
}

class CodeChunk {
  int addStartLine;
  int addStartingLength;
  int removeStartLine;
  int removeStartingLength;
  List<String> code;

  CodeChunk(
      {this.code,
      this.addStartingLength,
      this.addStartLine,
      this.removeStartingLength,
      this.removeStartLine});

  Map getMap() {
    return {
      'startAdd': addStartLine,
      'lengthAdd': addStartingLength,
      'startRemove': removeStartLine,
      'lengthRemove': removeStartingLength,
      'code': code,
    };
  }
}

class ChunkHeader extends StatefulWidget {
  final List<String> rawData;
  final int index;
  final List<String> displayCode;
  final int startAdd;
  final int startRemove;
  final String fileType;
  final List<Map> codeChunks;
  final int maxChars;
  final bool wrap;
  final List<String> displayHeader;
  final PatchViewController controller;

  ChunkHeader(
      {this.codeChunks,
      this.startAdd,
      this.startRemove,
      this.displayHeader,
      this.index,
      this.fileType,
      this.wrap,
      this.rawData,
      this.controller,
      this.maxChars,
      this.displayCode});
  @override
  _ChunkHeaderState createState() => _ChunkHeaderState(controller);
}

class _ChunkHeaderState extends State<ChunkHeader> {
  _ChunkHeaderState(PatchViewController controller) {
    if (controller != null) controller.wrap = changeWrap;
  }
  bool expanded = false;
  List<String> data;
  bool wrap;

  @override
  void initState() {
    setupData();
    wrap = widget.wrap;

    if (widget.startAdd == 1 || widget.startRemove == 1) expanded = true;
    super.initState();
  }

  bool changeWrap() {
    setState(() {
      wrap = !wrap;
    });
    return wrap;
  }

  void setupData() {
    if (widget.index == 0) {
      data = widget.rawData.sublist(0, widget.startAdd - 1);
    } else {
      data = widget.rawData.sublist(
          widget.codeChunks[widget.index - 1]['startAdd'] +
              widget.codeChunks[widget.index - 1]['lengthAdd'] -
              1,
          widget.startAdd - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (expanded) {
      return SizeExpandedSection(
        child: Container(
          width: wrap
              ? MediaQuery.of(context).size.width
              : widget.maxChars.toDouble() * 10,
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                    color: index % 2 == 0
                        ? AppColor.background
                        : AppColor.onBackground,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 35,
                          child: Text(widget.index == 0
                              ? '${index + 1}'
                              : '${widget.codeChunks[widget.index - 1]['startRemove'] + widget.codeChunks[widget.index - 1]['lengthRemove'] + index}'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 35,
                          child: Text(widget.index == 0
                              ? '${index + 1}'
                              : '${widget.codeChunks[widget.index - 1]['startAdd'] + widget.codeChunks[widget.index - 1]['lengthAdd'] + index}'),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Flexible(
                          child: HighlightView(
                            data[index],
                            backgroundColor: Colors.transparent,
                            theme: monokaiSublimeTheme,
                            language: widget.fileType,
                          ),
                        ),
                      ],
                    ));
              }),
        ),
      );
    }
    return Material(
      color: AppColor.accent.withOpacity(0.7),
      child: InkWell(
        onTap: () {
          setState(() {
            if (widget.rawData != null) expanded = true;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.expand,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                widget.displayHeader[widget.index],
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Flexible(
                child: Text(
                  widget.displayCode[0],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
