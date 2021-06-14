import 'dart:async';

import 'package:dio_hub/app/Dio/response_handler.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/animations/scale_expanded_widget.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/models/authentication/device_code_model.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/utils/link_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';

class CodeInfoBox extends StatefulWidget {
  final DeviceCodeModel deviceCodeModel;
  const CodeInfoBox(this.deviceCodeModel, {Key? key}) : super(key: key);
  @override
  _CodeInfoBoxState createState() => _CodeInfoBoxState();
}

class _CodeInfoBoxState extends State<CodeInfoBox> {
  CountdownTimerController? timerController;
  bool copied = false;

  @override
  void initState() {
    timerController = CountdownTimerController(
      endTime: widget.deviceCodeModel.expiresIn!,
      onEnd: () {
        BlocProvider.of<AuthenticationBloc>(context).add(ResetStates());
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    timerController!.dispose();
    super.dispose();
  }

  void copyCode({bool pop = false}) async {
    Clipboard.setData(ClipboardData(text: widget.deviceCodeModel.userCode));
    if (pop) {
      Navigator.pop(context);
    } else {
      await Future.delayed(const Duration(milliseconds: 250));
    }
    ResponseHandler.setSuccessMessage(
        AppPopupData(title: 'Copied Code ${widget.deviceCodeModel.userCode}'));
  }

  @override
  Widget build(BuildContext context) {
    return ScaleExpandedSection(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CountdownTimer(
              controller: timerController,
              endWidget: const Text('Time Expired.'),
              widgetBuilder: (_, CurrentRemainingTime? time) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Divider(
                      height: 32,
                    ),
                    Text(
                      'Verification'.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 32,
                    ),
                    Center(
                      child: Text(
                          'Expires in ${time!.min ?? '00'}:${time.sec! < 10 ? '0' : ''}${time.sec}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                        backgroundColor: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .faded1,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Provider.of<PaletteSettings>(context)
                                .currentSetting
                                .faded3),
                        value: ((time.min ?? 0) * 60 + time.sec!) /
                            ((widget.deviceCodeModel.expiresIn! -
                                    widget.deviceCodeModel.parsedOn!) /
                                1000),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Button(
              onTap: () async {
                copyCode();
                setState(() {
                  copied = true;
                });
                await Future.delayed(const Duration(seconds: 4));
                setState(() {
                  copied = false;
                });
              },
              enabled: !copied,
              padding: const EdgeInsets.all(24.0),
              color: Provider.of<PaletteSettings>(context)
                  .currentSetting
                  .secondary,
              child: Column(
                children: [
                  Text(
                    widget.deviceCodeModel.userCode!,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: !copied,
                        child: const Icon(
                          Icons.copy,
                          color: Colors.grey,
                          size: 13,
                        ),
                        replacement: const Icon(
                          Icons.check,
                          color: Colors.grey,
                          size: 13,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Visibility(
                        visible: !copied,
                        child: const Text(
                          'TAP TO COPY',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        replacement: const Text(
                          'COPIED',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: Text(
              'Input the code on the following link.',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Provider.of<PaletteSettings>(context)
                  .currentSetting
                  .secondary,
              elevation: 2,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          widget.deviceCodeModel.verificationUri!,
                          style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  linkHandler(context, widget.deviceCodeModel.verificationUri,
                      shareDescription:
                          'Enter the code ${widget.deviceCodeModel.userCode} on:');
                },
                onLongPress: () {
                  linkHandler(context, widget.deviceCodeModel.verificationUri,
                      showSheetOnDeepLink: true,
                      shareDescription:
                          'Enter the code ${widget.deviceCodeModel.userCode} on:');
                },
              ),
            ),
          ),
          const Divider(
            height: 32,
          ),
          Center(
            child: MaterialButton(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Tap here to cancel',
                ),
              ),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(ResetStates());
              },
            ),
          ),
        ],
      ),
    );
  }
}
