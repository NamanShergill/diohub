import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final Color color;
  LoadingIndicator({this.color = Colors.white, this.size = 20});
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color,
      size: size,
    );
  }
}
