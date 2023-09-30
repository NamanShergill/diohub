import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/models/users/current_user_info_model.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/view/profile/user_profile_screen.dart';
import 'package:flutter/material.dart';

class CurrentUserProfileScreen extends StatelessWidget {
  const CurrentUserProfileScreen({super.key});
  @override
  Widget build(final BuildContext context) =>
      ProviderLoadingProgressWrapper<CurrentUserProvider>(
        childBuilder: (final BuildContext context, final CurrentUserProvider value) =>
            UserProfileScreen<CurrentUserInfoModel>(
          value.data,
          isCurrentUser: true,
        ),
      );
}
