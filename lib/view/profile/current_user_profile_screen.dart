import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/models/users/current_user_info_model.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/view/profile/user_profile_screen.dart';
import 'package:flutter/material.dart';

class CurrentUserProfileScreen extends StatelessWidget {
  const CurrentUserProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderLoadingProgressWrapper<CurrentUserProvider>(
      childBuilder: (context, value) {
        return UserProfileScreen<CurrentUserInfoModel>(
          value.data,
          isCurrentUser: true,
        );
      },
    );
  }
}
