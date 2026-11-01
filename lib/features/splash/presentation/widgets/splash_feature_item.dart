import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Atout affiché en bas du splash (icône + libellé).
class SplashFeatureItem extends StatelessWidget {
  const SplashFeatureItem({
    super.key,
    required this.iconAsset,
    required this.label,
  });

  final String iconAsset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(iconAsset, width: 16, height: 16),
        const SizedBox(width: AppSpacing.xs),
        Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(
            color: AppColors.onPrimaryMuted,
          ),
        ),
      ],
    );
  }
}
