import 'package:dio_hub/app/settings/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    required this.child,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    super.key,
  });
  final Widget child;
  final BorderRadius? borderRadius;
  final Color? baseColor;
  final Color? highlightColor;
  @override
  Widget build(final BuildContext context) => ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: Shimmer.fromColors(
          baseColor: baseColor ??
              Provider.of<PaletteSettings>(context).currentSetting.faded1,
          highlightColor: highlightColor ??
              Provider.of<PaletteSettings>(context).currentSetting.faded2,
          child: child,
        ),
      );
}
