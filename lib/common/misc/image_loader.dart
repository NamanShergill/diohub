import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader(
    this.url, {
    this.height,
    this.errorBuilder,
    this.width,
    super.key,
  });
  final String url;
  final double? height;
  final double? width;
  final WidgetBuilder? errorBuilder;
  @override
  Widget build(final BuildContext context) => CachedNetworkImage(
        imageUrl: url,
        height: height,
        width: width,
        fit: BoxFit.fill,
        errorWidget: (final context, final _, final __) =>
            errorBuilder != null ? errorBuilder!(context) : Container(),
        placeholder: (final context, final string) =>
            (height != null || width != null)
                ? ShimmerWidget(
                    child: Container(
                      height: height,
                      width: width,
                      color: Colors.grey,
                    ),
                  )
                : Container(),
      );
}
