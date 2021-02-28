import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/app/Dio/response_handler.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/models/authentication/device_code_model.dart';
import 'package:onehub/models/popup/popup_type.dart';
import 'package:url_launcher/url_launcher.dart';

class CodeInfoBox extends StatefulWidget {
  final DeviceCodeModel deviceCodeModel;
  CodeInfoBox(this.deviceCodeModel);
  @override
  _CodeInfoBoxState createState() => _CodeInfoBoxState();
}

class _CodeInfoBoxState extends State<CodeInfoBox> {
  CountdownTimerController timerController;

  @override
  void initState() {
    timerController = CountdownTimerController(
      endTime: DateTime.now().millisecondsSinceEpoch +
          widget.deviceCodeModel.expiresIn * 1000,
      onEnd: () {
        BlocProvider.of<AuthenticationBloc>(context).add(ResetStates());
      },
    );
    copyCode();
    super.initState();
  }

  @override
  void dispose() {
    timerController.dispose();
    super.dispose();
  }

  void copyCode({bool pop = false}) async {
    Clipboard.setData(ClipboardData(text: widget.deviceCodeModel.userCode));
    if (pop) {
      Navigator.pop(context);
    } else {
      await Future.delayed(Duration(milliseconds: 250));
    }
    ResponseHandler.setSuccessMessage(
        AppPopupData(title: 'Copied Code ${widget.deviceCodeModel.userCode}'));
  }

  @override
  Widget build(BuildContext context) {
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
                        header: Text(
                          widget.deviceCodeModel.userCode,
                          style: TextStyle(fontSize: 20),
                        ),
                        childWidget: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              copyCode(pop: true);
                            },
                            title: Text("Copy to Clipboard"),
                            trailing: Icon(
                              LineIcons.copy,
                              color: Colors.white,
                            ),
                          ),
                        ));
                  },
                  child: Text(widget.deviceCodeModel.userCode)),
            ),
            CountdownTimer(
              controller: timerController,
              widgetBuilder: (_, CurrentRemainingTime time) {
                return Text('${time.min}:${time.sec}');
              },
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Text(
                    widget.deviceCodeModel.verificationUri,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    showBottomActionsMenu(context,
                        header: Text(widget.deviceCodeModel.verificationUri),
                        childWidget: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              canLaunch(widget.deviceCodeModel.verificationUri)
                                  .then((value) {
                                Navigator.pop(context);
                                if (value) {
                                  launch(
                                      widget.deviceCodeModel.verificationUri);
                                } else {
                                  ResponseHandler.setErrorMessage(
                                      AppPopupData(title: 'Invalid URL'));
                                }
                              });
                            },
                            title: Text("Open"),
                            trailing: Icon(LineIcons.alternateFontAwesome),
                          ),
                        ));
                  },
                ),
              ),
            ),
            MaterialButton(
              child: Text('Back'),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(ResetStates());
              },
            ),
          ],
        ),
      ),
    );
  }
}
