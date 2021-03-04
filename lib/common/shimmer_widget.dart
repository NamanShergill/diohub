import 'package:flutter/material.dart';
import 'package:onehub/style/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;
  ShimmerWidget({this.child});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: child,
      baseColor: AppColor.grey,
      highlightColor: AppColor.grey2,
    );
  }
}
