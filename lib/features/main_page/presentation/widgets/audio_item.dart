import 'package:flutter/material.dart';
import 'package:otherstory_app/features/global/widgets/custom_image_network.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_sizes.dart';
import 'package:otherstory_app/features/main_page/data/models/audio_item_data.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class AudioItem extends StatelessWidget {
  const AudioItem({super.key, required this.onPressed, required this.data});
  final VoidCallback onPressed;
  final AudioItemData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MainPageSizes.categoryCoursesImageWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CustomImageNetwork(
                height: MainPageSizes.categoryAudioImageSize,
                width: MainPageSizes.categoryAudioImageSize,
                imageSource: data.imageSource,
                clipRadius: MainPageSizes.categoryCoursesImageClipRadius,
                darken: true,
              ),
              Padding(
                padding: const EdgeInsets.all(
                    MainPagePaddings.categoryCoursesImageNameAll),
                child: Text(
                  data.name,
                  style: AppTextStyles.categoryItemNameForeground,
                ),
              )
            ],
          ),
          const SizedBox(
            height: MainPagePaddings.categoryItemImageBottom,
          ),
          Text(
            data.decsription,
            style: AppTextStyles.categoryItemDescription1,
          )
        ],
      ),
    );
  }
}
