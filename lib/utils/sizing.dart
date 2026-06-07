import 'package:flutter/widgets.dart';

/// Which screen dimension a scaled value is derived from.
enum SizeBasis { width, height, avg }

/// Screen-relative sizing, read from [MediaQuery]. Replaces the old global
/// `dimensions` singleton: no global state, no init-order coupling, reactive
/// to size changes, and testable in isolation.
///
/// Access via `context.sizing` (see [SizingX]). Use the raw [width]/[height]/
/// [avg] getters for uncapped values, or [scale] when you want a floor/ceiling
/// so values don't blow up on large screens.
class AppSizing {
  const AppSizing(this.size);

  final Size size;

  double get width => size.width;
  double get height => size.height;
  double get avg => (size.width + size.height) / 2;

  /// Default horizontal page margin (4% of width).
  double get hSpacing => size.width * 0.04;

  /// Scale by [factor] of a chosen [basis], optionally clamped to [min]/[max].
  ///
  /// `scale(0.05, max: 100)` is `min(avg * 0.05, 100)`. Caps live here at the
  /// call site today; promote hot ones to named getters when they repeat.
  double scale(double factor, {SizeBasis basis = SizeBasis.avg, double? min, double? max}) {
    final double base = switch (basis) {
      SizeBasis.width => size.width,
      SizeBasis.height => size.height,
      SizeBasis.avg => avg,
    };
    return (base * factor).clamp(min ?? 0, max ?? double.infinity);
  }
}

/// Terse, reactive access to [AppSizing]: `context.sizing.avg * 0.25`.
extension SizingX on BuildContext {
  AppSizing get sizing => AppSizing(MediaQuery.sizeOf(this));
}
