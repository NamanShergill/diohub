import 'package:auto_route/auto_route.dart';
import 'package:diohub/common/animations/size_expanded_widget.dart';
import 'package:diohub/common/misc/custom_expand_tile.dart';
import 'package:diohub/common/misc/round_button.dart';
import 'package:diohub/common/search_overlay/search_overlay.dart';
import 'package:diohub/routes/router.gr.dart';
import 'package:diohub/style/border_radiuses.dart';
import 'package:diohub/utils/string_compare.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    required this.onSubmit,
    required this.heroTag,
    this.message,
    final String? prompt,
    this.quickOptions,
    this.searchData,
    this.trailing,
    this.quickFilters,
    this.updateBarOnChange = true,
    this.isPinned = false,
    this.onSortChanged,
    this.backgroundColor,
    super.key,
  }) : _prompt = prompt ?? 'Search or Jump to...';
  final String? message;
  final String _prompt;
  final SearchData? searchData;
  final bool updateBarOnChange;
  final ValueChanged<SearchData> onSubmit;
  final Color? backgroundColor;
  final String heroTag;
  final Map<String, String>? quickFilters;
  final Map<String, String>? quickOptions;
  final ValueChanged<String>? onSortChanged;
  final bool isPinned;
  final Widget? trailing;

  @override
  AppSearchBarState createState() => AppSearchBarState();
}

class AppSearchBarState extends State<AppSearchBar> {
  SearchData? searchData;

  @override
  void initState() {
    searchData = widget.searchData;
    if (searchData?.searchFilters != null && widget.quickFilters != null) {
      quickActionsAnim = true;
    }
    if (widget.quickFilters != null) {
      searchData = searchData?.copyWith(
        quickFilters: widget.quickFilters?.keys.toList(),
      );
    }
    quickActionsVisible = widget.quickOptions == null;
    super.initState();
  }

  Map<String, String> getWithoutValue(
    final String? exclude,
    final Map<String, String> map,
  ) {
    final Map<String, String> tMap = <String, String>{};
    map.forEach((final String key, final String value) {
      if (key != exclude) {
        tMap.addAll(<String, String>{key: value});
      }
    });
    return tMap;
  }

  String getQuickFilterTitle(
    final Map<String, String> qFilters,
    final String? activeFilter,
  ) {
    String qFilter = 'Quick Filters';

    qFilters.forEach((final String key, final String value) {
      // print(key);
      // print(value);
      // print(activeFilter);
      if (StringFunctions(key).isStringEqual(activeFilter)) {
        qFilter = qFilters[key]!;
      }
    });
    return qFilter;
  }

