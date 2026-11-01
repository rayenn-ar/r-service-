import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/primary_button.dart';
import '../widgets/splash_background.dart';
import '../widgets/splash_feature_item.dart';
import '../widgets/splash_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void _onStartPressed(BuildContext context) {
    // TODO(onboarding): naviguer vers AppRoutes.onboarding une fois l'écran créé.
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Stack(
          children: [
            const Positioned.fill(child: SplashBackground()),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.xl,
                  0,
                  AppSpacing.xl,
                  AppSpacing.xl,
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    const _Branding(),
                    const Spacer(),
                    _Footer(onStartPressed: () => _onStartPressed(context)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Branding extends StatelessWidget {
  const _Branding();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SplashLogo(),
        const SizedBox(height: AppSpacing.lg),
        Text(
          AppStrings.appName,
          style: AppTextStyles.displayLarge.copyWith(color: AppColors.white),
        ),
        const SizedBox(height: AppSpacing.lg),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 270),
          child: Text(
            SplashStrings.tagline,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.onPrimaryMuted,
            ),
          ),
        ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.onStartPressed});

  final VoidCallback onStartPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Wrap(
          alignment: WrapAlignment.center,
          spacing: 18,
          runSpacing: AppSpacing.xs,
          children: [
            SplashFeatureItem(
              iconAsset: AppIcons.truck,
              label: SplashStrings.fastDelivery,
            ),
            SplashFeatureItem(
              iconAsset: AppIcons.shieldCheck,
              label: SplashStrings.securePayment,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        PrimaryButton(
          label: SplashStrings.startShopping,
          onPressed: onStartPressed,
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.textPrimary,
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          AppStrings.appVersion,
          style: AppTextStyles.labelMedium.copyWith(
            color: AppColors.onPrimaryMuted,
          ),
        ),
      ],
    );
  }
}
