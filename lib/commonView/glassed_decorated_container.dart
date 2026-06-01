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
    return Container(
      margin: margin,
      child: GestureDetector(
        onTap: onTap,
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  constraints:
                      constraints ??
                      BoxConstraints(
                        minWidth: dimensions.deviceAverage * 0.07,
                        minHeight: dimensions.deviceAverage * 0.07,
                      ),
                  padding: padding ?? EdgeInsets.all(dimensions.deviceAverage * 0.012),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.white.withValues(alpha: 0.18), Colors.white.withValues(alpha: 0.05)],
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 12, offset: Offset(0.5, 0.5)),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: Offset(-0.5, -0.5),
                      ),
                    ],
                  ),
                ),
                Icon(iconData, color: Colors.white, size: iconSize ?? dimensions.deviceAverage * 0.027),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
