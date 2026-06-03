import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../commonView/common_view.dart';
import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _introController;
  late final AnimationController _hoverController;
  late final AnimationController _confettiController;

  @override
  void initState() {
    super.initState();

    _introController = AnimationController(vsync: this, duration: _HomeTimings.introDuration)..forward();
    _hoverController = AnimationController(vsync: this, duration: _HomeTimings.hoverDuration)..forward();
    _confettiController = AnimationController(vsync: this);

    Future<void>.delayed(_HomeTimings.confettiDelay, () {
      if (mounted) {
        _confettiController.forward(from: 0);
      }
    });
  }

  @override
  void dispose() {
    _introController.dispose();
    _hoverController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: const CommonAppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
          ),
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: _HomeContent(introController: _introController, hoverController: _hoverController),
        ),
        _HomeAppBarOverlay(introController: _introController),
        IgnorePointer(
          child: FadeTransition(
            opacity: CurvedAnimation(
              parent: _introController,
              curve: _HomeTimings.confettiFade,
              reverseCurve: Curves.easeIn,
            ),
            child: Lottie.asset(
              'assets/lottie/confetti.json',
              controller: _confettiController,
              alignment: AlignmentDirectional.topCenter,
              width: double.maxFinite,
              height: dimensions.deviceHeight * 0.65,
              fit: BoxFit.cover,
              frameRate: FrameRate.max,
              repeat: false,
              onLoaded: (composition) {
                _confettiController.duration = composition.duration;
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeAppBarOverlay extends StatelessWidget {
  final AnimationController introController;

  const _HomeAppBarOverlay({required this.introController});

  @override
  Widget build(BuildContext context) {
    final double topInset = MediaQuery.of(context).viewPadding.top;

    return PositionedDirectional(
      top: topInset,
      start: 0,
      end: 0,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: commonHorizontalSpacing),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Reveal(
              controller: introController,
              interval: _HomeTimings.leadingReveal,
              slideBegin: const Offset(-1.2, 0),
              scale: false,
              child: GlassedIconContainer(
                iconData: Icons.chevron_left_rounded,
                iconSize: dimensions.deviceAverage * 0.032,
              ),
            ),
            _Reveal(
              controller: introController,
              interval: _HomeTimings.settingsReveal,
              child: GlassedIconContainer(iconData: Icons.settings, iconSize: dimensions.deviceAverage * 0.036),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  final AnimationController introController;
  final AnimationController hoverController;

  const _HomeContent({required this.introController, required this.hoverController});

  @override
  Widget build(BuildContext context) {
    final double topInset = MediaQuery.of(context).viewPadding.top;

    return Stack(
      children: [
        const _TopGlow(),
        Align(
          alignment: AlignmentDirectional.center,
          child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.symmetric(horizontal: commonHorizontalSpacing, vertical: topInset),
            child: _IntroTimeline(introController: introController, hoverController: hoverController),
          ),
        ),
      ],
    );
  }
}

class _TopGlow extends StatelessWidget {
  const _TopGlow();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Container(
        width: double.maxFinite,
        height: size.height * 0.3,
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
    );
  }
}

class _IntroTimeline extends StatelessWidget {
  final AnimationController introController;
  final AnimationController hoverController;

  const _IntroTimeline({required this.introController, required this.hoverController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([introController, hoverController]),
      builder: (context, child) {
        // final double walletLift = Tween<double>(
        //   begin: dimensions.deviceHeight * 0.18,
        //   end: 0,
        // ).animate(CurvedAnimation(parent: introController, curve: _HomeTimings.walletLift)).value;

        final double walletLift = TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(begin: dimensions.deviceHeight * 0.15, end: dimensions.deviceHeight * 0.30)
                .chain(CurveTween(curve: Curves.easeOutCubic)),
            weight: 10,
          ),
          TweenSequenceItem(tween: ConstantTween<double>(dimensions.deviceHeight * 0.30), weight: 21),
          TweenSequenceItem(
            tween: Tween<double>(begin: dimensions.deviceHeight * 0.30, end: 0)
                .chain(CurveTween(curve: Curves.easeInOutCubic)),
            weight: 14,
          ),
          TweenSequenceItem(tween: ConstantTween<double>(0), weight: 55),
        ]).animate(introController).value;

        final double hoverOffset = Tween<double>(
          begin: -6,
          end: 6,
        ).animate(CurvedAnimation(parent: hoverController, curve: Curves.easeInOut)).value;
        final Color cardBackgroundColor =
            Color.lerp(
              Colors.transparent,
              Colors.white.withValues(alpha: 0.08),
              CurvedAnimation(parent: introController, curve: _HomeTimings.cardBackgroundReveal).value,
            ) ??
            Colors.transparent;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _IntroBrandBlock(introController: introController, walletLift: walletLift, hoverOffset: hoverOffset),
            _FeatureCardsSection(introController: introController, cardBackgroundColor: cardBackgroundColor),
            _FinalSection(introController: introController),
          ],
        );
      },
    );
  }
}

class _IntroBrandBlock extends StatelessWidget {
  final AnimationController introController;
  final double walletLift;
  final double hoverOffset;

