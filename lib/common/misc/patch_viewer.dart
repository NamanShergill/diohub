import 'dart:async';

import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
import 'package:dio_hub/common/misc/code_block_view.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/models/repositories/blob_model.dart';
import 'package:dio_hub/services/git_database/git_database_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/parse_base64.dart';
import 'package:dio_hub/utils/type_cast.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';

class WrapIconButton extends StatelessWidget {
  const WrapIconButton({
    required this.wrap,
    required this.onWrap,
    super.key,
    this.size = 24,
  });
  final bool wrap;
  final ValueChanged<bool> onWrap;
  final double size;

  @override
  Widget build(final BuildContext context) => InkWell(
        borderRadius: smallBorderRadius,
        onTap: () {
          onWrap(!wrap);
        },
        child: Padding(
          padding: EdgeInsets.all(size / 2),
          child: Icon(
            Icons.wrap_text_rounded,
            size: size,
            color: context.colorScheme.onSurface.withOpacity(wrap ? 1 : 0.5),
          ),
        ),
      );
}

// TODO(namanshergill): I know this code is very messy. I wrote it 6 months ago and did not document it so I will figure this out and rewrite it later.
class PatchViewer extends StatefulWidget {
  const PatchViewer({
    super.key,
    this.patch,
    this.isWidget = false,
    this.wrap = false,
    this.initLoading = true,
    this.contentURL,
    this.limitLines,
    this.fileType,
    this.waitBeforeLoad = true,
  });
  final String? patch;
  final String? contentURL;
  final String? fileType;
  final bool wrap;
  final bool initLoading;
  final bool isWidget;
  final int? limitLines;

  /// Pass this as true before starting parsing to prevent lag.
  // TODO(namanshergill): Remove?
  final bool waitBeforeLoad;

  @override
  PatchViewerState createState() => PatchViewerState();
}

class PatchViewerState extends State<PatchViewer> {
  String? patch;
  int maxChars = 0;
  List<String>? rawData;
  late bool loading;

  @override
  void initState() {
    patch = widget.patch;
    loading = widget.initLoading;
    unawaited(startUp());
    super.initState();
  }

