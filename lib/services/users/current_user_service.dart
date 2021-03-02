import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/users/current_user_info_model.dart';

class CurrentUserService {
  static final String _url = '/user';

  static Future<CurrentUserInfoModel> getCurrentUserInfo() async {
    CurrentUserInfoModel currentUserInfo = await GetDio.getDio()
        .get(_url, options: CacheManager.currentUserProfileInfo())
        .then((value) {
      if (value.statusCode == 200) {
        return CurrentUserInfoModel.fromJson(value.data);
      } else
        throw Exception(value.statusMessage);
    });
    return currentUserInfo;
  }
}
