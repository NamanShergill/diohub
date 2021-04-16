import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/api_wrapper_widget.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/repository_card.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/common/search_overlay/search_bar.dart';
import 'package:onehub/common/search_scroll_wrapper.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/providers/search_data_provider.dart';
import 'package:onehub/services/search/search_service.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _search = Provider.of<SearchDataProvider>(context);
    return Container(
      color: AppColor.onBackground,
      child: _search.searchData.searchFilters != null
          ? SearchScrollWrapper(
              _search.searchData, isNestedScrollViewChild: false,
              key: Key(_search.searchData.toQuery),
              onChanged: (data) {
                _search.updateSearchData(data);
              },
              // searchBarColor: AppColor.onBackground,
              searchHeroTag: 'searchScreen',
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            )
          : SizeExpandedSection(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      'Search GitHub',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchBar(
                      backgroundColor: AppColor.background,
                      heroTag: 'searchScreen',
                      onSubmit: (data) {
                        _search.updateSearchData(data);
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Material(
                        borderRadius: BorderRadius.vertical(
                            top: AppThemeBorderRadius.medBorderRadius.topRight),
                        color: AppColor.background,
                        child: APIWrapper<List<RepositoryModel>>(
                          getCall: SearchService.searchRepos(
                              SearchQueries().pushed.toQueryString('>' +
                                  DateFormat('yyyy-MM-dd').format(DateTime.now()
                                      .subtract(Duration(days: 7)))),
                              page: 1,
                              perPage: 25),
                          loadingBuilder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(48.0),
                              child: LoadingIndicator(),
                            );
                          },
                          responseBuilder: (context, data) {
                            return SizeExpandedSection(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (index == 0)
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16,
                                                          left: 24,
                                                          right: 16,
                                                          bottom: 8),
                                                  child: Text(
                                                    'Trending Repositories',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                ),
                                                // Divider(
                                                //   height: 0,
                                                // ),
                                              ],
                                            ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: RepositoryCard(
                                              data[index],
                                              isThemed: false,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        Divider(),
                                    itemCount: data.length),
                              ),
                            );
                          },
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
