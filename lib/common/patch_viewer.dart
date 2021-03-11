import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/services/git_database/git_database_service.dart';
import 'package:onehub/style/colors.dart';

// Todo: I know this code is very messy. I wrote it 6 months ago and did not document it so I will figure this out and rewrite it later.
class PatchViewer extends StatefulWidget {
  final String patch;
  final String rawFileURL;
  final String fileType;

  /// Pass this as true before starting parsing to prevent lag.
  final bool waitBeforeLoad;
  PatchViewer(
      {Key key,
      this.patch,
      this.rawFileURL,
      this.fileType,
      this.waitBeforeLoad = true})
      : super(key: key);

  @override
  _PatchViewerState createState() => _PatchViewerState();
}

class _PatchViewerState extends State<PatchViewer> {
  String patch;
  int maxChars = 0;
  List<String> rawData;
  bool loading = true;

  @override
  void initState() {
    patch = widget.patch;
    startUp();
    super.initState();
  }

  void startUp() async {
    List<Future> futures = [];
    if (widget.rawFileURL != null) futures.add(fetchRawFile());
    if (widget.waitBeforeLoad)
      futures.add(Future.delayed(Duration(seconds: 1)));
    await Future.wait(futures);
    regex();

    setState(() {
      loading = false;
    });
  }

  Future fetchRawFile() async {
    String data = await GitDatabaseService.getRawFile(widget.rawFileURL);
    rawData = data.split('\n');
    rawData = rawData.sublist(0, rawData.length - 1);
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
                HighlightView(
                  displayCodeWithoutFirstLine[lineIndex].length > 0
                      ? displayCodeWithoutFirstLine[lineIndex].substring(1)
                      : " ",
                  backgroundColor: Colors.transparent,
                  theme: monokaiSublimeTheme,
                  language: widget.fileType,
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
              width: maxChars.toDouble() * 14,
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
                          maxChars: maxChars,
                          fileType: widget.fileType,
                          rawData: rawData,
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
  final String fileType;
  final List<Map> codeChunks;
  final int maxChars;
  final List<String> displayHeader;
  ChunkHeader(
      {this.codeChunks,
      this.startAdd,
      this.displayHeader,
      this.index,
      this.fileType,
      this.rawData,
      this.maxChars,
      this.displayCode});
  @override
  _ChunkHeaderState createState() => _ChunkHeaderState();
}

class _ChunkHeaderState extends State<ChunkHeader> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    if (expanded) {
      List<String> data;
      if (widget.index == 0) {
        data = widget.rawData.sublist(0, widget.startAdd - 1);
      } else {
        data = widget.rawData.sublist(
            widget.codeChunks[widget.index - 1]['startAdd'] +
                widget.codeChunks[widget.index - 1]['lengthAdd'] -
                1,
            widget.startAdd - 1);
      }
      return SizeExpandedSection(
        child: Container(
          width: widget.maxChars.toDouble() * 14,
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
                              : '${widget.codeChunks[widget.index - 1]['startAdd'] + widget.codeChunks[widget.index - 1]['lengthAdd'] + index}'),
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
                        HighlightView(
                          data[index],
                          backgroundColor: Colors.transparent,
                          theme: monokaiSublimeTheme,
                          language: widget.fileType,
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
              Text(
                widget.displayCode[0],
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
