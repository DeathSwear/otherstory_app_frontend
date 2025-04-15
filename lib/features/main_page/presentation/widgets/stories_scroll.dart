import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_sizes.dart';
import 'package:otherstory_app/features/main_page/data/models/stories_item_data.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/stories_item.dart';
import '../../data/models/story_content_model.dart';

class StoriesScroll extends StatelessWidget {
  final List<StoriesItemData> thumbnails;
  final List<StoryContentModel> fullStories;

  const StoriesScroll({
    super.key,
    required this.thumbnails,
    required this.fullStories,
  }) : assert(thumbnails.length == fullStories.length,
            "Thumbnails and stories must have the same length");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MainPageSizes.storiesBorderWidth * 2 + MainPageSizes.storiesImageSize,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            left: index == 0 ? MainPagePaddings.categoryHorizontal : 0,
            right: index == thumbnails.length - 1
                ? MainPagePaddings.categoryHorizontal
                : MainPagePaddings.storiesHorizontal,
          ),
          child: GestureDetector(
            onTap: () {
              if (index < fullStories.length) {
                context.push(
                  '/story?index=$index',
                  extra: fullStories,
                );
              }
            },
            child: StoriesItem(data: thumbnails[index]),
          ),
        ),
        itemCount: thumbnails.length,
      ),
    );
  }
}
