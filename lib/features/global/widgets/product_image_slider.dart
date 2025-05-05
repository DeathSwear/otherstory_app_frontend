import 'package:flutter/material.dart';
import 'package:otherstory_app/features/global/widgets/custom_image_network.dart';
import 'package:otherstory_app/features/main_page/data/models/abstract_product_card_data.dart';

class ProductImageSlider extends StatelessWidget {
  final List<ProductCardData> freeData;
  final int currentIndex;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  const ProductImageSlider({
    super.key,
    required this.freeData,
    required this.currentIndex,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      alignment: Alignment.center,
      child: PageView.builder(
        controller: pageController,
        itemCount: freeData.length,
        itemBuilder: (context, index) {
          final isCurrent = index == currentIndex;
          return AnimatedScale(
            duration: const Duration(milliseconds: 300),
            scale: isCurrent ? 1.0 : 0.85,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(
                vertical: isCurrent ? 0 : 20,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: CustomImageNetwork(
                  imageSource: freeData[index].imageSource,
                  clipRadius: 13,
                ),
              ),
            ),
          );
        },
        onPageChanged: onPageChanged,
      ),
    );
  }
}
