import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Styles de texte basés sur la police Manrope (police variable embarquée).
abstract final class AppTextStyles {
  static const String fontFamily = 'Manrope';

  static TextStyle _manrope(
    double size,
    FontWeight weight, {
    double? height,
    double? letterSpacing,
    Color color = AppColors.textPrimary,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: weight,
      // Police variable : l'axe "wght" doit être renseigné explicitement.
      fontVariations: [FontVariation.weight(weight.value.toDouble())],
      height: height == null ? null : height / size,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static final TextStyle displayLarge =
      _manrope(40, FontWeight.w800, letterSpacing: -0.5);
  static final TextStyle headlineMedium = _manrope(26, FontWeight.w800);
  static final TextStyle titleLarge = _manrope(20, FontWeight.w700);
  static final TextStyle titleMedium = _manrope(16, FontWeight.w700);
  static final TextStyle bodyLarge = _manrope(16, FontWeight.w400, height: 24);
  static final TextStyle bodyMedium = _manrope(15, FontWeight.w500);
  static final TextStyle bodySmall = _manrope(14, FontWeight.w400);
  static final TextStyle labelLarge = _manrope(16, FontWeight.w700);
  static final TextStyle labelMedium = _manrope(13, FontWeight.w500);
  static final TextStyle labelSmall = _manrope(12, FontWeight.w600);
}
