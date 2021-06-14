import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class ProfileTile extends StatelessWidget {
  final String? avatarUrl;
  final double size;
  final String? userLogin;
  final bool showName;
  final String? fullName;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final bool disableTap;
  const ProfileTile(this.avatarUrl,
      {this.userLogin,
      this.padding = EdgeInsets.zero,
      this.size = 25,
      this.fullName,
      this.disableTap = false,
      this.showName = false,
      this.textStyle,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: AppThemeBorderRadius.smallBorderRadius,
      color: Colors.transparent,
      child: InkWell(
        borderRadius: AppThemeBorderRadius.smallBorderRadius,
        onTap: userLogin != null && !disableTap
            ? () {
                AutoRouter.of(context)
                    .push(OtherUserProfileScreenRoute(login: userLogin));
              }
            : null,
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: avatarUrl ?? 'N/A',
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (fullName != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        fullName!,
                        style: (textStyle ??
                                TextStyle(
                                    color: Provider.of<PaletteSettings>(context)
                                        .currentSetting
                                        .baseElements,
                                    fontSize: 15))
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  if (showName)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        userLogin ?? 'N/A',
                        style: textStyle,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
