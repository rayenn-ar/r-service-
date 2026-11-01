import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Logo R-service : sac de courses avec le badge « R ».
class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  static const double _size = 96;
  static const double _badgeSize = 34;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: _size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(AppIcons.shoppingBag, width: 48, height: 48),
          ),
          Positioned(
            right: -6,
            bottom: -6,
            child: Container(
              width: _badgeSize,
              height: _badgeSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'R',
                style: AppTextStyles.labelLarge.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontVariations: const [FontVariation.weight(800)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
