import 'package:dio_hub/app/settings/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget? child;
  final BorderRadius? borderRadius;
  final Color? baseColor;
  final Color? highlightColor;
  const ShimmerWidget(
      {this.child,
      this.borderRadius,
      this.baseColor,
      this.highlightColor,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: Shimmer.fromColors(
        child: child!,
        baseColor: baseColor ??
            Provider.of<PaletteSettings>(context).currentSetting.faded1,
        highlightColor: highlightColor ??
            Provider.of<PaletteSettings>(context).currentSetting.faded2,
      ),
    );
  }
}
