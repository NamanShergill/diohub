import 'package:gitapp/app/Dio/dio.dart';
import 'package:gitapp/models/users/current_user_info_model.dart';

class CurrentUserService {
  static final String _url = '/user';

  static Future<CurrentUserInfoModel> getCurrentUserInfo() async {
    CurrentUserInfoModel currentUserInfo =
        await GetDio.getDio().get(_url).then((value) {
      if (value.data['login'] != null) {
        return CurrentUserInfoModel.fromJson(value.data);
      }
      return null;
    });
    return currentUserInfo;
  }
}
