import 'package:flutter/material.dart';
import 'package:otherstory_app/theme/app_strings.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';

class StatisticButton extends StatelessWidget {
  const StatisticButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: AppColors.blackColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/png/statistic_button_icon.png'),
            const SizedBox(width: 10),
            const Text(
              AppStrings.statisticButtonText,
              style: AppTextStyles.statisticResultButtonTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
