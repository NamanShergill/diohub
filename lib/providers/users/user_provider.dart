import 'dart:async';

import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/services/users/user_info_service.dart';

class UserProvider extends BaseDataProvider<UserInfoModel> {
  UserProvider(this._userName);
  final String _userName;

  @override
  Future<UserInfoModel> setInitData() {
    return UserInfoService.getUserInfo(_userName);
  }
}
