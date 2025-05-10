import 'package:flutter/material.dart';
import 'package:otherstory_app/features/card_day_page/data/constants/card_day_constants.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class CardStatusRow extends StatelessWidget {
  const CardStatusRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: CardDayConstants.textVerticalPadding / 2),
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text('New', style: AppTextStyles.newCardDay),
        ),
        const SizedBox(width: 16),
        Text(
          '8 / 50 собрано',
          style: AppTextStyles.newCardDay.copyWith(color: AppColors.blackColor),
        ),
      ],
    );
  }
}
