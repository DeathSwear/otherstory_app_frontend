import 'package:flutter/material.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_sizes.dart';
import 'package:otherstory_app/theme/app_strings.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class MainScreenHeader extends StatelessWidget {
  const MainScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: MainPagePaddings.categoryHorizontal,
          vertical: MainPagePaddings.headerVertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/png/notify.png',
                height: MainPageSizes.headerIconSize,
              ),
            ),
          ),
          const SizedBox(
            height: MainPagePaddings.headerAdditionalSpacer,
          ),
          const Text(
            AppStrings.mainScreenTitle,
            style: AppTextStyles.screenTitle,
          ),
        ],
      ),
    );
  }
}
