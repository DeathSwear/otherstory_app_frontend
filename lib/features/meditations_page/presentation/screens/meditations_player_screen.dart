import 'package:flutter/material.dart';
import 'package:otherstory_app/features/meditations_page/data/models/meditations_product_model.dart';
import 'package:otherstory_app/features/meditations_page/presentation/widgets/product_app_bar.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class MeditationPlayerScreen extends StatelessWidget {
  final MeditationsProductModel product;

  const MeditationPlayerScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const MeditationAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView(
              children: [
                Image.network(
                  product.imageSource,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ],
            ),
          ),
          SizedBox(),
          Text(product.title,
              style: AppTextStyles.productPlayerTitleTextStyles),
          Text(product.subtitle,
              style: AppTextStyles.productPlayerSubtitleTextStyles),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: const Icon(Icons.skip_previous), onPressed: () {}),
              IconButton(icon: const Icon(Icons.play_arrow), onPressed: () {}),
              IconButton(icon: const Icon(Icons.skip_next), onPressed: () {}),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
