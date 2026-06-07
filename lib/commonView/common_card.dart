import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CommonCard extends StatelessWidget {
  final String assetsString;
  final String title;
  final String message;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const CommonCard({
    super.key,
    required this.assetsString,
    required this.title,
    required this.message,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.sizing.width * 0.038,
          vertical: context.sizing.height * 0.015,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: context.appColors.cardBorder.withValues(alpha: 0.25), width: 1),
          borderRadius: BorderRadiusDirectional.circular(context.sizing.avg * 0.0225),
          boxShadow: [BoxShadow(color: Colors.white.withValues(alpha: 0.275), blurStyle: BlurStyle.inner)],
        ),
        child: Row(
          spacing: context.sizing.width * 0.038,
          children: [
            Container(
              constraints: BoxConstraints.expand(
                height: context.sizing.avg * 0.1,
                width: context.sizing.avg * 0.095,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadiusDirectional.circular(context.sizing.avg * 0.02),
              ),
              child: Image.asset(assetsString, width: double.maxFinite, height: double.maxFinite, fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: commonTextStyle(fontWeight: FontWeight.w700, fontSize: context.sizing.avg * 0.0225)),
                  Text(
                    message,
                    style: commonTextStyle(fontWeight: FontWeight.w500, fontSize: context.sizing.avg * 0.019),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonSecondaryCard extends StatelessWidget {
  final String assetsString;
  final String title;
  final String message;
  final VoidCallback? onTap;

  const CommonSecondaryCard({
    super.key,
    required this.assetsString,
    required this.title,
    required this.message,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.sizing.width * 0.028,
          vertical: context.sizing.height * 0.01,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadiusDirectional.circular(context.sizing.avg * 0.015),
        ),
        child: Row(
          spacing: context.sizing.width * 0.028,
          children: [
            Container(
              constraints: BoxConstraints.expand(
                width: context.sizing.avg * 0.06,
                height: context.sizing.avg * 0.0575,
              ),
              decoration: BoxDecoration(
                color: context.appColors.brand,
                borderRadius: BorderRadiusDirectional.circular(context.sizing.avg * 0.01),
              ),
              child: Image.asset(assetsString, width: double.maxFinite, height: double.maxFinite, fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: commonTextStyle(fontWeight: FontWeight.w700, fontSize: context.sizing.avg * 0.019),
                  ),
                  Text(
                    message,
                    style: commonTextStyle(fontWeight: FontWeight.w500, fontSize: context.sizing.avg * 0.017),
                  ),
                ],
              ),
            ),
            Icon(Icons.navigate_next, color: Colors.white, size: context.sizing.avg * 0.04),
          ],
        ),
      ),
    );
  }
}
