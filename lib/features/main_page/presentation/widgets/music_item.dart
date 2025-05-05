import 'package:flutter/material.dart';
import 'package:otherstory_app/features/global/widgets/custom_image_network.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_sizes.dart';
import 'package:otherstory_app/features/main_page/data/models/music_item_data.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class MusicItem extends StatelessWidget {
  const MusicItem({super.key, required this.onPressed, required this.data});
  final VoidCallback onPressed;
  final MusicItemData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MainPageSizes.categoryMusicImageSize,
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageNetwork(
              height: MainPageSizes.categoryMusicImageSize,
              width: MainPageSizes.categoryMusicImageSize,
              imageSource: data.imageSource,
              clipRadius: 100,
            ),
            const SizedBox(
              height: MainPagePaddings.categoryItemImageBottom,
            ),
            Text(
              data.name,
              style: AppTextStyles.categoryItemNameWhiteTheme,
            ),
            const SizedBox(
              height: MainPagePaddings.categoryItemSpacer,
            ),
            Text(
              data.decsription,
              style: AppTextStyles.categoryItemDescription1,
            ),
          ],
        ),
      ),
    );
  }
}
