import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/fade_animation_widget.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardFooter extends StatelessWidget {
  const CardFooter(this.avatarUrl, this.text, {required this.unread, Key? key})
      : super(key: key);
  final String? avatarUrl;
  final String? text;
  final bool? unread;
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
              style: TextStyle(
                  color: unread!
                      ? Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .baseElements
                      : Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .faded3),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
