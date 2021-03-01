import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final Color color;
  final double lineWidth;
  LoadingIndicator(
      {this.color = Colors.white, this.size = 20, this.lineWidth = 3});
  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: color,
      size: size,
      lineWidth: lineWidth,
    );
  }
}
