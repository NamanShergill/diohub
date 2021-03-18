import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/view/landing/landing.dart';

/// Show loading indicator on app startup until authentication status is determined.
class LandingAuthWrapperScreen extends StatefulWidget {
  LandingAuthWrapperScreen({Key? key}) : super(key: key);

  @override
  _LandingAuthWrapperScreenState createState() =>
      _LandingAuthWrapperScreenState();
}

class _LandingAuthWrapperScreenState extends State<LandingAuthWrapperScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationInitial)
        return Scaffold(
          body: Center(
            child: LoadingIndicator(),
          ),
        );
      return LandingScreen();
    });
  }
}
