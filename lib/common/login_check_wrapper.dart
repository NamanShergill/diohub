import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/auth_popup/auth_popup.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/style/colors.dart';

class LoginCheckWrapper extends StatefulWidget {
  final Widget child;
  final EdgeInsets loginBoxPadding;
  LoginCheckWrapper(
      {Key key, this.child, this.loginBoxPadding = const EdgeInsets.all(32.0)})
      : super(key: key);

  @override
  _LoginCheckWrapperState createState() => _LoginCheckWrapperState();
}

class _LoginCheckWrapperState extends State<LoginCheckWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (_, state) {
      if (state.authenticated)
        return widget.child ?? Container();
      else
        return Column(
          children: [
            Padding(
              padding: widget.loginBoxPadding,
              child: Button(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AuthPopup();
                      });
                },
                stretch: false,
                elevation: 0,
                listenToLoadingController: false,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Login Required.',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'You need to authenticate to use these features.\n\nTap to proceed.',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
                color: AppColor.onBackground,
              ),
            ),
          ],
        );
    });
  }
}
