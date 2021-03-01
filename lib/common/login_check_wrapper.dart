import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/auth_popup/auth_popup.dart';

class LoginCheckWrapper extends StatefulWidget {
  final Widget child;
  LoginCheckWrapper({Key key, this.child}) : super(key: key);

  @override
  _LoginCheckWrapperState createState() => _LoginCheckWrapperState();
}

class _LoginCheckWrapperState extends State<LoginCheckWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (_, state) {
      if (state.authenticated)
        return widget.child;
      else
        return MaterialButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AuthPopup();
                  });
            },
            child: Text('Please login to access these features.'));
    });
  }
}
