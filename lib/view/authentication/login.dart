import 'package:flutter/material.dart';
import 'package:gitapp/controller/button/button_controller.dart';
import 'package:gitapp/models/authentication/device_code_model.dart';
import 'package:gitapp/providers/authentication/auth_provider.dart';
import 'package:gitapp/view/authentication/widgets/enter_code_box.dart';
import 'package:gitapp/view/authentication/widgets/login_prompt.dart';
import 'package:gitapp/view/authentication/widgets/successful_box.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  bool loggingIn = false;
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
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Scaffold(
        body: Center(
          child: Consumer<AuthProvider>(builder: (_, auth, __) {
            DeviceCodeModel deviceCode = auth.deviceCode;
            return AnimatedSwitcher(
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeIn,
              duration: Duration(milliseconds: 250),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: getWidget(auth.authStatus,
                  deviceCode: deviceCode, loading: loading),
            );
          }),
        ),
      ),
    );
  }
}

Widget getWidget(AuthStatus status,
    {bool loading, DeviceCodeModel deviceCode}) {
  switch (status) {
    case AuthStatus.unauthenticated:
      return LoginPromptBox(loading);
      break;
    case AuthStatus.authenticating:
      return EnterCodeBox(deviceCode);
      break;
    case AuthStatus.authenticated:
      return SuccessfulBox();
      break;
  }
}
