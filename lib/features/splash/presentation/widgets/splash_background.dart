import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Cercles décoratifs en arrière-plan du splash.
class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: -120,
          right: -150,
          child: _Circle(diameter: 360, opacity: 0.7),
        ),
        Positioned(
          bottom: 120,
          left: -110,
          child: _Circle(diameter: 220, opacity: 0.6),
        ),
      ],
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({required this.diameter, required this.opacity});

  final double diameter;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryDark.withValues(alpha: opacity),
      ),
    );
  }
}
