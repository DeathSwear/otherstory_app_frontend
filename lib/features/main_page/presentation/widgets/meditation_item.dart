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
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.transparent,
                  Color.fromARGB(255, 223, 161, 80),
                ])),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(
                    MainPagePaddings.categoryMeditationInside),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(
                  MainPageSizes.categoryMeditationImageClipRadius),
              onTap: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
