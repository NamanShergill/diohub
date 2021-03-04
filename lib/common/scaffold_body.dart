import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/internet_connectivity.dart';

import 'animations/size_expanded_widget.dart';
import 'auth_popup/auth_popup.dart';

class ScaffoldBody extends StatefulWidget {
  final Widget child;
  final Widget footer;
  final Widget header;
  final bool showHeader;
  final bool showFooter;
  ScaffoldBody(
      {Key key,
      @required this.child,
      this.header,
      this.footer,
      this.showFooter = true,
      this.showHeader = true})
      : super(key: key);

  @override
  _ScaffoldBodyState createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Visibility(
                visible: widget.showHeader,
                child: widget.header ??
                    StreamBuilder(
                      initialData: true,
                      stream: InternetConnectivity.networkStream,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == NetworkStatus.Offline)
                          return Container(
                            width: double.infinity,
                            color: Colors.redAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                'Network Lost. Showing cached data.',
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                            ),
                          );
                        return Container();
                      },
                    )),
            Expanded(child: widget.child),
          ],
        ),
        Visibility(
            visible: widget.showFooter,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: widget.footer ??
                  //Show a toast to return to authentication if it is in progress.
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (_, state) {
                      if (state is AuthenticationInitialized) {
                        return SizeExpandedSection(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius:
                                  AppThemeBorderRadius.medBorderRadius,
                              color: AppColor.onBackground,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AuthPopup();
                                      });
                                },
                                borderRadius:
                                    AppThemeBorderRadius.medBorderRadius,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          AppThemeBorderRadius.medBorderRadius,
                                    ),
                                    width: double.infinity,
                                    child: CountdownTimer(
                                        endTime:
                                            state.deviceCodeModel.expiresIn,
                                        onEnd: () {
                                          if (!BlocProvider.of<
                                                  AuthenticationBloc>(context)
                                              .state
                                              .authenticated)
                                            BlocProvider.of<AuthenticationBloc>(
                                                    context)
                                                .add(ResetStates());
                                        },
                                        widgetBuilder:
                                            (_, CurrentRemainingTime time) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(LineIcons
                                                        .exclamationCircle),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Authentication in Progress. (${time.min ?? '00'}:${time.sec < 10 ? '0' : ''}${time.sec})',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                child: LinearProgressIndicator(
                                                  backgroundColor:
                                                      AppColor.grey,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                              Color>(
                                                          AppColor.grey3),
                                                  value: ((time.min ?? 0) * 60 +
                                                          time.sec) /
                                                      ((state.deviceCodeModel
                                                                  .expiresIn -
                                                              state
                                                                  .deviceCodeModel
                                                                  .parsedOn) /
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
                    },
                  ),
            )),
      ],
    );
  }
}