  void changeSortExpanded({final bool? expand}) {
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

  void changeQuickFiltersExpanded({final bool? expand}) {
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
  void didUpdateWidget(final AppSearchBar oldWidget) {
    searchData = widget.searchData;
    super.didUpdateWidget(oldWidget);
  }

  bool quickActionsAnim = false;
  late bool quickActionsVisible;
  bool sortExpanded = false;
  bool quickFiltersExpanded = false;
  @override
  Widget build(final BuildContext context) {
    Widget quickActionsExpandAnim(
      final BuildContext context, {
      required final bool expand,
      required final Widget child,
    }) =>
        quickActionsAnim
            ? SizeExpandedSection(
                axis: Axis.horizontal,
                expand: expand,
                child: child,
              )
            : child;
    Widget quickActions(final BuildContext context) => Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Divider(
              height: 0,
            ),
            SizeSwitch(
              visible: quickActionsVisible,
              replacement: ListTile(
                title: Text(
                  'Sort & Quick Filters',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color:
                            sortExpanded ? context.colorScheme.primary : null,
                      ),
                ),
                onTap: () {
                  setState(() {
                    quickActionsVisible = true;
                  });
                },
                trailing: const Icon(
                  Icons.arrow_drop_down,
                  // color: Provider.of<PaletteSettings>(context)
                  //     .currentSetting
                  //     .faded3,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        flex: !quickFiltersExpanded ? 1 : 0,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: !quickFiltersExpanded
                                ? 1000
                                : MediaQuery.of(context).size.width * 0.45,
                          ),
                          child: quickActionsExpandAnim(
                            context,
                            expand: !quickFiltersExpanded,
                            child: CustomExpandTile(
                              title: Text(
                                searchData!.searchFilters!
                                        .sortOptions[searchData!.sort] ??
                                    'Best Match',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: sortExpanded
                                          ? context.colorScheme.primary
                                          : context.colorScheme.onSurface,
                                    ),
                              ),
                              expanded: sortExpanded,
                              onTap: () {
                                changeSortExpanded();
                              },
                              child: Column(
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(top: 1),
                                    child: Divider(
                                      height: 0,
                                    ),
                                  ),
                                  ListView.separated(
                                    separatorBuilder: (
                                      final BuildContext context,
                                      final int index,
                                    ) =>
                                        const Divider(
                                      height: 0,
                                    ),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: getWithoutValue(
                                      searchData!.sort,
                                      widget.searchData!.searchFilters!
                                          .sortOptions,
                                    ).length,
                                    itemBuilder: (
                                      final BuildContext context,
                                      final int index,
                                    ) =>
                                        ListTile(
                                      title: Text(
                                        getWithoutValue(
                                          searchData!.sort,
                                          widget.searchData!.searchFilters!
                                              .sortOptions,
                                        ).values.toList()[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      onTap: () {
                                        changeSortExpanded(
                                          expand: false,
                                        );
                                        setState(() {
                                          searchData = searchData!.copyWith(
                                            sort: getWithoutValue(
                                              searchData!.sort,
                                              widget.searchData!.searchFilters!
                                                  .sortOptions,
                                            ).keys.toList()[index],
                                          );
                                        });
                                        widget.onSubmit(searchData!);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (widget.quickFilters != null)
                        Flexible(
                          flex: !sortExpanded ? 1 : 0,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: !sortExpanded
                                  ? 1000
                                  : MediaQuery.of(context).size.width * 0.45,
                            ),
                            child: quickActionsExpandAnim(
                              context,
                              expand: !sortExpanded,
                              child: CustomExpandTile(
                                title: Text(
                                  getQuickFilterTitle(
                                    widget.quickFilters!,
                                    searchData!.activeQuickFilter,
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: quickFiltersExpanded
                                            ? context.colorScheme.primary
                                            : context.colorScheme.onSurface,
                                      ),
                                ),
                                expanded: quickFiltersExpanded,
                                onTap: () {
                                  changeQuickFiltersExpanded();
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.only(top: 1),
                                      child: Divider(
                                        height: 0,
                                      ),
                                    ),
                                    ListView.separated(
                                      separatorBuilder: (
                                        final BuildContext context,
                                        final int index,
                                      ) =>
                                          const Divider(
                                        height: 0,
                                      ),
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: getWithoutValue(
                                        searchData!.activeQuickFilter,
                                        widget.quickFilters!,
                                      ).length,
                                      itemBuilder: (
                                        final BuildContext context,
                                        final int index,
                                      ) =>
                                          ListTile(
                                        title: Text(
                                          getWithoutValue(
                                            searchData!.activeQuickFilter,
                                            widget.quickFilters!,
                                          ).values.toList()[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        onTap: () {
                                          changeQuickFiltersExpanded(
                                            expand: false,
                                          );
                                          setState(() {
                                            // print(
                                            //   getWithoutValue(
                                            //     searchData!.activeQuickFilter,
                                            //     widget.quickFilters!,
                                            //   ).keys.toList()[index],
                                            // );
                                            searchData = searchData!.copyWith(
                                              quickFilter: getWithoutValue(
                                                searchData!.activeQuickFilter,
                                                widget.quickFilters!,
                                              ).keys.toList()[index],
                                            );
                                          });
                                          widget.onSubmit(searchData!);
                                        },
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
                  if (widget.quickOptions != null)
                    Flexible(
                      child: SizeExpandedSection(
                        expand: !quickFiltersExpanded && !sortExpanded,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
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
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (
                                  final BuildContext context,
                                  final int index,
                                ) =>
                                    CheckboxListTile(
                                  title: Text(
                                    widget.quickOptions!.values.toList()[index],
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  // activeColor: context.colorScheme.primary,
                                  value: searchData!.filterStrings.contains(
                                    widget.quickOptions!.keys.toList()[index],
                                  ),
                                  onChanged: (final bool? value) {
                                    final List<String> filters =
                                        searchData!.visibleStrings.toList();
                                    if (value!) {
                                      filters.add(
                                        widget.quickOptions!.keys
                                            .toList()[index],
                                      );
                                    } else {
                                      filters.remove(
                                        widget.quickOptions!.keys
                                            .toList()[index],
                                      );
                                    }
                                    setState(() {
                                      searchData = searchData!.copyWith(
                                        filterStrings: filters,
                                      );
                                    });
                                    widget.onSubmit(searchData!);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            // borderRadius: medBorderRadius,
            onTap: () async {
              await AutoRouter.of(context).push(
                SearchOverlayRoute(
                  message: widget.message,
                  multiHero: widget.updateBarOnChange,
                  searchData: searchData != null ? searchData! : SearchData(),
                  heroTag: widget.heroTag,
                  onSubmit: (final SearchData data) {
                    if (widget.updateBarOnChange) {
                      setState(() {
                        searchData = data;
                      });
                    }
                    widget.onSubmit(data);
                  },
                ),
              );
            },
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (searchData != null && (searchData?.isActive ?? false))
                  Material(
                    borderRadius: widget.isPinned
                        ? null
                        : BorderRadius.vertical(top: bigBorderRadius.topRight),
                    color: context.colorScheme.primary,
                    child: Padding(
                      padding: widget.isPinned
                          ? EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: searchData!.visibleStrings.isNotEmpty &&
                                      searchData!.query.trim().isNotEmpty
                                  ? 8
                                  : 4,
                            )
                          : const EdgeInsets.all(8),
                      child: SizeExpandedSection(
                        child: Hero(
                          tag: '${widget.heroTag}true',
                          child: Material(
                            color: Colors.transparent,
                            child: _ActiveSearch(
                              searchData: searchData!,
                              trailing: widget.trailing,
                              onSubmit: (final SearchData data) {
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
                        ? '${widget.heroTag}false'
                        : widget.heroTag,
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.search_rounded,
                                size: context.textTheme.bodyLarge
                                    ?.getIconSize(context, scale: 1),
                                color: context.colorScheme.onSurface.asHint(),
                                // color: Provider.of<PaletteSettings>(context)
                                //     .currentSetting
                                //     .faded3,
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  widget._prompt,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.asHint(),
                                  // .copyWith(
                                  //   color: Provider.of<PaletteSettings>(
                                  //     context,
                                  //   )
                                  //       .currentSetting
                                  //       .faded3
                                  //       .withOpacity(0.7),
                                  // ),
                                ),
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
  const _ActiveSearch({
    required this.searchData,
    required this.onSubmit,
    this.trailing,
  });
  final SearchData searchData;
  final Widget? trailing;
  final ValueChanged<SearchData> onSubmit;
  @override
  Widget build(final BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (searchData.query.trim().isNotEmpty)
                  Flexible(
                    child: Row(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            Icons.search_rounded,
                            size: 14,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Searching for "${searchData.query.trim()}"',
                          ),
                        ),
                      ],
                    ),
                  ),
                // if (searchData.visibleStrings.isNotEmpty &&
                //     searchData.query.trim().isNotEmpty)
                // Divider(
                //   // color: Provider.of<PaletteSettings>(context)
                //   //     .currentSetting
                //   //     .baseElements,
                //   thickness: 0.2,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Wrap(
                    children: List<Widget>.generate(
                      searchData.visibleStrings.length,
                      (final int index) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text.rich(
                            TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: context.colorScheme.onPrimary,
                                  ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text:
                                      '${searchData.visibleStrings[index].trim().replaceAll('"', '').split(':').first} ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '${searchData.visibleStrings[index].trim().replaceAll('"', '').split(':').last}${'${index == searchData.visibleStrings.length - 1 ? '' : ', '} '}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          trailing ??
              RoundButton(
                icon: Icon(
                  Icons.close,
                  size: 15,
                  color: context.colorScheme.primary,
                ),
                padding: const EdgeInsets.all(4),
                color: context.colorScheme.onPrimary,
                onPressed: () {
                  onSubmit(searchData.cleared);
                },
              ),
        ],
      );
}