  Future<void> startUp() async {
    final List<Future<dynamic>> futures = <Future<dynamic>>[];
    if (widget.contentURL != null) {
      futures.add(fetchBlobFile());
    }
    await Future.wait(futures);
    await regex();
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  Future<dynamic> fetchBlobFile() async {
    final BlobModel blob =
        await GitDatabaseService.getFileContents(widget.contentURL!);
    final String data = blob.content!;
    rawData = parseBase64(data).split('\n');
    for (final String str in rawData!) {
      if (str.length > maxChars) {
        maxChars = str.length;
      }
    }
  }

  Future<void> regex() async {
    final RegExpMatch firstHeader =
        RegExp(r'(?:@@ )(.*)(?: @@)').firstMatch(patch!)!;
    makeCodeChunks(firstHeader);
    patch = patch!.replaceFirst(RegExp(r'(?=@@)(.*)(?<=@@)'), '');
    RegExp(r'(?:\n)(?:@@ )(.*)(?: @@)')
        .allMatches(patch!)
        .forEach(makeCodeChunks);
    codeSplit.addAll(patch!.split(RegExp(r'(?:\n)(?=@@)(.*)(?<=@@)')));
    for (int i = 0; i < codeSplit.length; i++) {
      codeChunks[i]['code'] = codeSplit[i].split('\n');
      // log(codeChunks[i].toString());
      for (final String str in codeChunks[i]['code']) {
        if (str.length > maxChars) {
          maxChars = str.length;
        }
      }
    }
  }

  void makeCodeChunks(final RegExpMatch element) {
    final CodeChunk info = CodeChunk();
    displayHeader.add('@@ ${element.group(1)} @@');
    final List<String> splitHeader = element.group(1)!.split(' ');
    for (final String element in splitHeader) {
      final List<String> headerValuesString = <String>[];
      final List<int> headerValues = <int>[];
      headerValuesString.addAll(element.split(','));
      headerValues
        ..add(int.parse(headerValuesString[0]))
        ..add(int.parse(headerValuesString[1]));

      if (headerValues[0] < 0) {
        info
          ..removeStartLine = headerValues[0].abs()
          ..removeStartingLength = headerValues[1];
      }
      if (headerValues[0] > 0) {
        info
          ..addStartLine = headerValues[0]
          ..addStartingLength = headerValues[1];
      }
    }
    codeChunks.add(info.getMap());
  }

  List<TypeMap> codeChunks = <TypeMap>[];
  List<String> codeSplit = <String>[];
  List<String> displayHeader = <String>[];

  Widget showCodeChunk(
    final List<String> displayCode,
    final int chunkIndex, {
    final int? onlyLast,
  }) {
    int getSublist() {
      if (onlyLast != null && displayCode.length > onlyLast) {
        return displayCode.length - onlyLast;
      } else {
        return 1;
      }
    }

    int getRemoveIndex = codeChunks[chunkIndex]['startRemove'] ?? 1;

    int getAddIndex = codeChunks[chunkIndex]['startAdd'] ?? 1;

    final List<String> displayCodeWithoutFirstLine =
        displayCode.sublist(getSublist());

    return ListView.builder(
      shrinkWrap: true,
      itemCount: displayCodeWithoutFirstLine.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (final BuildContext context, final int lineIndex) =>
          ColoredBox(
        color: getColor(displayCodeWithoutFirstLine[lineIndex], lineIndex),
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 35,
              child: Text.rich(
                TextSpan(
                  text: displayCodeWithoutFirstLine[lineIndex][0] == '+'
                      ? ''
                      : '${getRemoveIndex++}',
                ),
                style: const TextStyle(fontFamily: 'monospace'),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 35,
              child: Text.rich(
                TextSpan(
                  text: displayCodeWithoutFirstLine[lineIndex][0] == '-'
                      ? ''
                      : '${getAddIndex++}',
                ),
                style: const TextStyle(fontFamily: 'monospace'),
              ),
            ),
            SizedBox(
              width: 5,
              child: Text(
                displayCodeWithoutFirstLine[lineIndex].isNotEmpty
                    ? displayCodeWithoutFirstLine[lineIndex][0]
                    : ' ',
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: CodeBlockView(
                displayCodeWithoutFirstLine[lineIndex].isNotEmpty
                    ? displayCodeWithoutFirstLine[lineIndex].substring(1)
                    : ' ',
                language: widget.fileType,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) => loading
      ? Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const LoadingIndicator(),
            ],
          ),
        )
      : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: widget.wrap ||
                    maxChars.toDouble() * 10 < MediaQuery.of(context).size.width
                ? MediaQuery.of(context).size.width
                : maxChars.toDouble() * 10,
            child: ListView.builder(
              itemCount: codeChunks.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (final BuildContext context, final int index) {
                final List<String> displayCode = codeChunks[index]['code'];

                return InkWell(
                  onTap: widget.limitLines != null &&
                          displayCode.length - 1 > widget.limitLines!
                      ? () async {
                          bool wrap = false;
                          await showScrollableBottomSheet(
                            context,
                            headerBuilder: (
                              final BuildContext context,
                              final StateSetter setState,
                            ) =>
                                Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.copy,
                                    // color: transparent,
                                  ),
                                ),
                                const Text(
                                  'Patch Diff',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                WrapIconButton(
                                  wrap: wrap,
                                  onWrap: (final bool value) {
                                    setState(() {
                                      wrap = !wrap;
                                    });
                                  },
                                ),
                              ],
                            ),
                            scrollableBodyBuilder: (
                              final BuildContext context,
                              final StateSetter setState,
                              final ScrollController scrollController,
                            ) =>
                                SingleChildScrollView(
                              controller: scrollController,
                              child: PatchViewer(
                                isWidget: true,
                                patch: widget.patch,
                                fileType: widget.fileType,
                                waitBeforeLoad: false,
                                wrap: wrap,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      if (codeChunks[index]['startAdd'] != null &&
                          !widget.isWidget)
                        ChunkHeader(
                          codeChunks: codeChunks,
                          displayCode: displayCode,
                          displayHeader: displayHeader,
                          index: index,
                          startRemove: codeChunks[index]['startRemove'],
                          maxChars: maxChars,
                          fileType: widget.fileType,
                          rawData: rawData,
                          wrap: widget.wrap,
                          startAdd: codeChunks[index]['startAdd'],
                        ),
                      if (widget.isWidget)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text.rich(
                            TextSpan(
                              text: displayHeader[index] + displayCode[0],
                            ),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 12,
                              // color: Provider.of<PaletteSettings>(context)
                              //     .currentSetting
                              //     .faded3,
                            ),
                          ),
                        ),
                      if (widget.limitLines != null &&
                          displayCode.length - 1 > widget.limitLines!)
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            '...Tap to view whole diff.',
                            style: TextStyle(fontFamily: 'monospace'),
                          ),
                        ),
                      showCodeChunk(
                        displayCode,
                        index,
                        onlyLast: widget.limitLines,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );

  Color getColor(final String char, final int index) {
    String str = char;
    str.isNotEmpty ? str = str[0] : str = '';
    switch (str) {
      case '+':
        return context.colorScheme.surface;
      case '-':
        return context.colorScheme.surfaceVariant;
      default:
        if (index.isEven) {
          return context.colorScheme.background;
        } else {
          return context.colorScheme.background;
        }
    }
  }
}

class CodeChunk {
  CodeChunk({
    this.code,
    this.addStartingLength,
    this.addStartLine,
    this.removeStartingLength,
    this.removeStartLine,
  });
  int? addStartLine;
  int? addStartingLength;
  int? removeStartLine;
  int? removeStartingLength;
  List<String>? code;

  TypeMap getMap() => <String, dynamic>{
        'startAdd': addStartLine,
        'lengthAdd': addStartingLength,
        'startRemove': removeStartLine,
        'lengthRemove': removeStartingLength,
        'code': code,
      };
}

class ChunkHeader extends StatefulWidget {
  const ChunkHeader({
    required this.wrap,
    this.codeChunks,
    this.startAdd,
    this.startRemove,
    this.displayHeader,
    this.index,
    this.fileType,
    this.rawData,
    this.maxChars,
    this.displayCode,
    super.key,
  });
  final List<String>? rawData;
  final int? index;
  final List<String>? displayCode;
  final int? startAdd;
  final int? startRemove;
  final String? fileType;
  final List<TypeMap>? codeChunks;
  final int? maxChars;
  final bool wrap;
  final List<String>? displayHeader;

  @override
  ChunkHeaderState createState() => ChunkHeaderState();
}

class ChunkHeaderState extends State<ChunkHeader> {
  bool expanded = false;
  late List<String> data;

  @override
  void initState() {
    setupData();

    if (widget.startAdd == 1 || widget.startRemove == 1) {
      expanded = true;
    }
    super.initState();
  }

  void setupData() {
    if (widget.index == 0) {
      data = widget.rawData!.sublist(0, widget.startAdd! - 1);
    } else {
      data = widget.rawData!.sublist(
        (widget.codeChunks![widget.index! - 1]['startAdd'] +
                widget.codeChunks![widget.index! - 1]['lengthAdd']) ??
            1 - 1,
        widget.startAdd! - 1,
      );
    }
  }

  @override
  Widget build(final BuildContext context) {
    if (expanded) {
      return SizeExpandedSection(
        child: SizedBox(
          width: widget.wrap
              ? MediaQuery.of(context).size.width
              : widget.maxChars!.toDouble() * 10,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (final BuildContext context, final int index) =>
                ColoredBox(
              color: index.isEven
                  ? context.colorScheme.background
                  : context.colorScheme.surface,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 35,
                    child: Text(
                      widget.index == 0
                          ? '${index + 1}'
                          : '${widget.codeChunks![widget.index! - 1]['startRemove'] + widget.codeChunks![widget.index! - 1]['lengthRemove'] + index}',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 35,
                    child: Text(
                      widget.index == 0
                          ? '${index + 1}'
                          : '${widget.codeChunks![widget.index! - 1]['startAdd'] + widget.codeChunks![widget.index! - 1]['lengthAdd'] + index}',
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Flexible(
                    child: CodeBlockView(
                      data[index],
                      language: widget.fileType,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return Material(
      color: context.colorScheme.primary.withOpacity(0.7),
      child: InkWell(
        onTap: () {
          setState(() {
            if (widget.rawData != null) {
              expanded = true;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              const Icon(
                Icons.expand,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.displayHeader![widget.index!],
                style: const TextStyle(fontSize: 12),
              ),
              Flexible(
                child: Text(
                  widget.displayCode![0],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
