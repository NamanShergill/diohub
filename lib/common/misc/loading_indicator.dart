import 'dart:math' as math;

import 'package:dio_hub/app/settings/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    _animation = Tween(begin: 0, end: 4).animate(
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
  Widget build(final BuildContext context) {
    // return Center(
    //   child: SizedBox(
    //     height: widget.size,
    //     width: widget.size,
    //     child: ShimmerWidget(
    //       baseColor: faded3(context),
    //       highlightColor: elementsOnColors(context),
    //       child: Image.asset(
    //         'assets/loading.png',
    //         color: widget.color ??
    //             Provider.of<PaletteSettings>(context)
    //                 .currentSetting
    //                 .baseElements,
    //       ),
    //     ),
    //   ),
    // );
    return Center(
      child: Transform(
        transform: Matrix4.identity()..rotateZ((_animation.value) * math.pi),
        alignment: FractionalOffset.center,
        child: SizedBox(
          height: widget.size,
          width: widget.size,
          child: Image.asset(
            'assets/loading.png',
            color: widget.color ??
                Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .baseElements,
            // .withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class LoadingIndicator extends StatelessWidget {
//   final double size;
//   final Color color;
//   final double lineWidth;
//   LoadingIndicator(
//       {this.color = Colors.white, this.size = 20, this.lineWidth = 3});
//   @override
//   Widget build(BuildContext context) {
//     return SpinKitRing(
//       color: color,
//       size: size,
//       lineWidth: lineWidth,
//     );
//   }
// }
