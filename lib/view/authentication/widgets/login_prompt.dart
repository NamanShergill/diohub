import 'package:flutter/material.dart';
import 'package:gitapp/providers/authentication/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPromptBox extends StatelessWidget {
  final bool loading;
  LoginPromptBox(this.loading);
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Container(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: MaterialButton(
          color: Colors.green,
          onPressed: !loading
              ? () async {
                  auth.getDeviceCode();
                }
              : null,
          child: !loading
              ? Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
