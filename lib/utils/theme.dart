import 'package:flutter/material.dart';

import 'colors.dart';

/// Semantic color tokens for the app, exposed through [ThemeData] so widgets
/// read colors from the theme instead of hardcoding hex literals.
///
/// Access via `context.appColors.success` (see [AppColorsX]). Built from the
/// raw palette in colors.dart, which stays the single source of truth.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color brand;
  final Color cardBorder;
  final Color success;
  final Color glassFill;

  const AppColors({
    required this.brand,
    required this.cardBorder,
    required this.success,
    required this.glassFill,
  });

  static const AppColors dark = AppColors(
    brand: colorPrimary,
    cardBorder: colorBorder,
    success: colorSuccess,
    glassFill: Color(0x14FFFFFF), // white @ 8%
  );

  @override
  AppColors copyWith({Color? brand, Color? cardBorder, Color? success, Color? glassFill}) {
    return AppColors(
      brand: brand ?? this.brand,
      cardBorder: cardBorder ?? this.cardBorder,
      success: success ?? this.success,
      glassFill: glassFill ?? this.glassFill,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      brand: Color.lerp(brand, other.brand, t)!,
      cardBorder: Color.lerp(cardBorder, other.cardBorder, t)!,
      success: Color.lerp(success, other.success, t)!,
      glassFill: Color.lerp(glassFill, other.glassFill, t)!,
    );
  }
}

/// Terse access to [AppColors]: `context.appColors.success`.
extension AppColorsX on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}

/// The app's single [ThemeData]. Centralizes the font, brand color, and the
/// [AppColors] token set so individual widgets don't repeat literals.
ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.dark(useMaterial3: true);

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(primary: colorPrimary),
    textTheme: base.textTheme.apply(fontFamily: 'Montserrat'),
    extensions: const <ThemeExtension<dynamic>>[AppColors.dark],
  );
}
