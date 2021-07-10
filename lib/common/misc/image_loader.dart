import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader(this.url,
      {this.height, this.errorBuilder, this.width, Key? key})
      : super(key: key);
  final String url;
  final double? height;
  final double? width;
  final WidgetBuilder? errorBuilder;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: BoxFit.fill,
      errorWidget: (context, _, __) {
        return errorBuilder != null ? errorBuilder!(context) : Container();
      },
      placeholder: (context, string) {
        return (height != null || width != null)
            ? ShimmerWidget(
                child: Container(
                  height: height,
                  width: width,
                  color: Colors.grey,
                ),
              )
            : Container();
      },
    );
  }
}
