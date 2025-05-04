import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:otherstory_app/features/global/widgets/custom_image_network.dart';
import 'package:otherstory_app/features/meditations_page/data/models/meditations_product_model.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<MeditationsProductModel> freeProducts;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const CustomCarouselSlider({
    super.key,
    required this.freeProducts,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: freeProducts.length,
      options: CarouselOptions(
        height: 350,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        enableInfiniteScroll: true,
        enlargeFactor: 0.16,
        initialPage: currentIndex,
        onPageChanged: (index, reason) {
          onPageChanged(index);
        },
      ),
      itemBuilder: (context, index, realIndex) {
        final product = freeProducts[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CustomImageNetwork(
            imageSource: product.imageSource,
            width: 350,
            height: 350,
            clipRadius: 16,
          ),
        );
      },
    );
  }
}
