import 'package:dio_hub/app/api_handler/response_handler.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/graphql/graphql.graphql.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/services/users/user_info_service.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

typedef FollowBuilder = Widget Function(
  BuildContext context,
  FollowStatusInfo$Query$User? followingData,
  VoidCallback? onPress,
);

class UserFollow extends StatefulWidget {
  const UserFollow(
    this.login, {
    super.key,
    this.child,
    this.onFollowersChange,
    this.inkWellRadius,
  });
  final String login;
  final BorderRadius? inkWellRadius;
  final FollowBuilder? child;
  final ValueChanged<int>? onFollowersChange;

  @override
  UserFollowState createState() => UserFollowState();
}

class UserFollowState extends State<UserFollow> {
  final GlobalKey<APIWrapperState<FollowStatusInfo$Query$User>> key =
      GlobalKey<APIWrapperState<FollowStatusInfo$Query$User>>();
  bool changing = false;

  @override
  Widget build(final BuildContext context) {
    VoidCallback? onPress(final FollowStatusInfo$Query$User? data) =>
        data == null || changing
            ? null
            : () async {
                setState(() {
                  changing = true;
                  data.viewerIsFollowing
                      ? data.followers.totalCount -= 1
                      : data.followers.totalCount += 1;
                });
                if (!data.viewerIsFollowing) {
                  ResponseHandler.setSuccessMessage(
                    AppPopupData(
                      title: 'Following ${widget.login}',
                      icon: Octicons.check,
                    ),
                  );
                }
                widget.onFollowersChange?.call(data.followers.totalCount);

                final bool isFollowing = data.viewerIsFollowing;
                key.currentState?.changeData(
                  data..viewerIsFollowing = !data.viewerIsFollowing,
                );
                await UserInfoService.changeFollowStatus(
                  data.id,
                  follow: !isFollowing,
                );

                setState(() {
                  changing = false;
                });
              };
    Widget iconButton(final FollowStatusInfo$Query$User? data) => IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: onPress(data),
          icon: Icon(
            Icons.add,
            size: 18,
            color: data != null && data.viewerIsFollowing
                ? context.colorScheme.primary
                : context.colorScheme.onSurface,
          ),
        );

    return APIWrapper<FollowStatusInfo$Query$User>.deferred(
      apiCall: ({required final bool refresh}) async =>
          UserInfoService.getFollowInfo(widget.login),
      key: key,
      loadingBuilder: (final BuildContext context) => widget.child != null
          ? widget.child!(context, null, null)
          : ShimmerWidget(
              child: iconButton(null),
            ),
      builder: (
        final BuildContext context,
        final FollowStatusInfo$Query$User data,
      ) =>
          widget.child != null
              ? widget.child!(context, data, onPress(data))
              : iconButton(data),
    );
  }
}
