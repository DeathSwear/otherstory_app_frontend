import 'package:flutter/material.dart';
import '../../../../theme/app_text_styles.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    this.settingsText, required this.onPressed,
  });

  final String title;
  final String icon;
  final String? settingsText;
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25.5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: AppTextStyles.categoryTitleWhiteTheme),
              GestureDetector(
                onTap: onPressed,
                child: Container(
                  height: 28,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(120, 120, 128, 0.12),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Row(
                    children: [
                      if (settingsText != null) ...[
                        Text(
                          settingsText!,
                          style: AppTextStyles.statScreenHabitSettingsTextColor,
                        ),
                        const SizedBox(width: 5),
                      ],
                      Image.asset(icon),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.5),
        child,
      ],
    );
  }
}
