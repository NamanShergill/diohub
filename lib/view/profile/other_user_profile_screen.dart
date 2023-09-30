import 'package:auto_route/annotations.dart';
import 'package:dio_hub/common/misc/scaffold_body.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/providers/users/user_provider.dart';
import 'package:dio_hub/view/profile/current_user_profile_screen.dart';
import 'package:dio_hub/view/profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OtherUserProfileScreen extends StatelessWidget {
  const OtherUserProfileScreen(this.login, {super.key});
  final String login;
  @override
  Widget build(final BuildContext context) {
    if (Provider.of<CurrentUserProvider>(context).data.login == login) {
      return const SafeArea(
        child: Scaffold(
          body: CurrentUserProfileScreen(),
        ),
      );
    }
    return ChangeNotifierProvider<UserProvider>(
      create: (final _) => UserProvider(login),
      builder: (final BuildContext context, final Widget? child) => SafeArea(
        child: Scaffold(
          appBar: Provider.of<UserProvider>(context).status != Status.loaded
              ? AppBar(
                  elevation: 0,
                )
              : null,
          body: ScaffoldBody(
            child: ProviderLoadingProgressWrapper<UserProvider>(
              childBuilder:
                  (final BuildContext context, final UserProvider value) =>
                      UserProfileScreen<UserInfoModel>(
                value.data,
                isCurrentUser: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
