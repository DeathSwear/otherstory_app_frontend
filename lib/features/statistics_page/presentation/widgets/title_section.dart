import 'package:flutter/material.dart';
import '../../../../theme/app_text_styles.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, this.title, required this.icon, required this.child});

  final String? title;
  final String icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 25.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title!, style: AppTextStyles.categoryTitleWhiteTheme),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(120, 120, 128, 0.12),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  children: [
                    const Text('Править',
                        style: AppTextStyles.statScreenHabitSettingsTextColor),
                    const SizedBox(width: 5),
                    Image.asset(icon)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8.5),
         child,
        ],
      ),
    );
  }
}
