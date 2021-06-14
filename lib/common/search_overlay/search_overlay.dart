import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/custom_expand_tile.dart';
import 'package:dio_hub/common/misc/overlay_menu_widget.dart';
import 'package:dio_hub/common/misc/user_search_dropdown.dart';
import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/search_overlay/range_picker.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/text_field_themes.dart';
import 'package:dio_hub/utils/string_compare.dart';
import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class SearchOverlayScreen extends StatefulWidget {
  final String? message;
  final ValueChanged<SearchData> onSubmit;
  final String heroTag;
  final SearchData searchData;
  final bool multiHero;
  const SearchOverlayScreen(this.searchData,
      {this.message,
      this.heroTag = 'search_bar',
      required this.multiHero,
      required this.onSubmit,
      Key? key})
      : super(key: key);
  @override
  _SearchOverlayScreenState createState() => _SearchOverlayScreenState();
}

class _SearchOverlayScreenState extends State<SearchOverlayScreen> {
  late SearchData searchData;
  final OverlayController infoOverlay = OverlayController();

  @override
  void initState() {
    searchData = widget.searchData;
    if (searchData.searchFilters == null) {
      searchData =
          searchData.copyWith(searchFilters: SearchFilters.repositories());
    }
    super.initState();
  }

  bool get isEmpty =>
      searchData.query.trim().isEmpty && searchData.visibleStrings.isEmpty;

