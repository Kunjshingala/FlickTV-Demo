import 'dart:ui';

import 'package:flutter/material.dart';

import '../colors.dart';

class HalftonePainter extends CustomPainter {
  final Color color;
  final double spacing;
  final double maxRadius;
  final double fadeHeightFactor;

  const HalftonePainter({
    this.color = colorPrimary,
    this.spacing = 18,
    this.maxRadius = 6,
    this.fadeHeightFactor = 0.55,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final fadeHeight = size.height * fadeHeightFactor;

    for (double y = 0; y < fadeHeight; y += spacing) {
      final progress = y / fadeHeight;

      final radius = lerpDouble(maxRadius, 0.8, progress)!;
      final opacity = lerpDouble(1.0, 0.0, progress)!;

      paint.color = color.withValues(alpha: opacity);

      final offsetX = ((y ~/ spacing) % 2) * (spacing / 2);

      for (double x = offsetX; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant HalftonePainter oldDelegate) => false;
}
