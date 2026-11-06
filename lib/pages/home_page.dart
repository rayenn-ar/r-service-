import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/product_card.dart';
import 'notifications_page.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const BottomNav(currentIndex: 0),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(context),
              const SizedBox(height: 18),
              searchBar(context),
              const SizedBox(height: 18),
              offerBanner(),
              const SizedBox(height: 18),
              sectionTitle('Catégories'),
              const SizedBox(height: 12),
              categories(),
              const SizedBox(height: 18),
              sectionTitle('Populaires'),
              const SizedBox(height: 12),
              products(),
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 14,
                    color: AppColors.green,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Livrer à · Les Berges du Lac, Tunis',
                    style: TextStyle(color: AppColors.grey, fontSize: 13),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Text(
                'Bonjour, Rayen',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsPage(),
              ),
            );
          },
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.notifications_none,
                  size: 20,
                  color: AppColors.black,
                ),
                // Point rouge : nouvelle notification
                Positioned(
                  top: 10,
                  right: 11,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget searchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, size: 18, color: AppColors.grey),
                  SizedBox(width: 10),
                  Text(
                    'Rechercher un produit...',
                    style: TextStyle(color: AppColors.mediumGrey, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.filter_list,
            size: 20,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget offerBanner() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -30,
            right: -40,
            child: Container(
              width: 170,
              height: 170,
              decoration: const BoxDecoration(
                color: AppColors.darkGreen,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'OFFRE DE LA SEMAINE',
                        style: TextStyle(
                          color: AppColors.lightOrange,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '−30 % sur\nl’électronique',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          height: 1.15,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Jusqu’au 31 octobre',
                        style: TextStyle(
                          color: AppColors.lightGreenText,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 36,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orange,
                            foregroundColor: AppColors.black,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'J’en profite',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 104,
                  height: 104,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.headphones_outlined,
                    size: 56,
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Text(
          'Tout voir',
          style: TextStyle(
            color: AppColors.green,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget categories() {
    return Row(
      children: [
        category(
          Icons.smartphone,
          'Électronique',
          AppColors.green,
          AppColors.veryLightGreen,
        ),
        const SizedBox(width: 6),
        category(
          Icons.checkroom,
          'Mode',
          AppColors.blue,
          AppColors.veryLightBlue,
        ),
        const SizedBox(width: 6),
        category(
          Icons.chair_outlined,
          'Maison',
          AppColors.brown,
          AppColors.veryLightOrange,
        ),
        const SizedBox(width: 6),
        category(
          Icons.brush_outlined,
          'Beauté',
          AppColors.pink,
          AppColors.veryLightPink,
        ),
        const SizedBox(width: 6),
        category(
          Icons.sports_basketball_outlined,
          'Sport',
          AppColors.darkGrey,
          AppColors.veryLightGrey,
        ),
      ],
    );
  }

  Widget category(IconData icon, String name, Color color, Color background) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, size: 24, color: color),
          ),
          const SizedBox(height: 8),
          // Réduit un peu le texte s'il est trop long pour la colonne
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget products() {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 244,
      ),
      children: const [
        ProductCard(
          name: 'Écouteurs sans fil Pro',
          rating: '4,8',
          reviews: '326',
          price: '89,000 DT',
          oldPrice: '129,000 DT',
          icon: Icons.headphones_outlined,
          iconColor: AppColors.green,
          backgroundColor: AppColors.veryLightGreen,
          isPromo: true,
        ),
        ProductCard(
          name: 'Sneakers Urban blanches',
          rating: '4,7',
          reviews: '412',
          price: '120,000 DT',
          oldPrice: '150,000 DT',
          icon: Icons.directions_run,
          iconColor: AppColors.darkGrey,
          backgroundColor: AppColors.veryLightGrey,
          isPromo: true,
          isFavorite: true,
        ),
        ProductCard(
          name: 'Parfum Ambre 100 ml',
          rating: '4,9',
          reviews: '251',
          price: '98,000 DT',
          oldPrice: '115,000 DT',
          icon: Icons.sanitizer_outlined,
          iconColor: AppColors.pink,
          backgroundColor: AppColors.veryLightPink,
          isPromo: true,
        ),
        ProductCard(
          name: 'Montre connectée S3',
          rating: '4,6',
          reviews: '184',
          price: '159,000 DT',
          icon: Icons.watch_outlined,
          iconColor: AppColors.blue,
          backgroundColor: AppColors.veryLightBlue,
        ),
      ],
    );
  }
}
