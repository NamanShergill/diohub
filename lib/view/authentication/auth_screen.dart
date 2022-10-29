import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/const/app_info.dart';
import 'package:dio_hub/common/const/version_info.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/view/authentication/widgets/code_info_box.dart';
import 'package:dio_hub/view/authentication/widgets/error_popup.dart';
import 'package:dio_hub/view/authentication/widgets/login_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key, this.onAuthenticated}) : super(key: key);
  final VoidCallback? onAuthenticated;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizeExpandedSection(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppLogoWidget(
                              size: MediaQuery.of(context).size.width * 0.3),
                          const AppNameWidget(
                            size: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
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
            const Align(
              alignment: Alignment.bottomCenter,
              child: VersionInfoWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
