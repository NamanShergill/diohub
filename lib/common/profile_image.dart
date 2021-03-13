import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/borderRadiuses.dart';

class ProfileImage extends StatelessWidget {
  final String avatarUrl;
  final double size;
  final String userLogin;
  final bool extended;
  ProfileImage(this.avatarUrl,
      {this.userLogin, this.size = 25, this.extended = false});
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: AppThemeBorderRadius.smallBorderRadius,
      color: Colors.transparent,
      child: InkWell(
        borderRadius: AppThemeBorderRadius.smallBorderRadius,
        onTap: userLogin != null
            ? () {
                AutoRouter.of(context)
                    .push(OtherUserProfileScreenRoute(login: userLogin));
              }
            : null,
        child: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: avatarUrl,
                height: size,
                fit: BoxFit.fill,
                placeholder: (context, string) {
                  return ShimmerWidget(
                    child: Container(
                      height: size,
                      width: size,
                      color: Colors.grey,
                    ),
                  );
                },
                errorWidget: (context, _, __) {
                  return Icon(
                    LineIcons.exclamationCircle,
                    size: size,
                  );
                },
              ),
            ),
            if (extended && userLogin != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  userLogin,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
