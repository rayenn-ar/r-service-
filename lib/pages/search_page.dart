import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/round_back_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController(text: 'écouteurs');
  List<String> recentSearches = ['sneakers', 'montre', 'parfum femme'];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = searchController.text;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const RoundBackButton(),
                  const SizedBox(width: 10),
                  Expanded(child: searchField()),
                ],
              ),
              if (recentSearches.isNotEmpty) ...[
                const SizedBox(height: 18),
                recentSection(),
              ],
              const SizedBox(height: 18),
              trendsSection(),
              if (query.isNotEmpty) ...[
                const SizedBox(height: 18),
                resultsSection(query),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget searchField() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.green, width: 1.5),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, size: 18, color: AppColors.green),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: searchController,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration.collapsed(hintText: ''),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                searchController.clear();
              });
            },
            child: const Icon(Icons.close, size: 16, color: AppColors.grey),
          ),
        ],
      ),
    );
  }

  Widget recentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            sectionTitle('Recherches récentes'),
            GestureDetector(
              onTap: () {
                setState(() {
                  recentSearches.clear();
                });
              },
              child: const Text(
                'Effacer',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [for (final search in recentSearches) recentChip(search)],
        ),
      ],
    );
  }

  Widget recentChip(String search) {
    return Container(
      height: 36,
      padding: const EdgeInsets.only(left: 14, right: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.access_time, size: 14, color: AppColors.mediumGrey),
          const SizedBox(width: 6),
          Text(
            search,
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () {
              setState(() {
                recentSearches.remove(search);
              });
            },
            child: const SizedBox(
              width: 20,
              height: 20,
              child: Icon(Icons.close, size: 12, color: AppColors.mediumGrey),
            ),
          ),
        ],
      ),
    );
  }

  Widget trendsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle('Tendances'),
        const SizedBox(height: 8),
        trendRow('1', 'Smartphones'),
        const SizedBox(height: 4),
        trendRow('2', 'Sacs à dos'),
      ],
    );
  }

  Widget trendRow(String number, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Text(
              number,
              style: const TextStyle(
                color: AppColors.green,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right,
            size: 16,
            color: AppColors.mediumGrey,
          ),
        ],
      ),
    );
  }

  Widget resultsSection(String query) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: sectionTitle('Résultats pour « $query »')),
            const Text(
              '12',
              style: TextStyle(color: AppColors.grey, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 12),
        resultCard(
          icon: Icons.headphones_outlined,
          iconColor: AppColors.green,
          iconBackground: AppColors.veryLightGreen,
          name: 'Écouteurs sans fil Pro',
          details: '4,8 · Audio',
          price: '89,000 DT',
          oldPrice: '129,000 DT',
        ),
        const SizedBox(height: 10),
        resultCard(
          icon: Icons.watch_outlined,
          iconColor: AppColors.blue,
          iconBackground: AppColors.veryLightBlue,
          name: 'Montre connectée S3',
          details: '4,6 · Montres',
          price: '159,000 DT',
        ),
        const SizedBox(height: 10),
        resultCard(
          icon: Icons.smartphone,
          iconColor: AppColors.blue,
          iconBackground: AppColors.veryLightBlue,
          name: 'Smartphone A15 128 Go',
          details: '4,7 · Téléphones',
          price: '749,000 DT',
          oldPrice: '799,000 DT',
        ),
      ],
    );
  }

  Widget resultCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBackground,
    required String name,
    required String details,
    required String price,
    String? oldPrice,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, size: 30, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(Icons.star, size: 12, color: AppColors.orange),
                    const SizedBox(width: 4),
                    Text(
                      details,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (oldPrice != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        oldPrice,
                        style: const TextStyle(
                          color: AppColors.mediumGrey,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Icon(
            Icons.chevron_right,
            size: 18,
            color: AppColors.mediumGrey,
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 15,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
