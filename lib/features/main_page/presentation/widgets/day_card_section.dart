import 'package:flutter/material.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class DayCardSection extends StatelessWidget {
  const DayCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 166,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: MainPagePaddings.categoryHorizontal,
              ),
              child: Container(
                height: 102,
                width: MediaQuery.of(context).size.width -
                    MainPagePaddings.categoryHorizontal * 2,
                decoration: BoxDecoration(
                  color: AppColors.cardsBackColor,
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/png/cards.png',
              height: 166,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Карта дня',
                  style: AppTextStyles.mainscreenCardsTitle,
                ),
                Text(
                    textAlign: TextAlign.center,
                    'Получите персональное наставление\nна день от творческой личности',
                    style: AppTextStyles.mainscreenCardsDecription),
                SizedBox(
                  height: 19,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
