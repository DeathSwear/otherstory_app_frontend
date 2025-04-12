import 'package:flutter/material.dart';
import '../../../../theme/app_strings.dart';
import '../../../../theme/app_text_styles.dart';
import '../../../main_page/data/constants/main_page_paddings.dart';
import '../../../main_page/data/constants/main_page_sizes.dart';

class StatisticsScreenHeader extends StatelessWidget {
  const StatisticsScreenHeader({super.key});

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/png/calendar.png',
                      height: MainPageSizes.headerIconSize,
                    ),
                    const SizedBox(width: 16),
                    Image.asset(
                      'assets/png/notes.png',
                      height: MainPageSizes.headerIconSize,
                    ),
                  ],
                )),
          ),
          const Text(
            AppStrings.statisticsScreenTitle,
            style: AppTextStyles.screenTitle,
          ),
          const SizedBox(
            height: MainPagePaddings.headerAdditionalSpacer,
          ),
        ],
      ),
    );
  }
}
