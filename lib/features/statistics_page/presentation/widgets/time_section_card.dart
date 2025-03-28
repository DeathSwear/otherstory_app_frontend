import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';

class TimeSectionCard extends StatelessWidget {
  const TimeSectionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
    required this.isSelected,
  });

  final String image;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.morningSection
                : AppColors.evenintSection,
            borderRadius: BorderRadius.circular(13),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image),
              const SizedBox(height: 8),
              Text(
                title,
                style: isSelected
                    ? AppTextStyles.statisticsTitleSectionEnable
                    : AppTextStyles.statisticsTitleSectionDissable,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: isSelected
                    ? AppTextStyles.timeSectionSubtitleEnable
                    : AppTextStyles.timeSectionSubtitleDissable,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
