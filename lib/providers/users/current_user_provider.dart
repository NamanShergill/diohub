import 'dart:async';

import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/models/enums/status_enum.dart';
import 'package:onehub/models/users/current_user_info_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/services/users/current_user_service.dart';

class CurrentUserProvider extends BaseProvider {
  CurrentUserInfoModel _currentUserInfo;
  Status _providerStatus = Status.Idle;
  final AuthenticationBloc authenticationBloc;
  StreamSubscription subscription;

  CurrentUserProvider({this.authenticationBloc}) {
    subscription = authenticationBloc.listen((state) {
      if (state is AuthenticationSuccessful) getUserInfo();
    });
  }

  @override
  Status get status => _providerStatus;

  CurrentUserInfoModel get currentUserInfo => _currentUserInfo;

  Future<CurrentUserInfoModel> getUserInfo() async {
    _providerStatus = Status.Loading;
    try {
      _currentUserInfo =
          await CurrentUserService.getCurrentUserInfo().then((value) {
        if (value != null) {
          _providerStatus = Status.Loaded;
          notifyListeners();
          return value;
        }
        return null;
      });
    } catch (e) {
      print(e);
      authenticationBloc.add(LogOut());
    }
    return _currentUserInfo;
  }
}
