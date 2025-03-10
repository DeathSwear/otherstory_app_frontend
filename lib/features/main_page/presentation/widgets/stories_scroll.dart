import 'package:flutter/material.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_sizes.dart';
import 'package:otherstory_app/features/main_page/data/models/stories_item_data.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/stories_item.dart';

class StoriesScroll extends StatelessWidget {
  final List<StoriesItemData> data;

  const StoriesScroll({
    super.key,
    required this.data,
  });

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
              right: index == data.length - 1
                  ? MainPagePaddings.categoryHorizontal
                  : MainPagePaddings.storiesHorizontal),
          child: StoriesItem(onPressed: () {}, data: data[index]),
        ),
        itemCount: data.length,
      ),
    );
  }
}
