import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/round_back_button.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool allRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              const SizedBox(height: 16),
              sectionTitle('AUJOURD’HUI'),
              const SizedBox(height: 12),
              notificationCard(
                icon: Icons.local_shipping_outlined,
                iconColor: AppColors.green,
                iconBackground: AppColors.veryLightGreen,
                title: 'Commande expédiée',
                time: '10:42',
                text: 'Votre commande #RS-1042 est en route. Livraison prévue lundi 20 oct.',
                isUnread: true,
              ),
              const SizedBox(height: 12),
              notificationCard(
                icon: Icons.sell_outlined,
                iconColor: AppColors.brown,
                iconBackground: AppColors.veryLightOrange,
                title: 'Vente flash : −20 % sur la mode',
                time: '09:00',
                text: 'Seulement aujourd’hui, sur une sélection de vêtements et chaussures.',
                isUnread: true,
              ),
              const SizedBox(height: 12),
              notificationCard(
                icon: Icons.favorite_border,
                iconColor: AppColors.pink,
                iconBackground: AppColors.veryLightPink,
                title: 'Un favori est en promo',
                time: '08:15',
                text: 'Sneakers Urban blanches : 120,000 DT au lieu de 150,000 DT.',
              ),
              const SizedBox(height: 16),
              sectionTitle('CETTE SEMAINE'),
              const SizedBox(height: 12),
              notificationCard(
                icon: Icons.check,
                iconColor: AppColors.green,
                iconBackground: AppColors.veryLightGreen,
                title: 'Commande livrée',
                time: 'Mer.',
                text:
                    'Votre commande #RS-1038 a été livrée. Bonne utilisation !',
              ),
              const SizedBox(height: 12),
              notificationCard(
                icon: Icons.star_border,
                iconColor: AppColors.brown,
                iconBackground: AppColors.veryLightOrange,
                title: 'Donnez votre avis',
                time: 'Mar.',
                text: 'Qu’avez-vous pensé de la Lampe de bureau LED ?',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        const RoundBackButton(),
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'Notifications',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            setState(() {
              allRead = true;
            });
          },
          child: const Text(
            'Tout lire',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.mediumGrey,
        fontSize: 12,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.6,
      ),
    );
  }

  Widget notificationCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBackground,
    required String title,
    required String time,
    required String text,
    bool isUnread = false,
  }) {
    final showUnread = isUnread && !allRead;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: showUnread ? AppColors.unreadBorder : Colors.transparent,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      time,
                      style: const TextStyle(
                        color: AppColors.mediumGrey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 13,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
          // Petit point vert : notification non lue
          if (showUnread) ...[
            const SizedBox(width: 12),
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(top: 6),
              decoration: const BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
