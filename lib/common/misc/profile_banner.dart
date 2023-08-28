import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile.avatar({
    required this.avatarUrl,
    this.userLogin,
    this.padding,
    this.size = 25,
    super.key,
  })  : _type = _UserCardType.photo,
        fullName = null,
        disableTap = false,
        textStyle = null;
  const ProfileTile.login({
    required this.avatarUrl,
    required this.userLogin,
    this.padding,
    this.size = 25,
    this.disableTap = false,
    this.textStyle,
    super.key,
  })  : _type = _UserCardType.login,
        fullName = null;
  const ProfileTile.extended({
    required this.avatarUrl,
    required this.userLogin,
    required this.fullName,
    this.padding,
    this.size = 25,
    this.disableTap = false,
    this.textStyle,
    super.key,
  }) : _type = _UserCardType.extended;
  final String? avatarUrl;
  final double size;
  final String? userLogin;
  final String? fullName;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final bool disableTap;
  final _UserCardType _type;
  @override
  Widget build(final BuildContext context) => Material(
        borderRadius: smallBorderRadius,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: smallBorderRadius,
          onTap: userLogin != null && !disableTap
              ? () {
                  navigateToProfile(login: userLogin!, context: context);
                }
              : null,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: avatarUrl ?? 'N/A',
                    height: size,
                    fit: BoxFit.fill,
                    placeholder: (final context, final string) => ShimmerWidget(
                      child: Container(
                        height: size,
                        width: size,
                        color: Colors.grey,
                      ),
                    ),
                    errorWidget: (final context, final _, final __) => Icon(
                      LineIcons.exclamationCircle,
                      size: size,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (fullName != null)
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              fullName!,
                              style: (textStyle ??
                                      TextStyle(
                                        color: Provider.of<PaletteSettings>(
                                          context,
                                        ).currentSetting.baseElements,
                                        fontSize: 15,
                                      ))
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      if (_type != _UserCardType.photo)
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: size / 3),
                            child: Text(
                              userLogin ?? 'N/A',
                              style: textStyle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

void navigateToProfile({
  required final BuildContext context,
  required final String login,
}) =>
    unawaited(
      context.router.push(
        OtherUserProfileRoute(login: login),
      ),
    );

enum _UserCardType { photo, login, extended }
