import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String rating;
  final String reviews;
  final String price;
  final String? oldPrice;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final bool isPromo;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.price,
    this.oldPrice,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    this.isPromo = false,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productImage(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                ratingRow(),
                const SizedBox(height: 6),
                priceRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productImage() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 128,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, size: 54, color: iconColor),
        ),
        if (isPromo)
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Promo',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 16,
              color: isFavorite ? AppColors.red : AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget ratingRow() {
    return Row(
      children: [
        const Icon(Icons.star, size: 13, color: AppColors.orange),
        const SizedBox(width: 4),
        Text(
          rating,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          ' ($reviews)',
          style: const TextStyle(color: AppColors.grey, fontSize: 12),
        ),
      ],
    );
  }

  Widget priceRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (oldPrice != null)
                Text(
                  oldPrice!,
                  style: const TextStyle(
                    color: AppColors.mediumGrey,
                    fontSize: 11,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
            ],
          ),
        ),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.add, size: 18, color: AppColors.white),
        ),
      ],
    );
  }
}
