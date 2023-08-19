import 'package:auto_route/annotations.dart';
import 'package:dio_hub/common/const/app_info.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/view/landing/landing.dart';
import 'package:flutter/material.dart';

/// Show loading indicator on app startup until authentication status is determined.
@RoutePage()
class LandingLoadingScreen extends StatelessWidget {
  const LandingLoadingScreen({Key? key, this.initLink}) : super(key: key);
  final Uri? initLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProviderLoadingProgressWrapper<CurrentUserProvider>(
        listener: (value) {
          if (value == Status.loaded && initLink != null) {
            deepLinkNavigate(initLink!);
          }
        },
        loadingBuilder: (context) => SafeArea(
            child: Scaffold(
          body: Column(
            children: [
              Expanded(child: Container()),
              const Expanded(child: LoadingIndicator()),
              const Expanded(
                child: AppNameWithVersion(),
              ),
            ],
          ),
        )),
        childBuilder: (context, value) => const LandingScreen(),
      ),
    );
  }
}
