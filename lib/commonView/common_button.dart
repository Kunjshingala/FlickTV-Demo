import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const CommonButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.maxFinite,
        alignment: AlignmentDirectional.center,
        padding: EdgeInsetsDirectional.symmetric(
          vertical: context.sizing.height * 0.02,
          horizontal: context.sizing.width * 0.01,
        ),
        decoration: BoxDecoration(
          color: context.appColors.success,
          borderRadius: BorderRadiusDirectional.circular(context.sizing.avg * 0.0225),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: commonTextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.sizing.avg * 0.025,
          ).copyWith(height: 1.0),
        ),
      ),
    );
  }
}
