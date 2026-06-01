import 'package:flutter/material.dart';

import '../../commonView/common_view.dart';
import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        backgroundColor: Colors.transparent,
        leading: GlassedIconContainer(
          margin: EdgeInsetsDirectional.only(start: commonHorizontalSpacing),
          iconData: Icons.arrow_back_ios_new,
        ),
        actions: [
          GlassedIconContainer(
            margin: EdgeInsetsDirectional.only(end: commonHorizontalSpacing),
            iconData: Icons.settings,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: _buildHome(context),
    );
  }
}

Widget _buildHome(BuildContext context) {
  return Stack(
    children: [
      Align(
        alignment: AlignmentDirectional.topCenter,
        child: Container(
          width: double.maxFinite,
          height: dimensions.deviceHeight * 0.3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
                colorPrimary.withValues(alpha: 0.5),
                colorPrimary.withValues(alpha: 0.25),
                colorPrimary.withValues(alpha: 0.0),
              ],
            ),
          ),
          child: RepaintBoundary(
            child: CustomPaint(
              painter: HalftonePainter(color: colorPrimary, spacing: 10, maxRadius: 2, fadeHeightFactor: 0.7),
            ),
          ),
        ),
      ),

      Align(
        alignment: AlignmentDirectional.center,
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: commonHorizontalSpacing,
            vertical: (MediaQuery.of(context).viewPadding.top),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...[
                Image.asset(
                  "assets/images/wallet.png",
                  width: dimensions.deviceAverage * 0.25,
                  height: dimensions.deviceAverage * 0.25,
                  fit: BoxFit.cover,
                ),
                Text(
                  "blinkit",
                  style: commonTextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: dimensions.deviceAverage * 0.038,
                  ).copyWith(height: 1.0),
                ),
                Text(
                  "Money".toUpperCase(),
                  style: commonTextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: dimensions.deviceAverage * 0.065,
                  ).copyWith(height: 1.0, letterSpacing: dimensions.deviceWidth * 0.015),
                ),
              ],

              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsetsDirectional.only(
                  top: dimensions.deviceHeight * 0.035,
                  bottom: dimensions.deviceHeight * 0.02,
                ),
                children: [
                  CommonCard(
                    assetsString: "assets/images/wallet.png",
                    title: "Single tap payments",
                    message: "Enjoy seamless payment without the wait for OTPs",
                  ),
                  SizedBox(height: dimensions.deviceHeight * 0.015),
                  CommonCard(
                    assetsString: "assets/images/wallet.png",
                    title: "Zero Failure",
                    message: "Zero payment failures ensure you never miss an order",
                  ),
                  SizedBox(height: dimensions.deviceHeight * 0.015),
                  CommonCard(
                    assetsString: "assets/images/wallet.png",
                    title: "Real-time refunds",
                    message: "No Need to wait for refunds. Blinkit money refunds are instant!",
                  ),
                ],
              ),

              ...[
                CommonButton(text: "Add Money"),

                SizedBox(height: dimensions.deviceHeight * 0.03),
                CommonSecondaryCard(
                  assetsString: "assets/images/wallet.png",
                  title: "Claim Gift Card",
                  message: "Enter gift card details to claim your gift card",
                ),
                SizedBox(height: dimensions.deviceHeight * 0.03),

                Text(
                  "Enjoy seamless \n one tap payments",
                  textAlign: TextAlign.center,

                  style: commonTextStyle(
                    textColor: Colors.white24,
                    fontWeight: FontWeight.w800,
                    fontSize: dimensions.deviceAverage * 0.05,
                  ).copyWith(letterSpacing: 1, height: 0.95),
                  textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    ],
  );
}
