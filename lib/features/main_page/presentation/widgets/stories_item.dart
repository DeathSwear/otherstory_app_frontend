import 'package:flutter/material.dart';
import 'package:otherstory_app/features/global/widgets/custom_image_network.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_sizes.dart';
import 'package:otherstory_app/features/main_page/data/models/stories_item_data.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class StoriesItem extends StatelessWidget {
  const StoriesItem({super.key, required this.data});
  final StoriesItemData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MainPageSizes.storiesImageSize,
      width: MainPageSizes.storiesImageSize,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: data.isChecked
                        ? AppColors.checkedStoryColor
                        : AppColors.blackColor,
                    width: MainPageSizes.storiesBorderWidth),
                borderRadius: BorderRadius.circular(
                    MainPageSizes.storiesImageSizeImageClipRadius)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.whiteColor,
                      width: MainPageSizes.storiesBorderWidth),
                  borderRadius: BorderRadius.circular(
                      MainPageSizes.storiesImageSizeImageClipRadius)),
              child: CustomImageNetwork(
                height: MainPageSizes.storiesImageSize,
                width: MainPageSizes.storiesImageSize,
                imageSource: data.imageSource,
                clipRadius: MainPageSizes.storiesImageSizeImageClipRadius,
                darken: true,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding:
                  const EdgeInsets.all(MainPagePaddings.storiesImageNameAll),
              child: Text(
                maxLines: 3,
                data.title,
                style: AppTextStyles.storiesText,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(
                  MainPageSizes.storiesImageSizeImageClipRadius),
            ),
          ),
        ],
      ),
    );
  }
}
