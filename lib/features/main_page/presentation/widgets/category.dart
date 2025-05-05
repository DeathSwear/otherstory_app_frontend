import 'package:flutter/material.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/category_button.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class Category extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final double height;
  final VoidCallback onPressed;

  const Category({
    super.key,
    required this.title,
    required this.children,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: MainPagePaddings.categoryHorizontal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: AppTextStyles.categoryTitleWhiteTheme),
              CategoryButton(
                onPressed: onPressed,
              ),
            ],
          ),
        ),
        const SizedBox(height: MainPagePaddings.categoryTitleBottom),
        SizedBox(
          height: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                  left: index == 0 ? MainPagePaddings.categoryHorizontal : 0,
                  right: MainPagePaddings.categoryHorizontal),
              child: children[index],
            ),
            itemCount: children.length,
          ),
        ),
      ],
    );
  }
}
