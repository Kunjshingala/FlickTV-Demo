import 'package:flutter/material.dart';

import 'dimensions.dart';

TextStyle commonTextStyle({Color? textColor, double? fontSize, FontWeight? fontWeight}) {
  return TextStyle(
    color: textColor ?? Colors.white,
    fontSize: fontSize ?? dimensions.deviceAverage * 0.0225,
    fontWeight: fontWeight ?? FontWeight.normal,
    fontFamily: 'Montserrat',
  );
}
