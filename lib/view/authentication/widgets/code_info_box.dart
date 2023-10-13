import 'dart:async';

import 'package:dio_hub/app/api_handler/response_handler.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/animations/scale_expanded_widget.dart';
import 'package:dio_hub/common/bottom_sheet/url_actions.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/models/authentication/device_code_model.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class CodeInfoBox extends StatefulWidget {
  const CodeInfoBox(this.deviceCodeModel, {super.key});
  final DeviceCodeModel deviceCodeModel;
  @override
  CodeInfoBoxState createState() => CodeInfoBoxState();
}

class CodeInfoBoxState extends State<CodeInfoBox> {
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

  Future<void> copyCode({final bool pop = false}) async {
    await Clipboard.setData(
      ClipboardData(text: widget.deviceCodeModel.userCode!),
    );
    if (pop) {
      if (context.mounted) {
        Navigator.pop(context);
      }
    } else {
      await Future<void>.delayed(const Duration(milliseconds: 250));
    }
    ResponseHandler.setSuccessMessage(
      AppPopupData(title: 'Copied Code ${widget.deviceCodeModel.userCode}'),
    );
  }

  @override
  Widget build(final BuildContext context) => ScaleExpandedSection(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: CountdownTimer(
                controller: timerController,
                endWidget: const Text('Time Expired.'),
                widgetBuilder: (final _, final CurrentRemainingTime? time) =>
                    Column(
                  children: <Widget>[
                    const Divider(
                      height: 32,
                    ),
                    Text(
                      'Verification'.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 32,
                    ),
                    Center(
                      child: Text(
                        'Expires in ${time!.min ?? '00'}:${time.sec! < 10 ? '0' : ''}${time.sec}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: LinearProgressIndicator(
                        // backgroundColor: Provider.of<PaletteSettings>(context)
                        //     .currentSetting
                        //     .faded1,
                        // valueColor: AlwaysStoppedAnimation<Color>(
                        //   Provider.of<PaletteSettings>(context)
                        //       .currentSetting
                        //       .faded3,
                        // ),
                        value: ((time.min ?? 0) * 60 + time.sec!) /
                            ((widget.deviceCodeModel.expiresIn! -
                                    widget.deviceCodeModel.parsedOn!) /
                                1000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Button(
                onTap: () async {
                  await copyCode();
                  setState(() {
                    copied = true;
                  });
                  await Future<void>.delayed(const Duration(seconds: 4));
                  setState(() {
                    copied = false;
                  });
                },
                enabled: !copied,
                padding: const EdgeInsets.all(24),
                // color: Provider.of<PaletteSettings>(context)
                //     .currentSetting
                //     .secondary,
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.deviceCodeModel.userCode!,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Visibility(
                          visible: !copied,
                          replacement: const Icon(
                            Icons.check,
                            // color: grey,
                            size: 13,
                          ),
                          child: const Icon(
                            Icons.copy,
                            // color: grey,
                            size: 13,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Visibility(
                          visible: !copied,
                          replacement: const Text(
                            'COPIED',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          child: const Text(
                            'TAP TO COPY',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Flexible(
              child: Card(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10),
                // ),
                // color: Provider.of<PaletteSettings>(context)
                //     .currentSetting
                //     .secondary,
                // elevation: 2,
                child: Builder(
                  builder: (BuildContext context) {
                    final urlActions = URLActions(
                      uri: Uri.parse(widget.deviceCodeModel.verificationUri!),
                      shareDescription:
                          'Enter the code ${widget.deviceCodeModel.userCode} on:',
                    );
                    return GestureDetector(
                      // borderRadius: BorderRadius.circular(10),
                      onTap: urlActions.launchURL,
                      onLongPress: () async {
                        await urlActions.showMenu(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                widget.deviceCodeModel.verificationUri!,
                                style: TextStyle(
                                  color: context.colorScheme.primary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Divider(
              height: 32,
            ),
            Center(
              child: MaterialButton(
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(ResetStates());
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Tap here to cancel',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
