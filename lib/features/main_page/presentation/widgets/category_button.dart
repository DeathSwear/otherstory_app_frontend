import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_sizes.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import 'package:otherstory_app/theme/app_strings.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';
import 'package:otherstory_app/theme/image_source.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: AppColors.categoryButtonBackgroundWhiteThemeColor,
          padding: const EdgeInsets.symmetric(
            horizontal: MainPagePaddings.categoryButtonInsideHorizontal,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding:
                EdgeInsets.only(bottom: MainPagePaddings.categoryButtonTextUp),
            child: Text(
              AppStrings.categoryButton,
              style: AppTextStyles.categoryButtonTextWhiteTheme,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: MainPagePaddings.categoryButtonIconRight,
                left: MainPagePaddings.categoryButtonIconRight),
            child: SvgPicture.asset(
              ImageSource.triangleArrowRight,
              height: MainPageSizes.categoryButtonIconHeight,
              colorFilter:
                  const ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
