import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/loading_indicator.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/view/landing/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Show loading indicator on app startup until authentication status is determined.
class LandingAuthWrapperScreen extends StatefulWidget {
  final String? initLink;
  const LandingAuthWrapperScreen({Key? key, this.initLink}) : super(key: key);

  @override
  _LandingAuthWrapperScreenState createState() =>
      _LandingAuthWrapperScreenState();
}

class _LandingAuthWrapperScreenState extends State<LandingAuthWrapperScreen> {
  bool executed = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
      if (state is AuthenticationSuccessful) {
        if (!executed) {
          executed = true;
          context.read<CurrentUserProvider>().statusStream.listen((event) {
            if (event == Status.loaded) {
              DeepLinkHandler.deepLinkNavigate(widget.initLink!);
            }
          });
        }
      } else if (state is AuthenticationUnauthenticated) {
        if (!executed) {
          executed = true;
          DeepLinkHandler.deepLinkNavigate(widget.initLink!);
        }
      }
    }, builder: (context, state) {
      if (state is AuthenticationInitial) {
        return const Scaffold(
          body: Center(
            child: LoadingIndicator(),
          ),
        );
      }
      return const LandingScreen();
    });
  }
}
