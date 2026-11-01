import 'package:flutter/material.dart';

/// Palette de l'application, extraite des maquettes (design/figma).
abstract final class AppColors {
  // Marque
  static const Color primary = Color(0xFF0E6B57);
  static const Color primaryDark = Color(0xFF0A4F40);
  static const Color primarySurface = Color(0xFFE7F2EE);
  static const Color onPrimaryMuted = Color(0xFFD7EDE6);

  static const Color accent = Color(0xFFE5A03A);
  static const Color accentLight = Color(0xFFF5C77A);
  static const Color accentSurface = Color(0xFFFFF1DC);

  // Texte
  static const Color textPrimary = Color(0xFF16201B);
  static const Color textBody = Color(0xFF3F4A44);
  static const Color textSecondary = Color(0xFF5B6660);
  static const Color textTertiary = Color(0xFF8A938D);

  // Surfaces & bordures
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF5F6F2);
  static const Color surfaceMuted = Color(0xFFF0F2EE);
  static const Color border = Color(0xFFD9DDD6);
  static const Color divider = Color(0xFFE2E5DF);

  // États
  static const Color error = Color(0xFFC2410C);
  static const Color warning = Color(0xFFB7791F);
  static const Color info = Color(0xFF2F5DA8);
}
