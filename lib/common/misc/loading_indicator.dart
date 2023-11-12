import 'dart:math' as math;

import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({
    super.key,
    this.color,
    this.size = 25.0,
  });

  final Color? color;
  final double size;

  @override
  LoadingIndicatorState createState() => LoadingIndicatorState();
}

class LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = (AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    ))
      ..addListener(() => setState(() {}))
      ..repeat();
    _animation = Tween<double>(begin: 0, end: 4).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Center(
        child: Transform(
          transform: Matrix4.identity()..rotateZ((_animation.value) * math.pi),
          alignment: FractionalOffset.center,
          child: SizedBox(
            height: widget.size,
            width: widget.size,
            child: Image.asset(
              'assets/loading.png',
              color: widget.color ?? context.colorScheme.onBackground,
              // .withOpacity(0.8),
            ),
          ),
        ),
      );
}

// import 'package:flutter/material.dart';
//
// class LoadingIndicator extends StatelessWidget {
//   final double size;
//   final Color color;
//   final double lineWidth;
//   LoadingIndicator(
//       {this.color = white, this.size = 20, this.lineWidth = 3});
//   @override
//   Widget build(BuildContext context) {
//     return SpinKitRing(
//       color: color,
//       size: size,
//       lineWidth: lineWidth,
//     );
//   }
// }
