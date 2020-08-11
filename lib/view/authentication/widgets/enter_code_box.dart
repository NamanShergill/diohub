import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gitapp/app/Dio/response_handler.dart';
import 'package:gitapp/common/bottom_sheet.dart';
import 'package:gitapp/models/authentication/device_code_model.dart';
import 'package:gitapp/models/popup/popup_type.dart';
import 'package:gitapp/providers/authentication/auth_provider.dart';
import 'package:gitapp/services/authentication/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EnterCodeBox extends StatefulWidget {
  final DeviceCodeModel deviceCode;
  EnterCodeBox(this.deviceCode);
  @override
  _EnterCodeBoxState createState() => _EnterCodeBoxState();
}

class _EnterCodeBoxState extends State<EnterCodeBox> {
  int expiresIn;
  Timer _timer;
  bool statusCheck;
  AuthProvider authStatus;

  @override
  void initState() {
    authStatus = context.read<AuthProvider>();
    expiresIn = widget.deviceCode.expiresIn;
    statusCheck = true;
    decrementTimer();
    checkStatus();
    copyCode();
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
        authStatus.setStatusUnauthenticated();
        ResponseHandler.setErrorMessage(AppPopupData(title: 'Code Expired'));
      }
    });
  }

  void checkStatus() async {
    bool done = false;
    while (statusCheck) {
      if (done) {
        statusCheck = false;
        authStatus.setStatusAuthenticated();
        return;
      } else {
        await Future.delayed(Duration(seconds: widget.deviceCode.interval));
        if (statusCheck)
          await AuthService.getAccessToken(
                  deviceCode: widget.deviceCode.deviceCode)
              .then((value) => done = value);
      }
    }
  }

  void copyCode({bool pop = false}) async {
    Clipboard.setData(ClipboardData(text: widget.deviceCode.userCode));
    if (pop) {
      Navigator.pop(context);
    } else {
      await Future.delayed(Duration(milliseconds: 250));
    }
    ResponseHandler.setSuccessMessage(
        AppPopupData(title: 'Copied Code ${widget.deviceCode.userCode}'));
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Container(
      width: 300,
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Enter the following code'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    showBottomActionsMenu(context,
                        header: Text(widget.deviceCode.userCode),
                        childWidget: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              copyCode(pop: true);
                            },
                            title: Text("Copy"),
                            trailing: Icon(FontAwesome.copy),
                          ),
                        ));
                  },
                  child: Text(widget.deviceCode.userCode)),
            ),
            Text("Expires in ${(expiresIn ~/ 60)}:${expiresIn % 60}"),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Text(
                    widget.deviceCode.verificationUri,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    showBottomActionsMenu(context,
                        header: Text(widget.deviceCode.verificationUri),
                        childWidget: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              canLaunch(widget.deviceCode.verificationUri)
                                  .then((value) {
                                Navigator.pop(context);
                                if (value) {
                                  launch(widget.deviceCode.verificationUri);
                                } else {
                                  ResponseHandler.setErrorMessage(
                                      AppPopupData(title: 'Invalid URL'));
                                }
                              });
                            },
                            title: Text("Open"),
                            trailing: Icon(FontAwesome.external_link),
                          ),
                        ));
                  },
                ),
              ),
            ),
            MaterialButton(
              child: Text('Back'),
              onPressed: () {
                setState(() {
                  auth.setStatusUnauthenticated();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
