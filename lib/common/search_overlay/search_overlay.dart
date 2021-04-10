import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/overlay_menu_widget.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/common/user_search_dropdown.dart';
import 'package:onehub/providers/landing_navigation_provider.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/style/text_field_themes.dart';
import 'package:provider/provider.dart';

class SearchOverlayScreen extends StatefulWidget {
  final String? message;
  SearchOverlayScreen({this.message});
  @override
  _SearchOverlayScreenState createState() => _SearchOverlayScreenState();
}

class _SearchOverlayScreenState extends State<SearchOverlayScreen> {
  @override
  Widget build(BuildContext context) {
    final _navProvider = Provider.of<NavigationProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 8),
                  child: Column(
                    children: [
                      Hero(
                        tag: 'search_bar',
                        child: Material(
                          color: Colors.transparent,
                          child: _SearchBar(
                            SearchFilters.repositories(
                                blacklist: [SearchQueryStrings.repo]),
                            message: widget.message,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: 'homeNavButton',
                      child: ClipOval(
                        child: Material(
                          color: AppColor.onBackground,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: IconButton(
                              iconSize: 25,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(LineIcons.times),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: 'searchNavButton',
                      child: ClipOval(
                        child: Material(
                          elevation: 2,
                          color: AppColor.onBackground,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: IconButton(
                              iconSize: 25,
                              onPressed: () {
                                _navProvider.animateToPage(1);
                                Navigator.pop(context);
                              },
                              icon: Icon(LineIcons.search),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  final SearchFilters searchFilters;
  final String? message;
  _SearchBar(this.searchFilters, {this.message});
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  FocusNode searchNode = FocusNode();
  late TextEditingController controller;
  int qLength = 0;

  @override
  void initState() {
    controller = TextEditingController();
    getFocus();
    searchNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void getFocus() async {
    await Future.delayed(Duration(milliseconds: 500));
    if (mounted)
      setState(() {
        searchNode.requestFocus();
      });
  }

  void addString(String data,
      {bool spaceAtEnd = true, bool spaceAtStart = false, String remove = ''}) {
    controller.text =
        controller.text.substring(0, controller.text.length - remove.length);
    controller.text = controller.text +
        '${spaceAtStart ? ' ' : ''}$data${spaceAtEnd ? ' ' : ''}';
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
    searchNode.requestFocus();
    suggestions(controller.text);
  }

  bool isEndSame(String initial, String part) {
    return initial.substring(initial.length - part.length) == part;
  }

  List<String> getMatches(RegExp regexp, String pattern) {
    List<String> matches = [];
    pattern.splitMapJoin(regexp, onMatch: (Match m) {
      matches.add(m.group(0)!);
      return m.group(0)!;
    });
    return matches;
  }

  Widget list(int length, builder, {Key? key}) {
    return SizeExpandedSection(
      key: key,
      child: Material(
        color: AppColor.onBackground,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        elevation: 8,
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return builder(context, index);
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 0,
              );
            },
            itemCount: length),
      ),
    );
  }

  OverlayController filtersOverlayController = OverlayController();
  OverlayController suggestionsOverlayController = OverlayController();
  Widget overlayWidget = Container();

  void showOverlay(Widget widget) {
    setState(() {
      overlayWidget = widget;
      suggestionsOverlayController.open();
    });
  }

  void closeOverlay() {
    setState(() {
      overlayWidget = Container();
      suggestionsOverlayController.close();
    });
  }

  void suggestions(String pattern) {
    closeOverlay();
    // if (pattern.isEmpty) return [];
    // Get matches on the option queries on the supplied text.
    List<String?> matches =
        getMatches(widget.searchFilters.sensitiveQueriesRegExp, pattern);
    String typedData = '';
    SearchQuery? query;
    matches.forEach(
      (element) {
        if (isEndSame(pattern, element!)) {
          typedData = element.split(':')[1];
          query =
              widget.searchFilters.queryFromString(element.split(':').first);
        }
      },
    );
    List<String?> completedQueries = getMatches(
        RegExp(
            '${widget.searchFilters.sensitiveQueriesOptionsRegExp.pattern}|${widget.searchFilters.sensitiveQueriesRegExp.pattern}|${widget.searchFilters.queriesRegExp.pattern}'),
        pattern);
    bool isLastQueryActive = completedQueries.isNotEmpty &&
        isEndSame(pattern, completedQueries.last!);
    if (!isLastQueryActive) {
      List<String> filteredOptions = [];

      typedData = pattern.split(' ').last;
      if (typedData.isNotEmpty) {
        widget.searchFilters.whiteListedQueriesStrings.forEach((element) {
          if (element.startsWith(typedData)) filteredOptions.add(element);
        });
        showOverlay(list(filteredOptions.length, (context, index) {
          return ListTile(
            onTap: () {
              addString(filteredOptions[index] + ':',
                  spaceAtEnd: false, remove: typedData);
            },
            title: Text(
              filteredOptions[index] + ':',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }, key: Key(typedData)));
      }
    } else if (query?.type == QueryType.number && (typedData.isEmpty)) {
      // return [0, typedData];
    } else if (query?.type == QueryType.user && !typedData.endsWith(' ')) {
      showOverlay(UserSearchDropdown(
        typedData,
        onSelected: (data) {
          addString(data, remove: typedData);
        },
      ));
    } else if (query?.options?.keys != null) {
      List<String> filteredOptions = [];
      query!.options?.keys.toList().forEach(
        (element) {
          if (element.startsWith(typedData)) filteredOptions.add(element);
        },
      );
      showOverlay(list(filteredOptions.length, (context, index) {
        return ListTile(
          onTap: () {
            addString(filteredOptions[index],
                spaceAtEnd: true, remove: typedData);
          },
          title: Text(filteredOptions[index]),
        );
      }, key: Key(typedData)));
      // return [OptionsSuggestion(filteredOptions, typedData)];
    }
    // return <String>[];
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Column(
      children: [
        OverlayMenuWidget(
          controller: suggestionsOverlayController,
          overlay: overlayWidget,
          child: ExtendedTextField(
            controller: controller,
            maxLines: 10,
            focusNode: searchNode,
            minLines: 1,
            onChanged: (pattern) {
              suggestions(pattern);
            },
            specialTextSpanBuilder:
                MySpecialTextSpanBuilder(widget.searchFilters),
            decoration: TextFieldTheme.inputDecoration(
                hintText: widget.message,
                icon: LineIcons.search,
                labelText: 'Searching For',
                focusNode: searchNode),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: OverlayMenuWidget(
                  controller: filtersOverlayController,
                  overlay: Container(
                    width: _media.width * 0.6,
                    padding:
                        EdgeInsets.only(bottom: _media.height * 0.4, top: 16),
                    child: Material(
                      color: AppColor.onBackground,
                      borderRadius: AppThemeBorderRadius.medBorderRadius,
                      elevation: 8,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                addString(
                                    widget.searchFilters
                                            .whiteListedQueries[index].query +
                                        ':',
                                    spaceAtEnd: false,
                                    spaceAtStart: true);
                                filtersOverlayController.close();
                              },
                              title: Text(
                                widget.searchFilters.whiteListedQueries[index]
                                        .query +
                                    ':',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount:
                              widget.searchFilters.whiteListedQueries.length),
                    ),
                  ),
                  childAnchor: Alignment.bottomLeft,
                  portalAnchor: Alignment.topCenter,
                  child: IconButton(
                      onPressed: () {
                        filtersOverlayController.open();
                      },
                      icon: Icon(LineIcons.filter))),
            ),
          ],
        ),
      ],
    );
  }
}

class UserSuggestion extends SuggestionInfo {
  final String query;
  UserSuggestion(this.query, String typedData) : super(typedData);
}

class OptionsSuggestion extends SuggestionInfo {
  final List<String> results;
  OptionsSuggestion(this.results, String typedData) : super(typedData);
}

class FilterSuggestion extends SuggestionInfo {
  final List<String> filters;
  FilterSuggestion(this.filters, String typedData) : super(typedData);
}

abstract class SuggestionInfo {
  final String typedData;
  SuggestionInfo(this.typedData);
}

class MySpecialTextSpanBuilder extends SpecialTextSpanBuilder {
  MySpecialTextSpanBuilder(this.searchFilters)
      : patternMap = {
          searchFilters.sensitiveQueriesOptionsRegExp: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
          searchFilters.queriesRegExp: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        },
        blacklistPatternMap = {
          searchFilters.sensitiveQueriesRegExp: TextStyle(
              color: AppColor.grey3,
              decoration: TextDecoration.combine([TextDecoration.lineThrough])),
          searchFilters.blacklistRegExp: TextStyle(
            color: Colors.red,
            decoration: TextDecoration.combine([TextDecoration.lineThrough]),
          ),
        };
  final SearchFilters searchFilters;
  final Map<RegExp, TextStyle> patternMap;
  final Map<RegExp, TextStyle> blacklistPatternMap;
  @override
  TextSpan build(String data, {TextStyle? textStyle, onTap}) {
    if (data == '') {
      return const TextSpan(text: '');
    }
    final List<InlineSpan> inlineList = <InlineSpan>[];
    if (data.isNotEmpty) {
      SpecialText? specialText;
      String textStack = '';
      for (int i = 0; i < data.length; i++) {
        final String char = data[i];
        textStack += char;

        if (specialText != null) {
          if (!specialText.isEnd(textStack)) {
            specialText.appendContent(char);
          } else {
            inlineList.add(specialText.finishText());
            specialText = null;
            textStack = '';
          }
        } else {
          specialText = createSpecialText(textStack,
              textStyle: textStyle, onTap: onTap, index: i);
          if (specialText != null) {
            if (textStack.length - specialText.startFlag.length >= 0) {
              textStack = textStack.substring(
                  0, textStack.length - specialText.startFlag.length);
              if (textStack.isNotEmpty) {
                inlineList.add(getSpan(textStack, textStyle));
              }
            }
            textStack = '';
          }
        }
      }
      if (specialText != null) {
        inlineList.add(TextSpan(
            text: specialText.startFlag + specialText.getContent(),
            style: const TextStyle(color: Colors.yellow)));
      } else if (textStack.isNotEmpty) {
        inlineList.add(getSpan(textStack, textStyle));
      }
    } else {
      inlineList.add(
          TextSpan(text: data, style: const TextStyle(color: Colors.blue)));
    }
    return TextSpan(children: inlineList, style: textStyle);
  }

  TextSpan getSpan(String text, TextStyle? style) {
    List<TextSpan> children = [];
    List<String> matches = [];
    // Validating with REGEX
    RegExp? allRegex;
    String wlRegex = patternMap.keys.map((e) => e.pattern).join('|');
    String blRegex = blacklistPatternMap.keys.map((e) => e.pattern).join('|');
    Map<RegExp, TextStyle> combinedMap = {};
    combinedMap.addAll(patternMap);
    combinedMap.addAll(blacklistPatternMap);
    allRegex = RegExp('$wlRegex|$blRegex');
    text.splitMapJoin(
      allRegex,
      onMatch: (Match m) {
        if (!matches.contains(m[0])) matches.add(m[0]!);
        RegExp? k = combinedMap.entries.firstWhere((element) {
          return element.key.allMatches(m[0]!).isNotEmpty;
        }).key;
        children.add(
          TextSpan(
            text: m[0],
            style: combinedMap[k],
          ),
        );

        return '';
      },
      onNonMatch: (String span) {
        children.add(TextSpan(text: span, style: style));
        return span.toString();
      },
    );

    return TextSpan(style: style, children: children);
  }

  @override
  SpecialText? createSpecialText(String? flag,
      {TextStyle? textStyle,
      SpecialTextGestureTapCallback? onTap,
      int? index}) {
    if (flag == null || flag == '') {
      return null;
    }
    // print(searchFilters.queriesRegExp.firstMatch(flag)?.group(0)!);
    // print(flag.endsWith(
    //     searchFilters.queriesRegExp.firstMatch(flag)?.group(0)! ?? 'dhghgxh'));
    if (searchFilters.sensitiveQueriesOptionsRegExp.hasMatch(flag))
      return ValidQuery(
          searchFilters.sensitiveQueriesOptionsRegExp
              .firstMatch(flag)!
              .group(0)!,
          index!);
    else if (searchFilters.queriesRegExp.hasMatch(flag))
      return ValidQuery(
          searchFilters.queriesRegExp.firstMatch(flag)!.group(0)!, index!,
          basicQuery: true);
    return null;
  }
}

class ValidQuery extends SpecialText {
  ValidQuery(String startFlag, this.start, {bool basicQuery = false})
      : super(startFlag, basicQuery ? '  ' : ' ', TextStyle());

  final int start;
  @override
  InlineSpan finishText() {
    print(toString());
    return ExtendedWidgetSpan(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(child: Text(toString().trim())),
      ),
      start: start,
      actualText: toString(),
      deleteAll: false,
    );
  }
}
