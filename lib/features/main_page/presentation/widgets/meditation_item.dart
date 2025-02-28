import 'package:flutter/material.dart';
import 'package:otherstory_app/features/global/widgets/custom_image_network.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_sizes.dart';
import 'package:otherstory_app/features/main_page/data/models/meditations_item_data.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class MeditationsItem extends StatelessWidget {
  const MeditationsItem(
      {super.key, required this.onPressed, required this.data});
  final VoidCallback onPressed;
  final MeditationsItemData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MainPageSizes.categoryMeditationImageWidth,
      child: Stack(
        children: [
          CustomImageNetwork(
            height: MainPageSizes.categoryMeditationImageHeight,
            width: MainPageSizes.categoryMeditationImageWidth,
            imageSource: data.imageSource,
            clipRadius: MainPageSizes.categoryMeditationImageClipRadius,
            darken: true,
          ),
          Padding(
            padding:
                const EdgeInsets.all(MainPagePaddings.categoryMeditationInside),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: AppTextStyles.categoryItemNameForeground,
                ),
                const SizedBox(
                  height: MainPagePaddings.categoryItemSpacer,
                ),
                Text(
                  data.decsription,
                  style: AppTextStyles.categoryItemDescription1,
                ),
                const SizedBox(
                  height: MainPagePaddings.categoryItemSpacer,
                ),
                Text(
                  data.hours,
                  style: AppTextStyles.categoryItemDescription3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
