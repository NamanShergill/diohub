import 'package:dio_hub/common/animations/fade_animation_widget.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:flutter/material.dart';

class CardFooter extends StatelessWidget {
  const CardFooter(
    this.avatarUrl,
    this.text, {
    required this.unread,
    super.key,
  });
  final String? avatarUrl;
  final String? text;
  final bool? unread;
  @override
  Widget build(final BuildContext context) => FadeAnimationSection(
        child: Row(
          children: <Widget>[
            Opacity(
              opacity: unread! ? 1 : 0.7,
              child: ProfileTile.avatar(
                avatarUrl: avatarUrl,
                size: 20,
                padding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                text ?? 'No dexcription',
                style: const TextStyle(
                    // color: unread!
                    //     ? context.palette.baseElements
                    //     : context.palette.faded3,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}
