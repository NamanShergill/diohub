import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/shimmer_widget.dart';

class ImageLoader extends StatelessWidget {
  final String url;
  final double size;
  final WidgetBuilder errorBuilder;
  ImageLoader(this.url, {this.size, this.errorBuilder});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: size,
      fit: BoxFit.fill,
      errorWidget: (context, _, __) {
        return errorBuilder != null ? errorBuilder(context) : Container();
      },
      placeholder: (context, string) {
        return ShimmerWidget(
          child: Container(
            height: size,
            width: size,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
