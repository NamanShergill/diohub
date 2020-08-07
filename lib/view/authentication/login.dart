import 'package:flutter/material.dart';
import 'package:gitapp/controller/button/button_controller.dart';
import 'package:gitapp/services/authentication/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  @override
  void initState() {
    ButtonController.buttonStream.listen((onData) {
      setState(() {
        if (onData != null) {
          loading = onData;
        } else {
          loading = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.green,
          onPressed: !loading
              ? () async {
                  await AuthService.getDeviceToken();
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
