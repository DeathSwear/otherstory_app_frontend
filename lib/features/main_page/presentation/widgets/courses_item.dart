import 'package:flutter/material.dart';
import 'package:otherstory_app/features/global/widgets/custom_image_network.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_sizes.dart';
import 'package:otherstory_app/features/main_page/data/models/courses_item_data.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class CoursesItem extends StatelessWidget {
  const CoursesItem({super.key, required this.onPressed, required this.data});
  final VoidCallback onPressed;
  final CoursesItemData data;

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
                height: MainPageSizes.categoryCoursesImageHeight,
                width: MainPageSizes.categoryCoursesImageWidth,
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
          Text(
            data.name,
            style: AppTextStyles.categoryItemNameWhiteTheme,
          ),
          const SizedBox(
            height: MainPagePaddings.categoryCoursesNameBottom,
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
