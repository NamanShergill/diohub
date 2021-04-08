import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/search_bar/filters.dart';
import 'package:onehub/controller/rich_text_controller.dart';
import 'package:onehub/providers/landing_navigation_provider.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:provider/provider.dart';

class SearchOverlayScreen extends StatefulWidget {
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Hero(
                        tag: 'search_bar',
                        child: Material(
                          color: Colors.transparent,
                          child: SearchBar(SearchFilters.repositories(
                              blacklist: [SearchQueries().repo])),
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

class SearchBar extends StatefulWidget {
  final SearchFilters searchFilters;
  SearchBar(this.searchFilters);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  FocusNode searchNode = FocusNode();
  late RichTextController controller;
  @override
  void initState() {
    controller = RichTextController(
      patternMap: {
        widget.searchFilters.queriesRegExp: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ),
        widget.searchFilters.optionQueriesRegExp: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ),
        widget.searchFilters.optionQueriesOnlyRegExp: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.combine([TextDecoration.lineThrough])),
        widget.searchFilters.blacklistRegExp: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.combine([TextDecoration.lineThrough]),
        ),
      },
    );
    getFocus();
    super.initState();
  }

  void getFocus() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      searchNode.requestFocus();
    });
  }

  bool isFiltersOpen = false;
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: TypeAheadField(
            suggestionsBoxVerticalOffset: 16,
            textFieldConfiguration: TextFieldConfiguration(
              style: TextStyle(color: Colors.white),
              controller: controller,
              focusNode: searchNode,
              maxLines: 10,
              minLines: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16),
                labelText: 'Searching for',
                fillColor: AppColor.onBackground,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    LineIcons.search,
                    color: searchNode.hasFocus
                        ? AppColor.grey3
                        : AppColor.grey3.withOpacity(0.7),
                  ),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: AppThemeBorderRadius.medBorderRadius),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.grey3),
                    borderRadius: AppThemeBorderRadius.medBorderRadius),
                labelStyle: TextStyle(color: AppColor.grey3),
                border: OutlineInputBorder(
                    borderRadius: AppThemeBorderRadius.medBorderRadius),
              ),
            ),
            itemBuilder: (context, String item) {
              return ListTile(
                title: Text(
                  '$item',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
            suggestionsCallback: (pattern) {
              List<String?> matches = [];
              pattern.splitMapJoin(widget.searchFilters.optionQueriesOnlyRegExp,
                  onMatch: (Match m) {
                matches.add(m.group(0));
                return m.group(0)!;
              });
              SearchQuery? query;
              matches.forEach(
                (element) {
                  if (pattern.substring(pattern.length - element!.length) ==
                          element &&
                      element.split(':')[1].isEmpty)
                    query = widget.searchFilters
                        .queryFromString(element.split(':').first);
                },
              );
              return query?.options?.keys ?? <String>[];
            },
            keepSuggestionsOnSuggestionSelected: true,
            hideOnEmpty: true,
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
                borderRadius: AppThemeBorderRadius.medBorderRadius),
            onSuggestionSelected: (String item) {
              controller.text = controller.text + item;
              controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length),
              );
              searchNode.requestFocus();
            },
          ),
        ),
        PortalEntry(
            visible: isFiltersOpen,
            portal: SizeExpandedSection(
              child: Container(
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
                            controller.text = controller.text +
                                '${controller.text.endsWith(' ') ? '' : ' '}' +
                                widget.searchFilters.whiteListedQueries[index]
                                    .query +
                                ':';
                            setState(
                              () {
                                isFiltersOpen = !isFiltersOpen;
                                controller.selection =
                                    TextSelection.fromPosition(
                                  TextPosition(offset: controller.text.length),
                                );
                                searchNode.requestFocus();
                              },
                            );
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
            ),
            childAnchor: Alignment.bottomLeft,
            portalAnchor: Alignment.topCenter,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isFiltersOpen = !isFiltersOpen;
                  });
                },
                icon: Icon(LineIcons.filter))),
      ],
    );
  }
}
