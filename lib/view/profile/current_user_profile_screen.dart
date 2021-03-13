import 'package:flutter/material.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/models/users/current_user_info_model.dart';
import 'package:onehub/providers/users/current_user_provider.dart';
import 'package:onehub/view/profile/user_profile_screen.dart';

class CurrentUserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderLoadingProgressWrapper<CurrentUserProvider>(
      childBuilder: (context, value) {
        return UserProfileScreen<CurrentUserInfoModel>(
          value.currentUserInfo,
          isCurrentUser: true,
        );
      },
    );
  }
}
