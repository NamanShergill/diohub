import 'package:flutter/material.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/services/authentication/auth_service.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Button(
        listenToLoadingController: false,
        onTap: () {
          AuthService.logOut();
        },
        title: 'Log Out',
      ),
    );
  }
}
