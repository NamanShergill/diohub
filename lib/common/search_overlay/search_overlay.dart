import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/overlay_menu_widget.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/common/typeahead_field.dart';
import 'package:onehub/common/user_search_dropdown.dart';
import 'package:onehub/controller/rich_text_controller.dart';
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
                      SizedBox(
                        width: 5,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          _navProvider.animateToPage(1);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Tap to Search',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Hero(
                tag: 'homeNavButton',
                child: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconButton(
                      iconSize: 30,
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
  late RichTextController controller;
  int qLength = 0;

  @override
  void initState() {
    initController();
    getFocus();
    searchNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void initController() {
    controller = RichTextController(
      patternMap: {
        widget.searchFilters.queriesRegExp: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ),
        widget.searchFilters.sensitiveQueriesOptionsRegExp: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ),
      },
      blacklistPatternMap: {
        widget.searchFilters.sensitiveQueriesRegExp: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.combine([TextDecoration.lineThrough])),
        widget.searchFilters.blacklistRegExp: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.combine([TextDecoration.lineThrough]),
        ),
      },
      wlMatches: (strings) {
        if (qLength != strings.length) {
          qLength = strings.length;
          HapticFeedback.vibrate();
        }
      },
    );
  }

  void getFocus() async {
    await Future.delayed(Duration(milliseconds: 500));
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
  }

  OverlayController filtersOverlayController = OverlayController();
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: TypeAheadField(
            suggestionsBoxVerticalOffset: 16,
            hideSuggestionsOnKeyboardHide: false,
            textFieldConfiguration: TextFieldConfiguration(
                style: TextStyle(color: Colors.white),
                controller: controller,
                focusNode: searchNode,
                maxLines: 10,
                minLines: 1,
                decoration: TextFieldTheme.inputDecoration(
                    hintText: widget.message,
                    icon: LineIcons.search,
                    labelText: 'Searching For',
                    focusNode: searchNode)),
            itemBuilder: (context, item) {
              return MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Builder(
                  builder: (context) {
                    if (item == 0)
                      return Material(
                        color: AppColor.onBackground,
                        borderRadius: AppThemeBorderRadius.medBorderRadius,
                        elevation: 8,
                        child: Container(
                          height: 200,
                        ),
                      );
                    else if (item is UserSuggestion)
                      return UserSearchDropdown(
                        item.query,
                        onSelected: (data) {
                          addString(data, remove: item.typedData);
                        },
                      );
                    else if (item is OptionsSuggestion)
                      return Material(
                        color: AppColor.onBackground,
                        borderRadius: AppThemeBorderRadius.medBorderRadius,
                        elevation: 8,
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  addString(item.results[index],
                                      spaceAtEnd: true, remove: item.typedData);
                                },
                                title: Text(item.results[index]),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: 0,
                              );
                            },
                            itemCount: item.results.length),
                      );
                    return Container();
                  },
                ),
              );
            },
            suggestionsCallback: (pattern) {
              List<String?> matches = [];
              // Get matches on the option queries on the supplied text.
              pattern.splitMapJoin(widget.searchFilters.sensitiveQueriesRegExp,
                  onMatch: (Match m) {
                matches.add(m.group(0));
                return m.group(0)!;
              });
              String typedData = '';
              SearchQuery? query;
              matches.forEach(
                (element) {
                  if (pattern.substring(pattern.length - element!.length) ==
                      element) {
                    typedData = element.split(':')[1];
                    query = widget.searchFilters
                        .queryFromString(element.split(':').first);
                  }
                },
              );
              if (query?.type == QueryType.number && (typedData.isEmpty))
                return [0, typedData];
              if (query?.type == QueryType.user && !typedData.endsWith(' '))
                return [UserSuggestion(typedData, typedData)];

              List<String> filteredOptions = [];
              if (query?.options?.keys != null)
                query?.options?.keys.toList().forEach((element) {
                  if (element.startsWith(typedData))
                    filteredOptions.add(element);
                });
              return query?.options?.keys != null
                  ? [OptionsSuggestion(filteredOptions, typedData)]
                  : <String>[];
            },
            keepSuggestionsOnSuggestionSelected: true,
            hideOnEmpty: true,
            hideOnLoading: true,
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
                borderRadius: AppThemeBorderRadius.medBorderRadius),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: OverlayMenuWidget(
              controller: filtersOverlayController,
              overlay: Container(
                width: _media.width * 0.6,
                padding: EdgeInsets.only(bottom: _media.height * 0.4, top: 16),
                child: Material(
                  color: AppColor.onBackground,
                  borderRadius: AppThemeBorderRadius.medBorderRadius,
                  elevation: 8,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            addString(
                                widget.searchFilters.whiteListedQueries[index]
                                        .query +
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

abstract class SuggestionInfo {
  final String typedData;
  SuggestionInfo(this.typedData);
}
