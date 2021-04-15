import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/custom_expand_tile.dart';
import 'package:onehub/common/search_overlay/search_overlay.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class SearchBar extends StatefulWidget {
  final String? message;
  final String _prompt;
  final SearchData? searchData;
  final bool updateBarOnChange;
  final ValueChanged<SearchData> onSubmit;
  final Color backgroundColor;
  final String _heroTag;
  final List<String>? applyFiltersOnOpen;
  final ValueChanged<String>? onSortChanged;

  SearchBar(
      {this.message,
      String? prompt,
      this.searchData,
      String? heroTag,
      this.updateBarOnChange = true,
      this.applyFiltersOnOpen,
      this.onSortChanged,
      this.backgroundColor = AppColor.onBackground,
      required this.onSubmit,
      Key? key})
      : _heroTag = heroTag ?? 'search_bar',
        _prompt = prompt ?? 'Search or Jump to...',
        super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  SearchData? searchData;

  @override
  void initState() {
    searchData = widget.searchData;
    super.initState();
  }

  Map<String, String> getWithoutValue(String exclude, Map<String, String> map) {
    Map<String, String> tMap = {};
    map.forEach((key, value) {
      if (key != exclude) tMap.addAll({key: value});
    });
    return tMap;
  }

  void changeExpanded() {
    setState(() {
      expanded = !expanded;
    });
  }

  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget._heroTag,
      child: Padding(
        padding: searchData?.isActive ?? false
            ? const EdgeInsets.all(8.0)
            : EdgeInsets.zero,
        child: Column(
          children: [
            Material(
              elevation: 2,
              borderRadius: searchData?.searchFilters != null
                  // && searchData?.isActive == true
                  ? BorderRadius.only(
                      topLeft: AppThemeBorderRadius.medBorderRadius.topLeft,
                      topRight: AppThemeBorderRadius.medBorderRadius.topRight)
                  : AppThemeBorderRadius.medBorderRadius,
              color: searchData?.isActive ?? false
                  ? AppColor.accent
                  : widget.backgroundColor,
              child: InkWell(
                borderRadius: AppThemeBorderRadius.medBorderRadius,
                onTap: () {
                  AutoRouter.of(context).push(SearchOverlayScreenRoute(
                      message: widget.message,
                      searchData: searchData != null
                          ? searchData!.isActive
                              ? searchData!
                              : searchData!.copyWith(
                                  filterStrings: widget.applyFiltersOnOpen)
                          : SearchData(),
                      heroTag: widget._heroTag,
                      onSubmit: (data) {
                        if (widget.updateBarOnChange)
                          setState(() {
                            searchData = data;
                          });
                        widget.onSubmit(data);
                      }));
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: searchData?.isActive ?? false
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (searchData!.query.trim().isNotEmpty)
                                      Flexible(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Icon(
                                                LineIcons.search,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                  'Searching for "${searchData!.query.trim()}"'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (searchData!.filterStrings.isNotEmpty &&
                                        searchData!.query.trim().isNotEmpty)
                                      Divider(
                                        color: Colors.white,
                                        thickness: 0.6,
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Wrap(
                                        children: List.generate(
                                            searchData!.filterStrings.length,
                                            (index) => Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle1,
                                                          children: [
                                                            TextSpan(
                                                                text: searchData!
                                                                        .filterStrings[
                                                                            index]
                                                                        .trim()
                                                                        .replaceAll(
                                                                            '"',
                                                                            '')
                                                                        .split(
                                                                            ':')
                                                                        .first +
                                                                    ' ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            TextSpan(
                                                                text: searchData!
                                                                        .filterStrings[
                                                                            index]
                                                                        .trim()
                                                                        .replaceAll(
                                                                            '"',
                                                                            '')
                                                                        .split(
                                                                            ':')
                                                                        .last +
                                                                    '${index == searchData!.filterStrings.length - 1 ? '' : ', '} '),
                                                          ]),
                                                    ),
                                                  ],
                                                )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    setState(() {
                                      searchData = searchData!.cleared;
                                    });
                                    widget.onSubmit(searchData!.cleared);
                                  })
                            ],
                          )
                        : Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  LineIcons.search,
                                  color: AppColor.grey3,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget._prompt,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color:
                                              AppColor.grey3.withOpacity(0.7)),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
            if (searchData?.searchFilters != null
            // && searchData?.isActive == true
            )
              Material(
                color: AppColor.background,
                borderRadius: BorderRadius.only(
                    bottomLeft: AppThemeBorderRadius.medBorderRadius.bottomLeft,
                    bottomRight:
                        AppThemeBorderRadius.medBorderRadius.bottomRight),
                child: CustomExpandTile(
                  title: Text(searchData!
                          .searchFilters!.sortOptions[searchData!.sort] ??
                      'Best Match'),
                  expanded: expanded,
                  child: Column(
                    children: getWithoutValue(searchData!.sort,
                            widget.searchData!.searchFilters!.sortOptions)
                        .entries
                        .map((e) {
                      return ListTile(
                        title: Text(e.value),
                        onTap: () {
                          setState(() {
                            searchData = searchData!.copyWith(sort: e.key);
                          });
                          widget.onSubmit(searchData!);
                          changeExpanded();
                        },
                      );
                    }).toList(),
                  ),
                  onTap: () {
                    changeExpanded();
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
