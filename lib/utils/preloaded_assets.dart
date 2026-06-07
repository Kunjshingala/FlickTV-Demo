import 'package:lottie/lottie.dart';

/// Lottie compositions parsed once at startup (in `main`) so the first frame
/// that needs them renders without a parse hitch.
///
/// A field is null when its preload failed; callers must fall back (e.g. load
/// from the asset). Holds immutable, parsed assets only — not app state.
class PreloadedAssets {
  PreloadedAssets._();

  static LottieComposition? confetti;
}
