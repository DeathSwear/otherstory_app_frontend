import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';
import '../../constants/profile_page_sizes.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.title,
    required this.icon,
    this.showDivider = false,
  });

  final String title;
  final String icon;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    icon,
                    height: ProfilePageSizes.profileIconSize,
                    width: ProfilePageSizes.profileIconSize,
                  ),
                  const SizedBox(width: ProfilePageSizes.profileIconRight),
                  Text(
                    title,
                    style: AppTextStyles.profileCardTitle,
                  ),
                ],
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                color: AppColors.labels1Color,
              ),
            ],
          ),
        ),
        if (showDivider)
          const Padding(
            padding:
                EdgeInsets.only(left: ProfilePageSizes.profileDividerRight),
            child: Divider(height: 0.33, color: AppColors.profileDividerColor),
          ),
      ],
    );
  }
}
