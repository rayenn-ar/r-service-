import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  void goToLogin() {
    // On ira vers la page Connexion (page 3).
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: goToLogin,
                  child: const Text(
                    'Passer',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Expanded(
                // Défilable pour ne pas déborder sur les petits écrans
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        illustration(),
                        const SizedBox(height: 36),
                        const SizedBox(
                          width: 300,
                          child: Text(
                            'Des milliers de produits',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const SizedBox(
                          width: 300,
                          child: Text(
                            'Électronique, mode, maison, beauté : trouvez tout au même endroit, aux meilleurs prix.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 15,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 36),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [dot(true)],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              PrimaryButton(text: 'Suivant', onPressed: goToLogin),
            ],
          ),
        ),
      ),
    );
  }

  Widget illustration() {
    return Container(
      width: 260,
      height: 260,
      decoration: const BoxDecoration(
        color: AppColors.veryLightGreen,
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Grand carré vert au centre
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(44),
            ),
            child: const Icon(
              Icons.grid_view_rounded,
              size: 72,
              color: AppColors.white,
            ),
          ),
          // Petites cartes autour
          Positioned(
            top: 34,
            left: 18,
            child: smallCard(
              Icons.sell_outlined,
              AppColors.brown,
              AppColors.veryLightOrange,
            ),
          ),
          Positioned(
            bottom: 30,
            right: 14,
            child: smallCard(
              Icons.favorite_border,
              AppColors.red,
              AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget smallCard(IconData icon, Color iconColor, Color backgroundColor) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, size: 24, color: iconColor),
    );
  }

  // Le point actif est plus long et vert
  Widget dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 28 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? AppColors.green : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