  bool get isValid {
    bool isValid = false;
    for (String element in searchData.visibleStrings) {
      SearchQuery query =
          searchData.searchFilters!.queryFromString(element.split(':').first)!;
      if (query.qualifierQuery) isValid = true;
    }
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
      case SearchType.issuesPulls:
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
          backgroundColor:
              Provider.of<PaletteSettings>(context).currentSetting.background,
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
                          searchData,
                          multiHero: widget.multiHero,
                          heroTag: widget.heroTag,
                          onSubmit: (data) {
                            if (isValid) {
                              Navigator.pop(context);
                              widget.onSubmit(searchData);
                            }
                          },
                          onChanged: (data) {
                            setState(() {
                              searchData = data;
                            });
                          },
                          message: widget.message,
                        ),
                      ),
                    ),
                    if (widget.searchData.multiType)
                      const Divider(
                        height: 0,
                      ),
                    if (widget.searchData.multiType)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: CustomExpandTile(
                          title: Text(
                            'Searching in ${searchTypeValues.reverse![searchData.searchFilters!.searchType]}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            setState(() {
                              expanded = !expanded;
                            });
                          },
                          child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return RadioListTile(
                                  activeColor:
                                      Provider.of<PaletteSettings>(context)
                                          .currentSetting
                                          .accent,
                                  groupValue:
                                      searchData.searchFilters!.searchType,
                                  value: searchTypeValues.map.values
                                      .toList()[index],
                                  onChanged: (value) {
                                    setState(() {
                                      searchData = searchData.copyWith(
                                          searchFilters: getFilters(
                                              searchTypeValues.map.values
                                                  .toList()[index]));
                                      expanded = !expanded;
                                    });
                                  },
                                  title: Text(
                                    searchTypeValues.map.keys.toList()[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: searchTypeValues.map.keys.length),
                          expanded: expanded,
                        ),
                      ),
                    const SizedBox(
                      height: 250,
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
                    heightMultiplier: isKeyboardVisible ? 0.3 : 0.5,
                    childAnchor: Alignment.topCenter,
                    portalAnchor: Alignment.bottomCenter,
                    overlay: Material(
                      color: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .onBackground,
                      borderRadius: AppThemeBorderRadius.medBorderRadius,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'How to format your filters',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Material(
                                elevation: 2,
                                type: MaterialType.circle,
                                color: Provider.of<PaletteSettings>(context)
                                    .currentSetting
                                    .onBackground,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    iconSize: 20,
                                    onPressed: () {
                                      infoOverlay.tapped();
                                    },
                                    icon: const Icon(LineIcons.info),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Hero(
                            tag: 'homeNavButton',
                            child: MaterialButton(
                              elevation: 2,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Provider.of<PaletteSettings>(context)
                                  .currentSetting
                                  .onBackground,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('Back'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Hero(
                            tag: 'searchNavButton',
                            child: MaterialButton(
                              elevation: 2,
                              onPressed: isValid || isEmpty
                                  ? () {
                                      Navigator.pop(context);
                                      widget.onSubmit(searchData);
                                    }
                                  : null,
                              color: Provider.of<PaletteSettings>(context)
                                  .currentSetting
                                  .onBackground,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('Search'),
                                  ],
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
  final SearchData searchData;
  final String heroTag;
  final String? message;
  final ValueChanged<SearchData> onChanged;
  final ValueChanged<void> onSubmit;
  final bool multiHero;
  const _SearchBar(this.searchData,
      {this.message,
      required this.multiHero,
      required this.onChanged,
      required this.onSubmit,
      required this.heroTag});
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  FocusNode searchNode = FocusNode();
  late TextEditingController controller;
  late SearchData searchData;
  OverlayController suggestionsOverlayController = OverlayController();
  Widget overlayWidget = Container();

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
              tag: widget.multiHero
                  ? widget.heroTag + searchData.isActive.toString()
                  : widget.heroTag,
              child: Material(
                color: Colors.transparent,
                child: ExtendedTextField(
                  controller: controller,
                  maxLines: 10,
                  focusNode: searchNode,
                  minLines: 1,
                  onChanged: (pattern) {
                    // Handle cases for when the enter key is pressed.
                    if (pattern.contains('\n')) {
                      // Don't let {\n} enter the text.
                      controller.text = controller.text.replaceAll('\n', '');
                      // If the last char is not a space, enter a space.
                      if (!controller.text.endsWith(' ')) {
                        controller.text = controller.text + ' ';
                      } else {
                        _parseQuery(pattern);
                        widget.onSubmit(null);
                      }
                      // Move the text controller to end.
                      _moveControllerToEnd();
                    }
                    // Trim any white spaces.
                    if (pattern.trim().isEmpty) {
                      controller.text = controller.text.trim();
                    }
                    // Parse query for filters.
                    _parseQuery(pattern);
                    // Show suggestions to the user.
                    _suggestions(pattern);
                  },
                  specialTextSpanBuilder: _TextSpanBuilder(
                      widget.searchData.searchFilters!, controller,
                      context: context, onChanged: (string) {
                    controller.text = string;
                    _parseQuery(string);
                  }),
                  decoration: TextFieldTheme.inputDecoration(
                      hintText: widget.message,
                      context: context,
                      labelText: 'Searching For',
                      focusNode: searchNode),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: CustomExpandTile(
              title: const Text(
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
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        addString(
                            widget.searchData.searchFilters!
                                    .whiteListedQueries[index].query +
                                ':',
                            addSpaceAtEnd: false,
                            spaceAtStart: true);
                        setState(() {
                          expanded = false;
                        });
                        searchNode.requestFocus();
                      },
                      title: Text(
                        widget.searchData.searchFilters!
                            .whiteListedQueries[index].query,
                        // style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: widget
                      .searchData.searchFilters!.whiteListedQueries.length),
            ),
          ),
          SizeExpandedSection(
            expand: controller.text.trim().isNotEmpty,
            child: Column(
              children: [
                const Divider(
                  height: 8,
                  endIndent: 8,
                  indent: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .onBackground,
                    onPressed: () {
                      setState(() {
                        controller.text = '';
                      });
                      widget.onChanged(searchData.cleared);
                    },
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Tap to Clear'),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getFocus() async {
    // Todo: Try new speed here.
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        searchNode.requestFocus();
      });
    }
  }

  void addString(
    String data, {
    bool addSpaceAtEnd = true,
    bool spaceAtStart = false,
    bool addQuotesAtEnd = false,
    bool addQuotesAround = false,
    String remove = '',
  }) {
    // Remove the last [remove.length] numbers of chars.
    controller.text =
        controller.text.substring(0, controller.text.length - remove.length);
    // Add new text according to the parameters.
    controller.text = controller.text +
        '${spaceAtStart ? ' ' : ''}${addQuotesAround ? '"' : ''}$data${addQuotesAround ? '"' : ''}${addSpaceAtEnd ? ' ' : ''}' +
        (addQuotesAtEnd ? '""' : '');
    // Move controller to end, or end-1 if quotes were added.
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

  // Is the end the same as the given string.
  bool isEndSame(String initial, String part) {
    return initial.substring(initial.length - part.length) == part;
  }

  // Get all matches in a string from a certain Regexp.
  List<String> getMatches(RegExp regexp, String pattern) {
    List<String> matches = [];
    pattern.splitMapJoin(regexp, onMatch: (Match m) {
      matches.add(m.group(0)!);
      return m.group(0)!;
    });
    return matches;
  }

  // Show a list dropdown for suggestions.
  Widget list(int length, builder, {Key? key}) {
    return SizeExpandedSection(
      key: key,
      child: Material(
        color:
            Provider.of<PaletteSettings>(context).currentSetting.onBackground,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        elevation: 8,
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return builder(context, index);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 0,
              );
            },
            itemCount: length),
      ),
    );
  }

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

    // Handle case of number and date ranges with the bigger value before.
    pattern.splitMapJoin(widget.searchData.searchFilters!.allValidQueriesRegexp,
        onMatch: (Match m) {
      String string = m[0]!;
      if (widget.searchData.searchFilters!.dateQRegExp!.hasMatch(string)) {
        string = m[0]!.splitMapJoin(
            widget.searchData.searchFilters!.dateQRegExp!, onMatch: (Match m) {
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
      } else if (widget.searchData.searchFilters!.numberQRegExp!
          .hasMatch(string)) {
        string = string
            .splitMapJoin(widget.searchData.searchFilters!.numberQRegExp!,
                onMatch: (Match m) {
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
      }

      filterStrings.add(string);
      filters.add(widget.searchData.searchFilters!
          .queryFromString(string.split(':').first)!);
      return '';
    });

    // Remove all invalid queries from the string.
    pattern = pattern.replaceAll(
        widget.searchData.searchFilters!.allInvalidQueriesRegExp, '');

    // Convert all extra spaces to just a single space.
    pattern = pattern.replaceAll(RegExp('(\\s+)'), ' ');
    // Send the new [SearchData] back.
    widget.onChanged(searchData.copyWith(
      query: pattern,
      filterStrings: filterStrings,
    ));
  }

  void _suggestions(String pattern) {
    // Close any previous overlays.
    _closeOverlay();
    // Get matches on the option queries on the supplied text.
    if (controller.selection.baseOffset == controller.text.length) {
      // Get all invalid or valid queries in the string.
      List<String> matches = getMatches(
          RegExp(
              '${widget.searchData.searchFilters!.allValidQueriesRegexp.pattern}|${widget.searchData.searchFilters!.allInvalidQueriesRegExp.pattern}'),
          pattern);
      // Current typed data of the latest filter.
      String typedData = '';
      // Current latest  query.
      SearchQuery? query;
      // Check if any of the matches above are the query currently being typed.
      for (String element in matches) {
        if (isEndSame(pattern, element)) {
          typedData = element.substring(0).split(':')[1];
          String queryString = element.split(':').first;
          if (queryString.startsWith('-')) {
            queryString = queryString.substring(1);
          }
          query = widget.searchData.searchFilters!.queryFromString(queryString);
        }
      }
      // Get all completed valid queries.
      List<String?> completedQueries = getMatches(
          RegExp(
              '${widget.searchData.searchFilters!.validSensitiveQueriesRegExp.pattern}|${widget.searchData.searchFilters!.invalidSensitiveQueriesRegExp.pattern}|${widget.searchData.searchFilters!.validBasicQueriesRegExp.pattern}'),
          pattern);
      // Check if the last query has been completed.
      bool isLastQueryComplete = completedQueries.isNotEmpty &&
          isEndSame(pattern, completedQueries.last!);
      // Show filter suggestions if the last filter was not complete.
      if (!isLastQueryComplete) {
        List<String> filteredOptions = [];
        // Last filter being typed.
        typedData = pattern.split(' ').last;
        // Remove the '-' from the case.
        if (typedData.startsWith('-')) typedData = typedData.substring(1);
        if (typedData.isNotEmpty) {
          for (String element
              in widget.searchData.searchFilters!.whiteListedQueriesStrings) {
            if (element.startsWith(typedData)) filteredOptions.add(element);
          }
          // Show overlay with the filtered options.
          _showOverlay(list(filteredOptions.length, (context, index) {
            return ListTile(
              onTap: () {
                // Get query info from the string.
                SearchQuery query = widget.searchData.searchFilters!
                    .queryFromString(filteredOptions[index])!;
                // Add string to text on tap, with quotes at the end if it is
                // a spaced string with no auto complete options.
                addString(filteredOptions[index] + ':',
                    addQuotesAtEnd: query.options == null &&
                        query.type == QueryType.spacedString,
                    addSpaceAtEnd: false,
                    remove: typedData);
              },
              title: Text(
                filteredOptions[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }, key: ValueKey(typedData)));
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
          !typedData.endsWith(' ')) {
        _showOverlay(SizeExpandedSection(
          child: UserSearchDropdown(
            typedData,
            onSelected: (data) {
              addString(data, remove: typedData);
            },
            type: query!.type,
          ),
        ));
      } else if (query?.options?.keys != null) {
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
        }, key: ValueKey(typedData)));
      }
    }
  }
}

class _TextSpanBuilder extends SpecialTextSpanBuilder {
  final BuildContext context;
  _TextSpanBuilder(this.searchFilters, this.controller,
      {required this.onChanged, required this.context})
      : patternMap = {
          searchFilters.validSensitiveQueriesRegExp: TextStyle(
            color: Provider.of<PaletteSettings>(context)
                .currentSetting
                .elementsOnColors,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
          searchFilters.validBasicQueriesRegExp: TextStyle(
            color: Provider.of<PaletteSettings>(context)
                .currentSetting
                .elementsOnColors,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        },
        blacklistPatternMap = {
          searchFilters.invalidSensitiveQueriesRegExp: TextStyle(
              color:
                  Provider.of<PaletteSettings>(context).currentSetting.faded3,
              decoration: TextDecoration.combine([TextDecoration.lineThrough])),
          searchFilters.invalidBasicQueriesRegExp: TextStyle(
              color:
                  Provider.of<PaletteSettings>(context).currentSetting.faded3,
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
      data.splitMapJoin(RegExp(searchFilters.allValidQueriesRegexp.pattern),
          onMatch: (Match m) {
        inlineList.add(
          _ValidQuery(m[0]!, controller, textStyle, context: context,
              onChanged: (string) {
            onChanged(string);
          }).finishText(),
        );
        return '';
      }, onNonMatch: (String string) {
        string.splitMapJoin(
            RegExp(SearchFilters.notOperatorRegExp.pattern +
                '|' +
                SearchFilters.andOperatorRegExp.pattern +
                '|' +
                SearchFilters.orOperatorRegExp.pattern), onMatch: (Match m) {
          TextStyle _textStyle = textStyle!;
          if (SearchFilters.notOperatorRegExp.hasMatch(m[0]!)) {
            _textStyle = _textStyle.copyWith(
                color:
                    Provider.of<PaletteSettings>(context).currentSetting.red);
          } else if (SearchFilters.orOperatorRegExp.hasMatch(m[0]!)) {
            _textStyle = _textStyle.copyWith(color: Colors.amber);
          } else if (SearchFilters.andOperatorRegExp.hasMatch(m[0]!)) {
            _textStyle = _textStyle.copyWith(
                color: Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .accent);
          }
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
      {required this.onChanged, required this.context})
      : super(
          startFlag,
          '',
          textStyle ?? const TextStyle(),
        );
  final BuildContext context;

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
            color: toString().startsWith('-')
                ? Provider.of<PaletteSettings>(context).currentSetting.red
                : Provider.of<PaletteSettings>(context).currentSetting.accent,
            child: InkWell(
              borderRadius: AppThemeBorderRadius.smallBorderRadius,
              onTap: () {
                if (!toString().trim().startsWith('-')) {
                  onChanged(controller.text.replaceFirst(
                      RegExp('(?!-)(?:(${toString().trim()}))'), ''));
                } else {
                  onChanged(
                      controller.text.replaceFirst(toString().trim(), ''));
                }

                controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller.text.length),
                );
                if (controller.text.trim().isEmpty) {
                  onChanged(controller.text.trim());
                }
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: toString()
                                    .trim()
                                    .replaceAll('"', '')
                                    .split(':')
                                    .last),
                          ]),
                    )),
                    const SizedBox(
                      width: 4,
                    ),
                    ClipOval(
                      child: Container(
                        color: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .elementsOnColors,
                        child: Icon(
                          Icons.close_rounded,
                          color: toString().startsWith('-')
                              ? Provider.of<PaletteSettings>(context)
                                  .currentSetting
                                  .red
                              : Provider.of<PaletteSettings>(context)
                                  .currentSetting
                                  .accent,
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

class SearchData {
  /// Current query info without filters.
  final String query;

  /// List of all applied filters.
  final List<String> filterStrings;

  /// Info about the kind of [SearchFilters] this data associates with.
  final SearchFilters? searchFilters;

  /// Default filters that will be applied to the query without being visible.
  final List<String> _defaultFilters;

  /// Quick filters to show on the search bar.
  final List<String> quickFilters;

  /// Multi type query for universal search bars.
  final bool multiType;

  /// Current sort setting, defaults to 'best', which returns null on being queried.
  final String sort;
  SearchData({
    this.query = '',
    this.quickFilters = const [],
    this.filterStrings = const [],
    this.searchFilters,
    this.sort = 'best',
    bool multiType = false,
    List<String> defaultHiddenFilters = const [],
  })  : _defaultFilters = defaultHiddenFilters,
        multiType = searchFilters == null ? true : multiType;

  /// Return string of the query without the default filters.
  @override
  String toString() {
    return query.trim() + ' ' + filterStrings.join(' ').trim() + ' ';
  }

  /// Return string of the query with the default filters.
  String get toQuery =>
      query.trim() +
      ' ' +
      _defaultFilters.join(' ').trim() +
      ' ' +
      filterStrings.join(' ').trim();

  /// Get current sort setting. Returns null if it is "best".
  String? get getSort => sort != 'best' ? sort.split('-').first : null;

  /// Is sort setting ascending.
  bool? get isSortAsc => sort != 'best' ? sort.split('-').last == 'asc' : null;

  /// If search is active, i.e., [toString()] is not empty.
  bool get isActive => toString().trim().isNotEmpty;

  /// All current filter strings.
  List<String> get visibleStrings => filterStrings;

  /// Get if a quick filter is currently in the filters.
  String? get activeQuickFilter {
    List<String> active = [];
    for (String element in filterStrings) {
      for (String e in quickFilters) {
        if (StringFunctions(e).isStringEqual(element)) active.add(element);
      }
    }
    // Return null if more than one.
    if (active.length == 1) return active.first;
  }

  /// If current query is valid.
  bool get isValid => toQuery.trim().isNotEmpty;

  /// Clear all search related data.
  SearchData get cleared => copyWith(
      query: '',
      filterStrings: [],
      sort: 'best',
      searchFilters: multiType ? null : searchFilters);

  /// Replace the quick filters in all the filters and add a new one.
  List<String> _quickFilterChange(String quickFilter, List<String> allFilters) {
    List<String> filters = allFilters.toList();
    filters.removeWhere((element) {
      bool exists = false;
      for (String e in quickFilters) {
        if (StringFunctions(e).isStringEqual(element)) exists = true;
      }
      return exists;
    });
    filters.add(quickFilter);
    return filters;
  }

  /// Copy search data with custom data.
  SearchData copyWith(
      {String? query,
      List<String>? filterStrings,
      List<String>? quickFilters,
      String? quickFilter,
      SearchFilters? searchFilters,
      String? sort}) {
    List<String> filters = filterStrings ?? this.filterStrings;
    // If a new quick filter is supplied, replace all current ones in the filters.
    if (quickFilter != null) filters = _quickFilterChange(quickFilter, filters);
    return SearchData(
        query: query ?? this.query,
        filterStrings: filters,
        defaultHiddenFilters: _defaultFilters,
        multiType: multiType,
        quickFilters: quickFilters ?? this.quickFilters,
        sort: sort ?? this.sort,
        searchFilters: searchFilters ?? this.searchFilters);
  }
}
