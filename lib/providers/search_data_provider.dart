import 'package:onehub/common/search_overlay/search_overlay.dart';
import 'package:onehub/providers/base_provider.dart';

class SearchDataProvider extends BaseProvider {
  SearchData _searchData = SearchData(multiType: true);

  SearchData get searchData => _searchData;
  void updateSearchData(SearchData searchData) {
    if (!searchData.isActive && _searchData.getSort == null)
      _searchData = SearchData(multiType: true);
    else
      this._searchData = searchData;
    notifyListeners();
  }
}
