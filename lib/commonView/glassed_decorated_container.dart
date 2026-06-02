import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/utils.dart';

class GlassedIconContainer extends StatelessWidget {
  final IconData iconData;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;
  final VoidCallback? onTap;

  const GlassedIconContainer({
    super.key,
    required this.iconData,
    this.iconSize,
    this.padding,
    this.margin,
    this.constraints,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double size = (dimensions.deviceAverage * 0.05).clamp(48.0, 56.0).toDouble();

    return Container(
      margin: margin,
      width: size,
      height: size,
      child: GestureDetector(
        onTap: onTap,
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: ConstrainedBox(
              constraints: constraints ?? BoxConstraints.tightFor(width: size, height: size),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.08),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.32), blurRadius: 20, offset: const Offset(0, 8)),
                  ],
                ),
                child: CustomPaint(
                  painter: const _GlassEdgePainter(),
                  child: Container(
                    padding: padding ?? EdgeInsets.all(size * 0.22),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        center: const AlignmentDirectional(-0.35, -0.45),
                        radius: 1.0,
                        colors: [
                          Colors.white.withValues(alpha: 0.16),
                          Colors.white.withValues(alpha: 0.06),
                          Colors.black.withValues(alpha: 0.18),
                        ],
                        stops: const [0.0, 0.55, 1.0],
                        transform: const GradientRotation(2.6),
                      ),
                    ),
                    child: Center(
                      child: Icon(iconData, color: Colors.white, size: iconSize ?? size * 0.48),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassEdgePainter extends CustomPainter {
  const _GlassEdgePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Rect insetRect = rect.deflate(0.75);
    final Paint topLeftHighlight = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        colors: [
          Colors.white.withValues(alpha: 0),
          Colors.white.withValues(alpha: 0.2),
          Colors.white.withValues(alpha: 0),
        ],
        stops: const [0.0, 0.45, 1.0],
        transform: const GradientRotation(2.6),
      ).createShader(insetRect);

    final Paint bottomShade = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..color = Colors.black.withValues(alpha: 0.16);
    final Paint bottomRightHighlight = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..color = Colors.white.withValues(alpha: 0.07);

    canvas.drawArc(insetRect, 2.6, 1.8, false, topLeftHighlight);
    canvas.drawArc(insetRect, 1.4, 1.1, false, bottomShade);
    canvas.drawArc(insetRect, 0.15, 0.75, false, bottomRightHighlight);
  }

  @override
  bool shouldRepaint(covariant _GlassEdgePainter oldDelegate) => false;
}
