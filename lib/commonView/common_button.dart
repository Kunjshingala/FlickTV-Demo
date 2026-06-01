import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const CommonButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap?.call,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.maxFinite,
        alignment: AlignmentDirectional.center,
        padding: EdgeInsetsDirectional.symmetric(
          vertical: dimensions.deviceHeight * 0.02,
          horizontal: dimensions.deviceWidth * 0.01,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF1B8F20),
          borderRadius: BorderRadiusDirectional.circular(dimensions.deviceAverage * 0.0225),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: commonTextStyle(
            fontWeight: FontWeight.w600,
            fontSize: dimensions.deviceAverage * 0.025,
          ).copyWith(height: 1.0),
        ),
      ),
    );
  }
}
