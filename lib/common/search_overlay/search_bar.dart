import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/custom_expand_tile.dart';
import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/utils/string_compare.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SearchBar extends StatefulWidget {
  final String? message;
  final String _prompt;
  final SearchData? searchData;
  final bool updateBarOnChange;
  final ValueChanged<SearchData> onSubmit;
  final Color backgroundColor;
  final String _heroTag;
  final Map<String, String>? quickFilters;
  final Map<String, String>? quickOptions;
  final ValueChanged<String>? onSortChanged;
  final bool isPinned;
  final Widget? trailing;

  const SearchBar(
      {this.message,
      String? prompt,
      this.quickOptions,
      this.searchData,
      this.trailing,
      String? heroTag,
      this.quickFilters,
      this.updateBarOnChange = true,
      this.isPinned = false,
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
    if (searchData?.searchFilters != null && widget.quickFilters != null) {
      quickActionsAnim = true;
    }
    if (widget.quickFilters != null) {
      searchData = searchData?.copyWith(
          quickFilters: widget.quickFilters?.keys.toList());
    }
    quickActionsVisible = widget.quickOptions == null;
    super.initState();
  }

  Map<String, String> getWithoutValue(
      String? exclude, Map<String, String> map) {
    Map<String, String> tMap = {};
    map.forEach((key, value) {
      if (key != exclude) tMap.addAll({key: value});
    });
    return tMap;
  }

  String getQuickFilterTitle(
      Map<String, String> qFilters, String? activeFilter) {
    String qFilter = 'Quick Filters';
    qFilters.forEach((key, value) {
      if (StringFunctions(key).isStringEqual(activeFilter)) {
        qFilter = qFilters[key]!;
      }
    });
    return qFilter;
  }

  void changeSortExpanded({bool? expand}) {
    if (expand != null) {
      setState(() {
        sortExpanded = expand;
      });
    } else {
      setState(() {
        sortExpanded = !sortExpanded;
      });
    }
  }

  void changeQuickFiltersExpanded({bool? expand}) {
    if (expand != null) {
      setState(() {
        quickFiltersExpanded = expand;
      });
    } else {
      setState(() {
        quickFiltersExpanded = !quickFiltersExpanded;
      });
    }
  }

  @override
  didUpdateWidget(oldWidget) {
    searchData = widget.searchData;
    super.didUpdateWidget(oldWidget);
  }

  bool quickActionsAnim = false;
  late bool quickActionsVisible;
  bool sortExpanded = false;
  bool quickFiltersExpanded = false;
  @override
  Widget build(BuildContext context) {
    Widget quickActionsExpandAnim(context, expand, child) => quickActionsAnim
        ? SizeExpandedSection(
            axis: Axis.horizontal,
            expand: expand,
            child: child,
          )
        : child;
    Widget quickActions(context) => Material(
          color: AppColor.background,
          borderRadius: BorderRadius.only(
              bottomLeft: AppThemeBorderRadius.medBorderRadius.bottomLeft,
              bottomRight: AppThemeBorderRadius.medBorderRadius.bottomRight),
          child: Column(
            children: [
              const Divider(
                height: 0,
              ),
              Visibility(
                visible: quickActionsVisible,
                replacement: ListTile(
                  title: Text(
                    'Sort & Quick Filters',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: sortExpanded ? AppColor.accent : Colors.white),
                  ),
                  onTap: () {
                    setState(() {
                      quickActionsVisible = true;
                    });
                  },
                  trailing: const Icon(
                    Icons.arrow_drop_down,
                    color: AppColor.grey3,
                  ),
                ),
                child: SizeExpandedSection(
                  expand: quickActionsVisible,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: !quickFiltersExpanded ? 1 : 0,
                            child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: !quickFiltersExpanded
                                        ? 1000
                                        : MediaQuery.of(context).size.width *
                                            0.45),
                                child: quickActionsExpandAnim(
                                    context,
                                    !quickFiltersExpanded,
                                    CustomExpandTile(
                                      title: Text(
                                        searchData!.searchFilters!.sortOptions[
                                                searchData!.sort] ??
                                            'Best Match',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                color: sortExpanded
                                                    ? AppColor.accent
                                                    : Colors.white),
                                      ),
                                      expanded: sortExpanded,
                                      child: Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 1.0),
                                            child: Divider(
                                              height: 0,
                                            ),
                                          ),
                                          ListView.separated(
                                              separatorBuilder:
                                                  (context, index) {
                                                return const Divider(
                                                  height: 0,
                                                );
                                              },
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: getWithoutValue(
                                                      searchData!.sort,
                                                      widget
                                                          .searchData!
                                                          .searchFilters!
                                                          .sortOptions)
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  title: Text(
                                                    getWithoutValue(
                                                            searchData!.sort,
                                                            widget
                                                                .searchData!
                                                                .searchFilters!
                                                                .sortOptions)
                                                        .values
                                                        .toList()[index],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle2,
                                                  ),
                                                  onTap: () {
                                                    changeSortExpanded(
                                                        expand: false);
                                                    setState(() {
                                                      searchData = searchData!.copyWith(
                                                          sort: getWithoutValue(
                                                                  searchData!
                                                                      .sort,
                                                                  widget
                                                                      .searchData!
                                                                      .searchFilters!
                                                                      .sortOptions)
                                                              .keys
                                                              .toList()[index]);
                                                    });
                                                    widget
                                                        .onSubmit(searchData!);
                                                  },
                                                );
                                              }),
                                        ],
                                      ),
                                      onTap: () {
                                        changeSortExpanded();
                                      },
                                    ))),
                          ),
                          if (widget.quickFilters != null)
                            Flexible(
                              flex: !sortExpanded ? 1 : 0,
                              child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: !sortExpanded
                                          ? 1000
                                          : MediaQuery.of(context).size.width *
                                              0.45),
                                  child: quickActionsExpandAnim(
                                      context,
                                      !sortExpanded,
                                      CustomExpandTile(
                                        title: Text(
                                          getQuickFilterTitle(
                                              widget.quickFilters!,
                                              searchData!.activeQuickFilter),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(
                                                  color: quickFiltersExpanded
                                                      ? AppColor.accent
                                                      : Colors.white),
                                        ),
                                        expanded: quickFiltersExpanded,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(top: 1.0),
                                              child: Divider(
                                                height: 0,
                                              ),
                                            ),
                                            ListView.separated(
                                                separatorBuilder:
                                                    (context, index) {
                                                  return const Divider(
                                                    height: 0,
                                                  );
                                                },
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: getWithoutValue(
                                                        searchData!
                                                            .activeQuickFilter,
                                                        widget.quickFilters!)
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    title: Text(
                                                      getWithoutValue(
                                                              searchData!
                                                                  .activeQuickFilter,
                                                              widget
                                                                  .quickFilters!)
                                                          .values
                                                          .toList()[index],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2,
                                                    ),
                                                    onTap: () {
                                                      changeQuickFiltersExpanded(
                                                          expand: false);
                                                      setState(() {
                                                        searchData = searchData!.copyWith(
                                                            quickFilter: getWithoutValue(
                                                                    searchData!
                                                                        .activeQuickFilter,
                                                                    widget
                                                                        .quickFilters!)
                                                                .keys
                                                                .toList()[index]);
                                                      });
                                                      widget.onSubmit(
                                                          searchData!);
                                                    },
                                                  );
                                                }),
                                          ],
                                        ),
                                        onTap: () {
                                          changeQuickFiltersExpanded();
                                        },
                                      ))),
                            ),
                        ],
                      ),
                      if (widget.quickOptions != null)
                        Flexible(
                          child: SizeExpandedSection(
                            expand: !quickFiltersExpanded && !sortExpanded,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 1,
                                ),
                                const Divider(
                                  height: 0,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: widget.quickOptions!.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        CheckboxListTile(
                                            title: Text(
                                              widget.quickOptions!.values
                                                  .toList()[index],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2,
                                            ),
                                            activeColor: AppColor.accent,
                                            value: searchData!.filterStrings
                                                .contains(widget
                                                    .quickOptions!.keys
                                                    .toList()[index]),
                                            onChanged: (value) {
                                              List<String> filters = searchData!
                                                  .visibleStrings
                                                  .toList();
                                              if (value!) {
                                                filters.add(widget
                                                    .quickOptions!.keys
                                                    .toList()[index]);
                                              } else {
                                                filters.remove(widget
                                                    .quickOptions!.keys
                                                    .toList()[index]);
                                              }
                                              setState(() {
                                                searchData = searchData!
                                                    .copyWith(
                                                        filterStrings: filters);
                                              });
                                              widget.onSubmit(searchData!);
                                            }),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
    return Padding(
      padding: (searchData?.isActive ?? false) && !widget.isPinned
          ? const EdgeInsets.all(8.0)
          : EdgeInsets.zero,
      child: Column(
        children: [
          Material(
            color: widget.backgroundColor,
            borderRadius: widget.isPinned
                ? null
                : searchData?.searchFilters != null
                    // && searchData?.isActive == true
                    ? BorderRadius.only(
                        topLeft: AppThemeBorderRadius.medBorderRadius.topLeft,
                        topRight: AppThemeBorderRadius.medBorderRadius.topRight)
                    : AppThemeBorderRadius.medBorderRadius,
            child: InkWell(
              borderRadius: AppThemeBorderRadius.medBorderRadius,
              onTap: () {
                AutoRouter.of(context).push(SearchOverlayScreenRoute(
                    message: widget.message,
                    multiHero: widget.updateBarOnChange,
                    searchData: searchData != null ? searchData! : SearchData(),
                    heroTag: widget._heroTag,
                    onSubmit: (data) {
                      if (widget.updateBarOnChange) {
                        setState(() {
                          searchData = data;
                        });
                      }
                      widget.onSubmit(data);
                    }));
              },
              child: Column(
                children: [
                  if (searchData != null && (searchData?.isActive ?? false))
                    Material(
                      color: AppColor.accent,
                      borderRadius: widget.isPinned
                          ? null
                          : BorderRadius.only(
                              topRight: AppThemeBorderRadius
                                  .medBorderRadius.bottomLeft,
                              topLeft: AppThemeBorderRadius
                                  .medBorderRadius.bottomRight),
                      child: Padding(
                        padding: widget.isPinned
                            ? EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical:
                                    searchData!.visibleStrings.isNotEmpty &&
                                            searchData!.query.trim().isNotEmpty
                                        ? 8
                                        : 4)
                            : const EdgeInsets.all(8.0),
                        child: SizeExpandedSection(
                          child: Hero(
                            tag: widget._heroTag + 'true',
                            child: Material(
                              color: Colors.transparent,
                              child: _ActiveSearch(
                                searchData: searchData!,
                                trailing: widget.trailing,
                                onSubmit: (data) {
                                  setState(() {
                                    searchData = data;
                                  });
                                  widget.onSubmit(searchData!);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizeExpandedSection(
                    expand: !(searchData?.isActive ?? false),
                    child: Hero(
                      tag: widget.updateBarOnChange
                          ? widget._heroTag + 'false'
                          : widget._heroTag,
                      child: Material(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
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
                ],
              ),
            ),
          ),
          if ((searchData?.searchFilters != null ||
                  widget.quickFilters != null) &&
              !widget.isPinned)
            quickActions(context),
        ],
      ),
    );
  }
}

class _ActiveSearch extends StatelessWidget {
  final SearchData searchData;
  final Widget? trailing;
  final ValueChanged<SearchData> onSubmit;
  const _ActiveSearch(
      {required this.searchData,
      this.trailing,
      required this.onSubmit,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (searchData.query.trim().isNotEmpty)
                Flexible(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          LineIcons.search,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                      Flexible(
                        child:
                            Text('Searching for "${searchData.query.trim()}"'),
                      ),
                    ],
                  ),
                ),
              if (searchData.visibleStrings.isNotEmpty &&
                  searchData.query.trim().isNotEmpty)
                const Divider(
                  color: Colors.white,
                  thickness: 0.2,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Wrap(
                  children: List.generate(
                      searchData.visibleStrings.length,
                      (index) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RichText(
                                text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                    children: [
                                      TextSpan(
                                          text: searchData.visibleStrings[index]
                                                  .trim()
                                                  .replaceAll('"', '')
                                                  .split(':')
                                                  .first +
                                              ' ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: searchData.visibleStrings[index]
                                                  .trim()
                                                  .replaceAll('"', '')
                                                  .split(':')
                                                  .last +
                                              '${index == searchData.visibleStrings.length - 1 ? '' : ', '} '),
                                    ]),
                              ),
                            ],
                          )),
                ),
              ),
            ],
          ),
        ),
        trailing ??
            IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  onSubmit(searchData.cleared);
                })
      ],
    );
  }
}
