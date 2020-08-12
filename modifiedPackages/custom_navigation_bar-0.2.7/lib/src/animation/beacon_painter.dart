import 'package:flutter/material.dart';

class BeaconPainter extends CustomPainter {
  final double beaconRadius;
  final Color color;
  final double maxRadius;

  const BeaconPainter({
    this.beaconRadius,
    this.color,
    this.maxRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (beaconRadius == maxRadius) return;

    if (beaconRadius < maxRadius * 0.5) {
      final Paint paint = Paint()..color = color;
      canvas.drawCircle(
          Offset(maxRadius / 2, maxRadius / 2), beaconRadius, paint);
    } else {
      final Paint paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = maxRadius - beaconRadius;
      canvas.drawCircle(
          Offset(maxRadius / 2, maxRadius / 2), beaconRadius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
