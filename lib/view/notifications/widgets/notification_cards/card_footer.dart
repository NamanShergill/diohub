import 'package:flutter/material.dart';
import 'package:onehub/common/animations/fade_animation_widget.dart';
import 'package:onehub/common/profile_banner.dart';
import 'package:onehub/style/colors.dart';

class CardFooter extends StatelessWidget {
  final String avatarUrl;
  final String text;
  final bool unread;
  CardFooter(this.avatarUrl, this.text, this.unread);
  @override
  Widget build(BuildContext context) {
    return FadeAnimationSection(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: unread ? 1 : 0.7,
            child: ProfileTile(
              avatarUrl,
              size: 20,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Flexible(
            child: Text(
              text,
              style: TextStyle(color: unread ? Colors.white : AppColor.grey3),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
