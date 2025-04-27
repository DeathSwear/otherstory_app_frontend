import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:otherstory_app/features/global/widgets/custom_image_network.dart';
import 'package:otherstory_app/features/meditations_page/data/models/meditations_product_model.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.products,
  });

  final MeditationsProductModel products;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: AppColors.greyContainerCardColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(products.time,
                          style: AppTextStyles.productCardSubtitleTextStyles),
                      const SizedBox(height: 4),
                      Text(products.title,
                          style: AppTextStyles.productCardTitleTextStyles),
                      const SizedBox(height: 4),
                      Text(products.subtitle,
                          style: AppTextStyles.productCardSubtitleTextStyles),
                    ],
                  ),
                ),
              ),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 111,
                  minWidth: 80,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: AppColors.greyContainerCardColor,
                ),
                child: CustomImageNetwork(
                  imageSource: products.imageSource,
                  width: 60,
                  clipRadius: 13,
                ),
              ),
            ],
          ),
        ),
        if (!products.isFree)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.01),
                ),
              ),
            ),
          ),
        if (!products.isFree)
          const Positioned.fill(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock, size: 30, color: AppColors.blackColor),
                  SizedBox(width: 8),
                  Text(
                    'Доступно только по подписке',
                    style: AppTextStyles.notFreeTextStyles,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
