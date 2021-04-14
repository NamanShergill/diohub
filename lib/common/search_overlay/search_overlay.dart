import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/custom_expand_tile.dart';
import 'package:onehub/common/overlay_menu_widget.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/common/search_overlay/range_picker.dart';
import 'package:onehub/common/user_search_dropdown.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/style/text_field_themes.dart';

class SearchOverlayScreen extends StatefulWidget {
  final String? message;
  final ValueChanged<SearchData> onSubmit;
  final String heroTag;
  final SearchData searchData;
  SearchOverlayScreen(this.searchData,
      {this.message, this.heroTag = 'search_bar', required this.onSubmit});
  @override
  _SearchOverlayScreenState createState() => _SearchOverlayScreenState();
}

class _SearchOverlayScreenState extends State<SearchOverlayScreen> {
  late SearchData searchData;
  late SearchFilters searchFilters;
  final OverlayController infoOverlay = OverlayController();

  @override
  void initState() {
    searchFilters =
        widget.searchData.searchFilters ?? SearchFilters.repositories();
    searchData = widget.searchData;
    super.initState();
  }

  bool get isValid {
    bool isValid = false;
    searchData.filterStrings.forEach((element) {
      SearchQuery query =
          searchData.searchFilters!.queryFromString(element.split(':').first)!;
      if (query.qualifierQuery) isValid = true;
    });

    int numberOfAndOrNot = 0;
    searchData.query.splitMapJoin(
      RegExp(SearchFilters.notOperatorRegExp.pattern +
          '|' +
          SearchFilters.andOperatorRegExp.pattern +
          '|' +
          SearchFilters.orOperatorRegExp.pattern),
      onMatch: (Match m) {
        numberOfAndOrNot++;
        return '';
      },
    );
    return (isValid || searchData.query.trim().isNotEmpty) &&
        numberOfAndOrNot <= 5;
  }

