import 'package:flutter/material.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_sizes.dart';

class ProfileScreenHeader extends StatelessWidget {
  const ProfileScreenHeader({super.key});

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
        ],
      ),
    );
  }
}
