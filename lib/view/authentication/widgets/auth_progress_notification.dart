import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class AuthProgressNotification extends StatelessWidget {
  const AuthProgressNotification({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationInitialized) {
        return SizeExpandedSection(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: AppThemeBorderRadius.medBorderRadius,
              color: Provider.of<PaletteSettings>(context)
                  .currentSetting
                  .secondary,
              child: InkWell(
                onTap: () {
                  //   showDialog(
                  //       context: context,
                  //       builder: (_) {
                  //         return const AuthScreen();
                  //       });
                },
                borderRadius: AppThemeBorderRadius.medBorderRadius,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: AppThemeBorderRadius.medBorderRadius,
                    ),
                    width: double.infinity,
                    child: CountdownTimer(
                        endTime: state.deviceCodeModel.expiresIn,
                        onEnd: () {
                          if (!BlocProvider.of<AuthenticationBloc>(context)
                              .state
                              .authenticated) {
                            BlocProvider.of<AuthenticationBloc>(context)
                                .add(ResetStates());
                          }
                        },
                        widgetBuilder: (_, CurrentRemainingTime? time) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(LineIcons.exclamationCircle),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Authentication in Progress. (${time!.min ?? '00'}:${time.sec! < 10 ? '0' : ''}${time.sec})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  backgroundColor:
                                      Provider.of<PaletteSettings>(context)
                                          .currentSetting
                                          .faded1,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Provider.of<PaletteSettings>(context)
                                          .currentSetting
                                          .faded3),
                                  value: ((time.min ?? 0) * 60 + time.sec!) /
                                      ((state.deviceCodeModel.expiresIn! -
                                              state.deviceCodeModel.parsedOn!) /
                                          1000),
                                ),
                              ),
                            ],
                          );
                        })),
              ),
            ),
          ),
        );
      }
      return Container();
    });
  }
}
