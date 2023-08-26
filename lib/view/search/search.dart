import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/repository_card.dart';
import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/search_overlay/search_bar.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/common/wrappers/search_scroll_wrapper.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/providers/search_data_provider.dart';
import 'package:dio_hub/services/search/search_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final search = Provider.of<SearchDataProvider>(context);
    return Container(
      color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
      child: search.searchData.searchFilters != null
          ? SearchScrollWrapper(
              search.searchData,
              key: ValueKey(search.searchData.toQuery),
              onChanged: search.updateSearchData,
              // searchBarColor: Provider.of<PaletteSettings>(context).currentSetting.onBackground,
              searchHeroTag: 'searchScreen',
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            )
          : SizeExpandedSection(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      'Search GitHub',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppSearchBar(
                      backgroundColor: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .primary,
                      heroTag: 'searchScreen',
                      onSubmit: search.updateSearchData,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Material(
                        borderRadius: BorderRadius.vertical(
                            top: medBorderRadius.topRight),
                        color: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .primary,
                        child: APIWrapper<List<RepositoryModel>>(
                          apiCall: ({required refresh}) =>
                              SearchService.searchRepos(
                                  SearchQueries().pushed.toQueryString(
                                      '>${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 7)))}'),
                                  page: 1,
                                  perPage: 25),
                          loadingBuilder: (context) {
                            return const Padding(
                              padding: EdgeInsets.all(48.0),
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
                                                          .titleLarge!),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
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
