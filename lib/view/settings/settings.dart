import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/style/colors.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StringButton(
          color: AppColor.onBackground,
          listenToLoadingController: false,
          onTap: () {
            BlocProvider.of<AuthenticationBloc>(context).add(LogOut());
          },
          title: 'Log Out',
          stretch: false,
        ),
        SizedBox(
          height: 8,
        ),
        StringButton(
          color: AppColor.onBackground,
          listenToLoadingController: false,
          onTap: () {
            CacheManager.clearCache();
          },
          title: 'Clear Cache',
          stretch: false,
        )
      ],
    );
  }
}
