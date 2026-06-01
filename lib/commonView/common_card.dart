import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CommonCard extends StatelessWidget {
  final String assetsString;
  final String title;
  final String message;
  final VoidCallback? onTap;

  const CommonCard({super.key, required this.assetsString, required this.title, required this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap?.call,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: dimensions.deviceWidth * 0.038,
          vertical: dimensions.deviceHeight * 0.015,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: colorBorder.withValues(alpha: 0.25), width: 1),
          borderRadius: BorderRadiusDirectional.circular(dimensions.deviceAverage * 0.0225),
          boxShadow: [BoxShadow(color: Colors.white.withValues(alpha: 0.275), blurStyle: BlurStyle.inner)],
        ),
        child: Row(
          spacing: dimensions.deviceWidth * 0.038,
          children: [
            Container(
              constraints: BoxConstraints.expand(
                height: dimensions.deviceAverage * 0.1,
                width: dimensions.deviceAverage * 0.095,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadiusDirectional.circular(dimensions.deviceAverage * 0.02),
              ),
              child: Image.asset(assetsString, width: double.maxFinite, height: double.maxFinite, fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: commonTextStyle(fontWeight: FontWeight.w700)),
                  Text(
                    message,
                    style: commonTextStyle(fontWeight: FontWeight.w500, fontSize: dimensions.deviceAverage * 0.019),
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
      onTap: onTap?.call,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: dimensions.deviceWidth * 0.028,
          vertical: dimensions.deviceHeight * 0.01,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadiusDirectional.circular(dimensions.deviceAverage * 0.015),
        ),
        child: Row(
          spacing: dimensions.deviceWidth * 0.028,
          children: [
            Container(
              constraints: BoxConstraints.expand(
                width: dimensions.deviceAverage * 0.06,
                height: dimensions.deviceAverage * 0.0575,
              ),
              decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadiusDirectional.circular(dimensions.deviceAverage * 0.01),
              ),
              child: Image.asset(assetsString, width: double.maxFinite, height: double.maxFinite, fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: commonTextStyle(fontWeight: FontWeight.w700, fontSize: dimensions.deviceAverage * 0.019),
                  ),
                  Text(
                    message,
                    style: commonTextStyle(fontWeight: FontWeight.w500, fontSize: dimensions.deviceAverage * 0.017),
                  ),
                ],
              ),
            ),
            Icon(Icons.navigate_next, color: Colors.white, size: dimensions.deviceAverage * 0.04),
          ],
        ),
      ),
    );
  }
}
