import 'package:flutter/material.dart';

/// Builds a Montserrat text style. [fontSize] is required — callers pass a
/// screen-relative size via `context.sizing` (e.g. `context.sizing.avg * 0.025`)
/// so this helper stays free of any global/context dependency.
TextStyle commonTextStyle({required double fontSize, Color? textColor, FontWeight? fontWeight}) {
  return TextStyle(
    color: textColor ?? Colors.white,
    fontSize: fontSize,
    fontWeight: fontWeight ?? FontWeight.normal,
    fontFamily: 'Montserrat',
  );
}
