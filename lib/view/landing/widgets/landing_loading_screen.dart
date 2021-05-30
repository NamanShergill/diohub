import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/view/landing/landing.dart';
import 'package:flutter/material.dart';

/// Show loading indicator on app startup until authentication status is determined.
class LandingLoadingScreen extends StatelessWidget {
  final String? initLink;
  const LandingLoadingScreen({Key? key, this.initLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProviderLoadingProgressWrapper<CurrentUserProvider>(
        listener: (value) {
          if (value == Status.loaded && initLink != null) {
            DeepLinkHandler.deepLinkNavigate(initLink!);
          }
        },
        childBuilder: (context, value) => const LandingScreen(),
      ),
    );
  }
}
