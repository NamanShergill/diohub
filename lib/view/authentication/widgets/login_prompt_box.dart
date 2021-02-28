import 'package:flutter/material.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/providers/authentication/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPromptBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Container(
      width: 500,
      height: 80,
      child: Button(
        title: 'Login with github',
        onTap: () async {
          await auth.getDeviceCode();
        },
      ),
    );
  }
}
