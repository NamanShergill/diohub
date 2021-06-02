import 'package:dio_hub/common/animations/fade_animation_widget.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class CardFooter extends StatelessWidget {
  final String? avatarUrl;
  final String? text;
  final bool? unread;
  const CardFooter(this.avatarUrl, this.text, this.unread, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FadeAnimationSection(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: unread! ? 1 : 0.7,
            child: ProfileTile(
              avatarUrl,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Text(
              text!,
              style: TextStyle(color: unread! ? Colors.white : AppColor.grey3),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
