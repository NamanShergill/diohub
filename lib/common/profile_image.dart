import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/shimmer_widget.dart';

class ProfileImage extends StatelessWidget {
  final String avatarUrl;
  final double size;
  ProfileImage(this.avatarUrl, {this.size = 25});
  @override
  Widget build(BuildContext context) {
    return ClipOval(
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
      ),
    );
  }
}
