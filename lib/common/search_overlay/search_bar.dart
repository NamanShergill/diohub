import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/search_overlay/search_overlay.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class SearchBar extends StatefulWidget {
  final String? message;
  final String _prompt;
  final SearchData? searchData;
  final ValueChanged<SearchData> onSubmit;
  final Color backgroundColor;
  final String _heroTag;
  SearchBar(
      {this.message,
      String? prompt,
      this.searchData,
      String? heroTag,
      this.backgroundColor = AppColor.onBackground,
      required this.onSubmit})
      : _heroTag = heroTag ?? 'search_bar',
        _prompt = prompt ?? 'Search or Jump to...';

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

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget._heroTag,
      child: Material(
        elevation: 2,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        color: searchData?.isActive ?? false
            ? AppColor.accent
            : widget.backgroundColor,
        child: InkWell(
          borderRadius: AppThemeBorderRadius.medBorderRadius,
          onTap: () {
            AutoRouter.of(context).push(SearchOverlayScreenRoute(
                message: widget.message,
                searchData: searchData ?? SearchData(),
                heroTag: widget._heroTag,
                onSubmit: (data) {
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
                                        padding: const EdgeInsets.symmetric(
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
                                  thickness: 1,
                                ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Wrap(
                                  children: List.generate(
                                      searchData!.filterStrings.length,
                                      (index) => Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1,
                                                    children: [
                                                      TextSpan(
                                                          text: searchData!
                                                                  .filterStrings[
                                                                      index]
                                                                  .trim()
                                                                  .replaceAll(
                                                                      '"', '')
                                                                  .split(':')
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
                                                                      '"', '')
                                                                  .split(':')
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
                              widget.onSubmit(searchData!);
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
                                    color: AppColor.grey3.withOpacity(0.7)),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
