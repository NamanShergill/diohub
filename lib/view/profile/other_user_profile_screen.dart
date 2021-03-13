import 'package:flutter/material.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/common/scaffold_body.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/users/current_user_provider.dart';
import 'package:onehub/providers/users/user_provider.dart';
import 'package:onehub/view/profile/current_user_profile_screen.dart';
import 'package:onehub/view/profile/user_profile_screen.dart';
import 'package:provider/provider.dart';

class OtherUserProfileScreen extends StatelessWidget {
  final String login;
  OtherUserProfileScreen(this.login);
  @override
  Widget build(BuildContext context) {
    if (Provider.of<CurrentUserProvider>(context).currentUserInfo.login ==
        login) return CurrentUserProfileScreen();
    return ChangeNotifierProvider(
      create: (_) => UserProvider(login),
      builder: (context, child) {
        return SafeArea(
          child: Scaffold(
            appBar: Provider.of<UserProvider>(context).status != Status.loaded
                ? AppBar(
                    elevation: 0,
                  )
                : null,
            body: ScaffoldBody(
              notificationController:
                  Provider.of<UserProvider>(context).notificationController,
              child: ProviderLoadingProgressWrapper<UserProvider>(
                childBuilder: (context, value) {
                  return UserProfileScreen(
                    value.currentUserInfo,
                    isCurrentUser: false,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
