import 'package:flutter/material.dart';
import 'package:gitapp/models/authentication/device_code_model.dart';
import 'package:gitapp/providers/authentication/auth_provider.dart';
import 'package:gitapp/style/colors.dart';
import 'package:gitapp/view/authentication/widgets/enter_code_box.dart';
import 'package:gitapp/view/authentication/widgets/login_prompt_box.dart';
import 'package:gitapp/view/authentication/widgets/successful_box.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthProvider>(context);
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 150,
                width: 150,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Image.asset(
                      'assets/githubIcon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Container(
              width: _media.width * 0.7,
              height: _media.height * 0.4,
              child: AnimatedSwitcher(
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeIn,
                duration: Duration(milliseconds: 250),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(child: child, scale: animation);
                },
                child:
                    getWidget(_auth.authStatus, deviceCode: _auth.deviceCode),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getWidget(AuthStatus status, {DeviceCodeModel deviceCode}) {
  switch (status) {
    case AuthStatus.unauthenticated:
      return LoginPromptBox();
      break;
    case AuthStatus.authenticating:
      return EnterCodeBox(deviceCode);
      break;
    case AuthStatus.authenticated:
      return SuccessfulBox();
      break;
  }
  return null;
}
