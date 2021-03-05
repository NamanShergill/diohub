import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/animations/fade_transition_widget.dart';
import 'package:onehub/common/shimmer_widget.dart';
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
          ClipOval(
            child: Opacity(
              opacity: unread ? 1 : 0.7,
              child: CachedNetworkImage(
                imageUrl: avatarUrl,
                height: 20,
                fit: BoxFit.fill,
                placeholder: (context, string) {
                  return ShimmerWidget(
                    child: Container(
                      height: 20,
                      width: 20,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
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
