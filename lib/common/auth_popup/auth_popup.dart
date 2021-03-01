import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/auth_popup/widgets/codeInfoBox.dart';
import 'package:onehub/style/colors.dart';

import '../button.dart';

class AuthPopup extends StatefulWidget {
  AuthPopup({Key key}) : super(key: key);

  @override
  _AuthPopupState createState() => _AuthPopupState();
}

class _AuthPopupState extends State<AuthPopup> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: AppColor.background,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) async {
                if (state is AuthenticationInitialized) {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                      RequestAccessToken(state.deviceCodeModel.deviceCode,
                          state.deviceCodeModel.interval));
                }
              },
              builder: (context, state) {
                if (state is AuthenticationInitial) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login.',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'You need to login using your GitHub account for the full experience.',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Button(
                        title: 'Login with GitHub',
                        leadingIcon: Icon(
                          Octicons.mark_github,
                          color: Colors.white,
                        ),
                        color: AppColor.onBackground,
                        onTap: () async {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(RequestDeviceCode());
                        },
                      ),
                    ],
                  );
                } else if (state is AuthenticationInitialized)
                  return CodeInfoBox(state.deviceCodeModel);
                else if (state is AuthenticationSuccessful) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Successful.',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Authentication completed successfully.',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Tap here to close',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  );
                } else if (state is AuthenticationError) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Error.',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        state.error,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: MaterialButton(
                          onPressed: () {
                            BlocProvider.of<AuthenticationBloc>(context)
                                .add(ResetStates());
                          },
                          child: Text(
                            'Retry',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
