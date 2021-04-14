import 'package:flutter/material.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/repository_card.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/common/search_overlay/search_bar.dart';
import 'package:onehub/common/search_overlay/search_overlay.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/services/search/search_service.dart';
import 'package:onehub/style/colors.dart';

class SearchScrollWrapper extends StatefulWidget {
  final SearchData searchData;
  final ScrollWrapperFuture nonSearchFuture;
  final String? searchBarMessage;
  final String? searchHeroTag;
  SearchScrollWrapper(this.searchData,
      {required this.nonSearchFuture,
      this.searchBarMessage,
      this.searchHeroTag});
  @override
  _SearchScrollWrapperState createState() => _SearchScrollWrapperState();
}

class _SearchScrollWrapperState extends State<SearchScrollWrapper> {
  late SearchData searchData;

  @override
  void initState() {
    searchData = widget.searchData;
    super.initState();
  }

  InfiniteScrollWrapperController controller =
      InfiniteScrollWrapperController();

  @override
  Widget build(BuildContext context) {
    if (searchData.searchFilters!.searchType == SearchType.repositories)
      return InfiniteScrollWrapper<RepositoryModel>(
        pageSize: 20,
        controller: controller,
        header: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchBar(
              heroTag: widget.searchHeroTag,
              searchData: searchData,
              prompt: widget.searchBarMessage,
              backgroundColor: AppColor.background,
              onSubmit: (data) {
                searchData = data;
                setState(() {
                  controller.refresh();
                });
              },
            ),
          );
        },
        future: (pageNumber, pageSize, refresh, _) {
          if (!searchData.isActive)
            return widget.nonSearchFuture(pageNumber, pageSize, refresh, _);
          return SearchService.searchRepos(searchData.toQuery(),
              perPage: pageSize, page: pageNumber);
        },
        divider: false,
        spacing: 4,
        topSpacing: 8,
        builder: (context, item, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RepositoryCard(item),
          );
        },
      );
    return Container();
  }
}
