import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/view/authentication/widgets/code_info_box.dart';
import 'package:dio_hub/view/authentication/widgets/error_popup.dart';
import 'package:dio_hub/view/authentication/widgets/login_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/shims/dart_ui.dart';

class AuthScreen extends StatelessWidget {
  final VoidCallback? onAuthenticated;
  const AuthScreen({Key? key, this.onAuthenticated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizeExpandedSection(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: MediaQuery.of(context).size.width * 0.3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) async {
                  if (state is AuthenticationSuccessful) {
                    if (onAuthenticated != null) {
                      onAuthenticated!();
                    } else {
                      AutoRouter.of(context).replace(LandingScreenRoute());
                    }
                  }
                },
                builder: (context, state) {
                  if (state is AuthenticationUnauthenticated) {
                    return const LoginPopup();
                  } else if (state is AuthenticationInitialized) {
                    return CodeInfoBox(state.deviceCodeModel);
                  } else if (state is AuthenticationError) {
                    return ErrorPopup(state.error);
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
