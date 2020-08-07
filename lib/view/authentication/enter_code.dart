import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gitapp/models/authentication/device_code_model.dart';
import 'package:gitapp/services/authentication/auth_service.dart';
import 'package:url_launcher/url_launcher.dart';

class EnterCodeScreen extends StatefulWidget {
  final DeviceCodeModel deviceCodeModel;
  EnterCodeScreen({@required this.deviceCodeModel});
  @override
  _EnterCodeScreenState createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  int expiresIn;
  Timer _timer;
  bool statusCheck;

  @override
  void initState() {
    expiresIn = widget.deviceCodeModel.expiresIn;
    statusCheck = true;
    decrementTimer();
    checkStatus();
    Clipboard.setData(ClipboardData(text: widget.deviceCodeModel.userCode));
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    statusCheck = false;
    super.dispose();
  }

  void decrementTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        expiresIn--;
      });
      if (expiresIn == 0) {
        _timer.cancel();
      }
    });
  }

  void checkStatus() async {
    while (statusCheck) {
      bool done = false;
      if (done) {
        statusCheck = false;
        return;
      } else {
        await Future.delayed(
            Duration(seconds: widget.deviceCodeModel.interval));
        if (statusCheck)
          await AuthService.getAccessToken(
              deviceCode: widget.deviceCodeModel.deviceCode);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter the Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Enter the following code'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Clipboard.setData(
                        ClipboardData(text: widget.deviceCodeModel.userCode));
                  },
                  child: Text(widget.deviceCodeModel.userCode)),
            ),
            Text("Expires in ${(expiresIn ~/ 60)}:${expiresIn % 60}"),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Text(
                    widget.deviceCodeModel.verificationUri,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    launch(widget.deviceCodeModel.verificationUri);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