  const _IntroBrandBlock({required this.introController, required this.walletLift, required this.hoverOffset});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, walletLift),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.translate(
            offset: Offset(0, hoverOffset),
            child: _Reveal(
              controller: introController,
              interval: _HomeTimings.walletReveal,
              child: Image.asset(
                'assets/images/wallet.png',
                width: dimensions.deviceAverage * 0.25,
                height: dimensions.deviceAverage * 0.25,
                fit: BoxFit.cover,
              ),
            ),
          ),
          _Reveal(
            controller: introController,
            interval: _HomeTimings.brandTextReveal,
            slideBegin: const Offset(0, 0.25),
            child: Text(
              'blinkit',
              style: commonTextStyle(
                fontWeight: FontWeight.w800,
                fontSize: dimensions.deviceAverage * 0.038,
              ).copyWith(height: 1.0),
            ),
          ),
          _Reveal(
            controller: introController,
            interval: _HomeTimings.brandMoneyReveal,
            slideBegin: const Offset(0, 0.22),
            child: Text(
              'Money'.toUpperCase(),
              style: commonTextStyle(
                fontWeight: FontWeight.w800,
                fontSize: dimensions.deviceAverage * 0.065,
              ).copyWith(height: 1.0, letterSpacing: dimensions.deviceWidth * 0.015),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCardsSection extends StatelessWidget {
  final AnimationController introController;
  final Color cardBackgroundColor;

  const _FeatureCardsSection({required this.introController, required this.cardBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.only(top: dimensions.deviceHeight * 0.035, bottom: dimensions.deviceHeight * 0.02),
      children: [
        _Reveal(
          controller: introController,
          interval: _HomeTimings.card1Reveal,
          child: CommonCard(
            assetsString: 'assets/images/wallet.png',
            title: 'Single tap payments',
            message: 'Enjoy seamless payment without the wait for OTPs',
            backgroundColor: cardBackgroundColor,
          ),
        ),
        SizedBox(height: dimensions.deviceHeight * 0.015),
        _Reveal(
          controller: introController,
          interval: _HomeTimings.card2Reveal,
          child: CommonCard(
            assetsString: 'assets/images/wallet.png',
            title: 'Zero Failure',
            message: 'Zero payment failures ensure you never miss an order',
            backgroundColor: cardBackgroundColor,
          ),
        ),
        SizedBox(height: dimensions.deviceHeight * 0.015),
        _Reveal(
          controller: introController,
          interval: _HomeTimings.card3Reveal,
          child: CommonCard(
            assetsString: 'assets/images/wallet.png',
            title: 'Real-time refunds',
            message: 'No Need to wait for refunds. Blinkit money refunds are instant!',
            backgroundColor: cardBackgroundColor,
          ),
        ),
      ],
    );
  }
}

class _FinalSection extends StatelessWidget {
  final AnimationController introController;

  const _FinalSection({required this.introController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Reveal(
          controller: introController,
          interval: _HomeTimings.finalReveal,
          slideBegin: Offset.zero,
          child: CommonButton(text: 'Add Money'),
        ),
        SizedBox(height: dimensions.deviceHeight * 0.03),
        _Reveal(
          controller: introController,
          interval: _HomeTimings.finalReveal,
          slideBegin: Offset.zero,
          child: CommonSecondaryCard(
            assetsString: 'assets/images/wallet.png',
            title: 'Claim Gift Card',
            message: 'Enter gift card details to claim your gift card',
          ),
        ),
        SizedBox(height: dimensions.deviceHeight * 0.03),
        _Reveal(
          controller: introController,
          interval: _HomeTimings.finalReveal,
          slideBegin: Offset.zero,
          child: Text(
            'Enjoy seamless \n one tap payments',
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
        ),
      ],
    );
  }
}

class _Reveal extends StatelessWidget {
  final AnimationController controller;
  final Interval interval;
  final Widget child;
  final Offset slideBegin;
  final bool scale;

  const _Reveal({
    required this.controller,
    required this.interval,
    required this.child,
    this.slideBegin = const Offset(0, 0.45),
    this.scale = true,
  });

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = CurvedAnimation(parent: controller, curve: interval);

    Widget result = FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: slideBegin, end: Offset.zero).animate(animation),
        child: child,
      ),
    );

    if (scale) {
      result = ScaleTransition(scale: Tween<double>(begin: 0.96, end: 1).animate(animation), child: result);
    }

    return result;
  }
}

class _HomeTimings {
  static const Duration introDuration = Duration(milliseconds: 8000);
  static const Duration hoverDuration = Duration(milliseconds: 2200);
  static const Duration confettiDelay = Duration(milliseconds: 800);

  static const Interval confettiFade = Interval(0.12, 0.42, curve: Curves.easeOut);
  static const Interval leadingReveal = Interval(0, 0.18, curve: Curves.easeOutCubic);
  static const Interval settingsReveal = Interval(0.76, 0.90, curve: Curves.easeOutCubic);

  static const Interval walletReveal = Interval(0, 0.10, curve: Curves.easeOutCubic);
  static const Interval brandTextReveal = Interval(0.12, 0.22, curve: Curves.easeOutCubic);
  static const Interval brandMoneyReveal = Interval(0.15, 0.25, curve: Curves.easeOutCubic);

  static const Interval card1Reveal = Interval(0.50, 0.62, curve: Curves.easeOutCubic);
  static const Interval card2Reveal = Interval(0.56, 0.68, curve: Curves.easeOutCubic);
  static const Interval card3Reveal = Interval(0.62, 0.74, curve: Curves.easeOutCubic);

  static const Interval finalReveal = Interval(0.76, 0.90, curve: Curves.easeOutCubic);
  static const Interval cardBackgroundReveal = Interval(0.90, 1, curve: Curves.easeOutCubic);
}
