import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/providers/base_provider.dart';

class SearchDataProvider extends BaseProvider {
  SearchData _searchData = SearchData(multiType: true);

  SearchData get searchData => _searchData;
  void updateSearchData(SearchData searchData) {
    if (!searchData.isActive && searchData.getSort == null) {
      _searchData = SearchData(multiType: true);
    } else {
     _searchData = searchData;
    }
    notifyListeners();
  }
}
