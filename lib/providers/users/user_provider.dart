import 'dart:async';

import 'package:diohub/models/users/user_info_model.dart';
import 'package:diohub/providers/base_provider.dart';
import 'package:diohub/services/users/user_info_service.dart';

class UserProvider extends BaseDataProvider<UserInfoModel> {
  UserProvider(this._userName);
  final String _userName;

  @override
  Future<UserInfoModel> setInitData({final bool isInitialisation = false}) =>
      UserInfoService.getUserInfo(_userName);
}