  SearchFilters getFilters(SearchType type) {
    switch (type) {
      case SearchType.repositories:
        return SearchFilters.repositories();
      case SearchType.issues_pulls:
        return SearchFilters.issuesPulls();
      case SearchType.users:
        return SearchFilters.users();
      default:
        return SearchFilters.repositories();
    }
  }

  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Material(
                        color: Colors.transparent,
                        child: _SearchBar(
                          searchFilters,
                          widget.searchData,
                          heroTag: widget.heroTag,
                          onChanged: (data) {
                            setState(() {
                              searchData =
                                  data.copyWith(searchFilters: searchFilters);
                            });
                          },
                          message: widget.message,
                        ),
                      ),
                    ),
                    if (widget.searchData.multiType)
                      Divider(
                        height: 0,
                      ),
                    if (widget.searchData.multiType)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: CustomExpandTile(
                          title: Text(
                            'Searching in ${searchTypeValues.reverse![searchFilters.searchType]}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            setState(() {
                              expanded = !expanded;
                            });
                          },
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return RadioListTile(
                                  activeColor: AppColor.accent,
                                  groupValue: searchFilters.searchType,
                                  value: searchTypeValues.map.values
                                      .toList()[index],
                                  onChanged: (value) {
                                    setState(() {
                                      searchFilters = getFilters(
                                          searchTypeValues.map.values
                                              .toList()[index]);
                                      expanded = !expanded;
                                    });
                                  },
                                  title: Text(
                                    searchTypeValues.map.keys.toList()[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: searchTypeValues.map.keys.length),
                          expanded: expanded,
                        ),
                      ),
                    SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: KeyboardVisibilityBuilder(
                    builder: (context, isKeyboardVisible) {
                  return OverlayMenuWidget(
                    controller: infoOverlay,
                    heightMultiplier: isKeyboardVisible ? 0.3 : 0.6,
                    childAnchor: Alignment.topCenter,
                    portalAnchor: Alignment.bottomCenter,
                    overlay: Material(
                      color: AppColor.onBackground,
                      borderRadius: AppThemeBorderRadius.medBorderRadius,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListView(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'How to format your filters',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                            text:
                                                'Search filters should be in the format '),
                                        TextSpan(
                                            text: 'filter:data',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: '.\n'),
                                        TextSpan(
                                            text:
                                                'Example, label:enhancement will include all results with a label named enhancement.',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic)),
                                      ]),
                                    ),
                                    Divider(),
                                    Text.rich(
                                      TextSpan(children: [
                                        TextSpan(text: 'Add a '),
                                        TextSpan(
                                            text: 'minus (-)',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text:
                                                ' before a search filter to exclude it from the results.\n'),
                                        TextSpan(
                                            text:
                                                'Example, -label:enhancement will exclude all results with a label named enhancement.',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic)),
                                      ]),
                                    ),
                                    Divider(),
                                    Text.rich(
                                      TextSpan(children: [
                                        TextSpan(text: 'You can use '),
                                        TextSpan(
                                            text: 'AND, OR, NOT',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: ' operators in your query '),
                                        TextSpan(
                                            text: '(upto a maximum of 5 times)',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: '.\n'),
                                        TextSpan(
                                            text:
                                                'Example, "jquery NOT bootstrap" matches results that do contain the word "jquery" but not "bootstrap".',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic)),
                                      ]),
                                    ),
                                    Divider(),
                                    Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                            text:
                                                'Data containing whitespaces must be wrapped in quotes like '),
                                        TextSpan(
                                            text: 'filter:"filter info"',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: '.\n'),
                                        TextSpan(
                                            text:
                                                'Example, label:"bug fix" will include all results with a label named bug fix.',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic)),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Hero(
                            tag: 'homeNavButton',
                            child: Material(
                              elevation: 2,
                              type: MaterialType.circle,
                              color: AppColor.onBackground,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: IconButton(
                                  iconSize: 25,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(LineIcons.arrowLeft),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 2,
                            type: MaterialType.circle,
                            color: AppColor.onBackground,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: IconButton(
                                iconSize: 25,
                                onPressed: () {
                                  Navigator.pop(context);
                                  widget.onSubmit(searchData.cleared);
                                },
                                icon: Icon(Icons.clear),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 2,
                            type: MaterialType.circle,
                            color: AppColor.onBackground,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: IconButton(
                                iconSize: 25,
                                onPressed: () {
                                  infoOverlay.tapped();
                                },
                                icon: Icon(LineIcons.info),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Hero(
                            tag: 'searchNavButton',
                            child: Material(
                              elevation: isValid ? 2 : 0,
                              type: MaterialType.circle,
                              color: AppColor.onBackground,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: IconButton(
                                  iconSize: 25,
                                  onPressed: isValid
                                      ? () {
                                          Navigator.pop(context);
                                          widget.onSubmit(searchData);
                                        }
                                      : null,
                                  icon: Icon(LineIcons.search),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  final SearchFilters _searchFilters;
  final SearchData searchData;
  final String heroTag;
  final String? message;
  final ValueChanged<SearchData> onChanged;
  _SearchBar(this._searchFilters, this.searchData,
      {this.message, required this.onChanged, this.heroTag = 'search_bar'});
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  FocusNode searchNode = FocusNode();
  late TextEditingController controller;
  late SearchData searchData;
  @override
  void initState() {
    searchData = widget.searchData;
    controller = TextEditingController(
        text: widget.searchData.toString().trim().isNotEmpty
            ? '${widget.searchData.toString().trim()} '
            : '');
    getFocus();
    searchNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          OverlayMenuWidget(
            controller: suggestionsOverlayController,
            overlay: overlayWidget,
            child: Hero(
              tag: widget.heroTag,
              child: Material(
                color: Colors.transparent,
                child: ExtendedTextField(
                  controller: controller,
                  maxLines: 10,
                  focusNode: searchNode,
                  minLines: 1,
                  onChanged: (pattern) {
                    if (pattern.contains('\n')) {
                      controller.text = controller.text.replaceAll('\n', '');
                      if (!controller.text.endsWith(' '))
                        controller.text = controller.text + ' ';
                      _moveControllerToEnd();
                    }
                    if (pattern.trim().isEmpty)
                      controller.text = controller.text.trim();
                    _parseQuery(pattern);
                    _suggestions(pattern);
                  },
                  specialTextSpanBuilder: _TextSpanBuilder(
                      widget._searchFilters, controller, onChanged: (string) {
                    controller.text = string;
                    _parseQuery(string);
                  }),
                  decoration: TextFieldTheme.inputDecoration(
                      hintText: widget.message,
                      icon: LineIcons.search,
                      labelText: 'Searching For',
                      focusNode: searchNode),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: CustomExpandTile(
              title: Text(
                'All Filters',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              expanded: expanded,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        addString(
                            widget._searchFilters.whiteListedQueries[index]
                                    .query +
                                ':',
                            addSpaceAtEnd: false,
                            spaceAtStart: true);
                        setState(() {
                          expanded = false;
                        });
                        searchNode.requestFocus();
                      },
                      title: Text(
                        widget._searchFilters.whiteListedQueries[index].query,
                        // style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: widget._searchFilters.whiteListedQueries.length),
            ),
          ),
          SizeExpandedSection(
            expand: controller.text.trim().isNotEmpty,
            child: Column(
              children: [
                Divider(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: AppColor.onBackground,
                    onPressed: () {
                      setState(() {
                        controller.text = '';
                      });
                    },
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Tap to Clear'),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getFocus() async {
    await Future.delayed(Duration(milliseconds: 500));
    if (mounted)
      setState(() {
        searchNode.requestFocus();
      });
  }

  void addString(
    String data, {
    bool addSpaceAtEnd = true,
    bool spaceAtStart = false,
    bool addQuotesAtEnd = false,
    bool addQuotesAround = false,
    String remove = '',
  }) {
    controller.text =
        controller.text.substring(0, controller.text.length - remove.length);
    controller.text = controller.text +
        '${spaceAtStart ? ' ' : ''}${addQuotesAround ? '"' : ''}$data${addQuotesAround ? '"' : ''}${addSpaceAtEnd ? ' ' : ''}' +
        '${addQuotesAtEnd ? '""' : ''}';
    _moveControllerToEnd(addQuotesAtEnd ? 1 : 0);
    searchNode.requestFocus();
    _parseQuery(controller.text);
    _suggestions(controller.text);
  }

  void _moveControllerToEnd([int offset = 0]) {
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length - offset),
    );
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

  OverlayController suggestionsOverlayController = OverlayController();
  Widget overlayWidget = Container();

  void _showOverlay(Widget widget) {
    setState(() {
      overlayWidget = widget;
      suggestionsOverlayController.open();
    });
  }

  void _closeOverlay() {
    setState(() {
      overlayWidget = Container();
      suggestionsOverlayController.close();
    });
  }

  void _parseQuery(String pattern) {
    List<String> filterStrings = [];
    List<SearchQuery> filters = [];

    // Handle case of ranges with the bigger value before.
    pattern.splitMapJoin(widget._searchFilters.allValidQueriesRegexp,
        onMatch: (Match m) {
      String string = m[0]!;
      if (widget._searchFilters.dateQRegExp!.hasMatch(string))
        string = m[0]!.splitMapJoin(widget._searchFilters.dateQRegExp!,
            onMatch: (Match m) {
          String string = m[0]!.splitMapJoin(
              RegExp(
                  '((([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01])))([.][.])(([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))))'),
              onMatch: (Match m) {
            String date(DateTime dateTime) {
              return DateFormat('yyyy-MM-dd').format(dateTime);
            }

            String data = m[0]!;
            DateTime one = DateTime.parse(data.split('..').first);
            DateTime two = DateTime.parse(data.split('..').last);
            if (one.isAfter(two)) return '${date(two)}..${date(one)}';
            return '${date(one)}..${date(two)}';
          });
          return string;
        });
      else if (widget._searchFilters.numberQRegExp!.hasMatch(string))
        string = string.splitMapJoin(widget._searchFilters.numberQRegExp!,
            onMatch: (Match m) {
          print(m[0]!);
          String string = m[0]!.splitMapJoin(
              RegExp('((([0-9]+))([.][.])(([0-9]+)))'), onMatch: (Match m) {
            String data = m[0]!;
            int one = int.parse(data.split('..').first);
            int two = int.parse(data.split('..').last);
            if (one > two) return '$two..$one';
            return '$one..$two';
          });
          return string;
        });

      filterStrings.add(string);
      filters
          .add(widget._searchFilters.queryFromString(string.split(':').first)!);
      return '';
    });

    // print(filterStrings);
    pattern =
        pattern.replaceAll(widget._searchFilters.allInvalidQueriesRegExp, '');
    pattern = pattern.replaceAll(RegExp('(\\s+)'), ' ');
    widget.onChanged(searchData.copyWith(
        query: pattern, filterStrings: filterStrings, filters: filters));
  }

  void _suggestions(String pattern) {
    _closeOverlay();
    // if (pattern.isEmpty) return [];
    // Get matches on the option queries on the supplied text.
    if (controller.selection.baseOffset == controller.text.length) {
      List<String> matches = getMatches(
          RegExp(
              '${widget._searchFilters.allValidQueriesRegexp.pattern}|${widget._searchFilters.allInvalidQueriesRegExp.pattern}'),
          pattern);
      String typedData = '';
      SearchQuery? query;
      matches.forEach(
        (element) {
          if (isEndSame(pattern, element)) {
            typedData = element.substring(0).split(':')[1];
            String queryString = element.split(':').first;
            if (queryString.startsWith('-'))
              queryString = queryString.substring(1);
            query = widget._searchFilters.queryFromString(queryString);
          }
        },
      );
      List<String?> completedQueries = getMatches(
          RegExp(
              '${widget._searchFilters.validSensitiveQueriesRegExp.pattern}|${widget._searchFilters.invalidSensitiveQueriesRegExp.pattern}|${widget._searchFilters.validBasicQueriesRegExp.pattern}'),
          pattern);
      bool isLastQueryActive = completedQueries.isNotEmpty &&
          isEndSame(pattern, completedQueries.last!);
      if (!isLastQueryActive) {
        List<String> filteredOptions = [];
        typedData = pattern.split(' ').last;
        if (typedData.startsWith('-')) typedData = typedData.substring(1);
        if (typedData.isNotEmpty) {
          widget._searchFilters.whiteListedQueriesStrings.forEach((element) {
            if (element.startsWith(typedData)) filteredOptions.add(element);
          });

          _showOverlay(list(filteredOptions.length, (context, index) {
            return ListTile(
              onTap: () {
                SearchQuery query = widget._searchFilters
                    .queryFromString(filteredOptions[index])!;
                addString(filteredOptions[index] + ':',
                    addQuotesAtEnd: query.options == null &&
                        query.type == QueryType.spacedString,
                    addSpaceAtEnd: false,
                    remove: typedData);
              },
              title: Text(
                filteredOptions[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }, key: Key(typedData)));
        }
      } else if ((query?.type == QueryType.number ||
              query?.type == QueryType.date) &&
          (typedData.isEmpty)) {
        _showOverlay(RangePicker(
            onAdded: (string) {
              addString(string);
            },
            queryType: query!.type));
      } else if ((query?.type == QueryType.user ||
              query?.type == QueryType.org) &&
          !typedData.endsWith(' '))
        _showOverlay(UserSearchDropdown(
          typedData,
          onSelected: (data) {
            addString(data, remove: typedData);
          },
          type: query!.type,
        ));
      else if (query?.options?.keys != null) {
        List<String> filteredOptions = [];
        query!.options?.keys.toList().forEach(
          (element) {
            if (element.startsWith(typedData)) filteredOptions.add(element);
          },
        );
        _showOverlay(list(filteredOptions.length, (context, index) {
          return ListTile(
            onTap: () {
              addString(filteredOptions[index],
                  addSpaceAtEnd: true, remove: typedData);
            },
            title: Text(filteredOptions[index]),
          );
        }, key: Key(typedData)));
        // return [OptionsSuggestion(filteredOptions, typedData)];
      }
    }
    // return <String>[];
  }
}

class _TextSpanBuilder extends SpecialTextSpanBuilder {
  _TextSpanBuilder(this.searchFilters, this.controller,
      {required this.onChanged})
      : patternMap = {
          searchFilters.validSensitiveQueriesRegExp: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
          searchFilters.validBasicQueriesRegExp: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        },
        blacklistPatternMap = {
          searchFilters.invalidSensitiveQueriesRegExp: TextStyle(
              color: AppColor.grey3,
              decoration: TextDecoration.combine([TextDecoration.lineThrough])),
          searchFilters.invalidBasicQueriesRegExp: TextStyle(
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
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  @override
  TextSpan build(String data, {TextStyle? textStyle, onTap}) {
    if (data == '') {
      return const TextSpan(text: '');
    }
    final List<InlineSpan> inlineList = <InlineSpan>[];
    if (data.isNotEmpty) {
      data.splitMapJoin(
          RegExp(searchFilters.allValidQueriesRegexp.pattern
              // +
              //     '|' +
              //     searchFilters.allInvalidQueriesRegExp.pattern
              ), onMatch: (Match m) {
        // if (searchFilters.allValidQueriesRegexp.hasMatch(m[0]!))
        inlineList.add(
          _ValidQuery(m[0]!, controller, textStyle, onChanged: (string) {
            onChanged(string);
          }).finishText(),
        );
        // else if (searchFilters.allInvalidQueriesRegExp.hasMatch(m[0]!))
        //   inlineList.add(_InValidQuery(m[0]!, 1, controller, textStyle,
        //           searchFilters.blacklistRegExp.hasMatch(m[0]!))
        //       .finishText());
        return '';
      }, onNonMatch: (String string) {
        string.splitMapJoin(
            RegExp(SearchFilters.notOperatorRegExp.pattern +
                '|' +
                SearchFilters.andOperatorRegExp.pattern +
                '|' +
                SearchFilters.orOperatorRegExp.pattern), onMatch: (Match m) {
          TextStyle _textStyle = textStyle!;
          if (SearchFilters.notOperatorRegExp.hasMatch(m[0]!))
            _textStyle = _textStyle.copyWith(color: AppColor.red);
          else if (SearchFilters.orOperatorRegExp.hasMatch(m[0]!))
            _textStyle = _textStyle.copyWith(color: Colors.amber);
          else if (SearchFilters.andOperatorRegExp.hasMatch(m[0]!))
            _textStyle = _textStyle.copyWith(color: AppColor.accent);
          inlineList.add(
              getSpan(m[0]!, _textStyle.copyWith(fontWeight: FontWeight.bold)));
          return '';
        }, onNonMatch: (String string) {
          inlineList.add(getSpan(string, textStyle));
          return '';
        });
        return '';
      });
    } else {
      inlineList.add(TextSpan(text: data, style: textStyle));
    }
    return TextSpan(children: inlineList, style: textStyle);
  }

  TextSpan getSpan(String text, TextStyle? style) {
    List<TextSpan> children = [];
    List<String> matches = [];
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
  SpecialText? createSpecialText(String flag,
      {TextStyle? textStyle, onTap, required int index}) {}
}

class _ValidQuery extends SpecialText {
  _ValidQuery(String startFlag, this.controller, TextStyle? textStyle,
      {required this.onChanged})
      : super(
          startFlag,
          '',
          textStyle ?? TextStyle(),
        );
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  @override
  InlineSpan finishText() {
    return ExtendedWidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Material(
            borderRadius: AppThemeBorderRadius.smallBorderRadius,
            color: toString().startsWith('-') ? AppColor.red : AppColor.accent,
            child: InkWell(
              borderRadius: AppThemeBorderRadius.smallBorderRadius,
              onTap: () {
                if (!toString().trim().startsWith('-'))
                  onChanged(controller.text.replaceFirst(
                      RegExp('(?!-)(?:(${toString().trim()}))'), ''));
                else
                  onChanged(
                      controller.text.replaceFirst(toString().trim(), ''));

                controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller.text.length),
                );
                if (controller.text.trim().isEmpty)
                  onChanged(controller.text.trim());
                HapticFeedback.vibrate();
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 2.0, left: 6, right: 6, bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        child: RichText(
                      text: TextSpan(
                          style: textStyle.copyWith(fontSize: 14),
                          children: [
                            TextSpan(
                                text: toString()
                                        .trim()
                                        .replaceAll('"', '')
                                        .split(':')
                                        .first +
                                    ' ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: toString()
                                    .trim()
                                    .replaceAll('"', '')
                                    .split(':')
                                    .last),
                          ]),
                    )),
                    SizedBox(
                      width: 4,
                    ),
                    ClipOval(
                      child: Container(
                        color: Colors.white,
                        child: Icon(
                          Icons.close_rounded,
                          color: toString().startsWith('-')
                              ? AppColor.red
                              : AppColor.accent,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
      actualText: toString(),
      deleteAll: false,
    );
  }
}

// class _InValidQuery extends SpecialText {
//   _InValidQuery(String startFlag, this.start, this.controller,
//       TextStyle? textStyle, this.blacklisted)
//       : super(
//           startFlag,
//           '',
//           textStyle!.copyWith(decoration: TextDecoration.lineThrough) ??
//               TextStyle(),
//         );
//
//   final TextEditingController controller;
//   final bool blacklisted;
//   final int start;
//
//   @override
//   InlineSpan finishText() {
//     return ExtendedWidgetSpan(
//       alignment: PlaceholderAlignment.middle,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 4.0),
//         child: Material(
//             borderRadius: AppThemeBorderRadius.smallBorderRadius,
//             color: blacklisted ? Colors.red : AppColor.grey3,
//             child: InkWell(
//               borderRadius: AppThemeBorderRadius.smallBorderRadius,
//               onTap: () {
//                 if (!toString().trim().startsWith('-'))
//                   controller.text = controller.text.replaceFirst(
//                       RegExp('(?!-)(?:(${toString().trim()}))'), '');
//                 else
//                   controller.text =
//                       controller.text.replaceFirst(toString().trim(), '');
//                 controller.selection = TextSelection.fromPosition(
//                   TextPosition(offset: controller.text.length),
//                 );
//                 if (controller.text.trim().isEmpty)
//                   controller.text = controller.text.trim();
//                 HapticFeedback.vibrate();
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     top: 2.0, left: 6, right: 6, bottom: 4),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Flexible(
//                         child: RichText(
//                       text: TextSpan(
//                           style: textStyle.copyWith(fontSize: 14),
//                           children: [
//                             TextSpan(
//                                 text: toString()
//                                         .trim()
//                                         .replaceAll('"', '')
//                                         .split(':')
//                                         .first +
//                                     ' ',
//                                 style: TextStyle(fontWeight: FontWeight.bold)),
//                             TextSpan(
//                                 text: toString()
//                                     .trim()
//                                     .replaceAll('"', '')
//                                     .split(':')
//                                     .last),
//                           ]),
//                     )),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     ClipOval(
//                       child: Container(
//                         color: Colors.white,
//                         child: Icon(
//                           Icons.close_rounded,
//                           color: blacklisted ? Colors.red : AppColor.grey3,
//                           size: 12,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )),
//       ),
//       start: start,
//       actualText: toString(),
//       deleteAll: false,
//     );
//   }
// }

class SearchData {
  final String query;
  final List<String> filterStrings;
  final SearchFilters? searchFilters;
  final List<String> _defaultFilters;
  final bool multiType;
  final String sort;
  SearchData({
    this.query = '',
    this.filterStrings = const [],
    this.searchFilters,
    this.sort = 'best',
    bool multiType = false,
    List<String> defaultHiddenFilters = const [],
  })  : _defaultFilters = defaultHiddenFilters,
        this.multiType = searchFilters == null ? true : multiType;

  @override
  String toString() {
    return query.trim() + ' ' + filterStrings.join(' ').trim() + ' ';
  }

  String? get getSort => sort != 'best' ? sort.split('-').first : null;

  bool? get isSortAsc => sort != 'best' ? sort.split('-').last == 'asc' : null;

  bool get isActive => toString().trim().isNotEmpty;

  String toQuery() {
    return query.trim() +
        ' ' +
        _defaultFilters.join(' ').trim() +
        ' ' +
        filterStrings.join(' ').trim();
  }

  SearchData get cleared => copyWith(
      query: '', filterStrings: [], sort: 'best', searchFilters: searchFilters);

  SearchData copyWith(
      {String? query,
      List<String>? filterStrings,
      List<SearchQuery>? filters,
      SearchFilters? searchFilters,
      String? sort}) {
    return SearchData(
        query: query ?? this.query,
        filterStrings: filterStrings ?? this.filterStrings,
        defaultHiddenFilters: _defaultFilters,
        multiType: multiType,
        sort: sort ?? this.sort,
        searchFilters: searchFilters ?? this.searchFilters);
  }
}
