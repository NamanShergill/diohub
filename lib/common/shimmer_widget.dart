import 'package:flutter/material.dart';
import 'package:onehub/style/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;
  ShimmerWidget({this.child, this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: Shimmer.fromColors(
        child: child,
        baseColor: AppColor.grey,
        highlightColor: AppColor.grey2,
      ),
    );
  }
}
