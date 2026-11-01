import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/primary_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Stack(
        children: [
          Positioned(top: -120, right: -150, child: circle(360, 0.7)),
          Positioned(bottom: 120, left: -110, child: circle(220, 0.6)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
              child: Column(
                children: [
                  const Spacer(),
                  logo(),
                  const SizedBox(height: 20),
                  const Text(
                    'R-service',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    width: 270,
                    child: Text(
                      'Achetez tout ce qu’il vous faut, livré directement chez vous.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.lightGreenText,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      feature(
                        Icons.local_shipping_outlined,
                        'Livraison rapide',
                      ),
                      const SizedBox(width: 18),
                      feature(
                        Icons.verified_user_outlined,
                        'Paiement sécurisé',
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  PrimaryButton(
                    text: 'Commencer mes achats',
                    color: AppColors.orange,
                    textColor: AppColors.black,
                    onPressed: () {
                      //On ira vers la page Onboarding
                    },
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget circle(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.darkGreen.withValues(alpha: opacity),
      ),
    );
  }

  Widget logo() {
    return SizedBox(
      width: 96,
      height: 96,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Center(
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 48,
                color: AppColors.green,
              ),
            ),
          ),
          // Petit badge "R" en bas à droite
          Positioned(
            right: -6,
            bottom: -6,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'R',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget feature(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.lightOrange),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.lightGreenText,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
