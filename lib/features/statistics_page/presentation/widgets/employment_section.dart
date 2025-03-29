import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';

class EmploymentSection extends StatelessWidget {
  const EmploymentSection({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
            width: double.infinity,
            height: 95,
            decoration: BoxDecoration(
                color: AppColors.employmentContainerColor,
                borderRadius: BorderRadius.circular(13)),
            child: Stack(
              children: [
                Positioned(
                    bottom: -60,
                    right: -40,
                    child: Image.network(
                      'https://goo.su/8zWj4',
                      width: 270,
                    )),
                const Padding(
                  padding: const EdgeInsets.all(16),
                  child: Positioned(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('█  Учу английский',
                              style: AppTextStyles.employmentSectionTitle),
                          Text('24 минуты',
                              style: AppTextStyles.employmentSectionTime),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text('Нажмите, если закончили занятие',
                          style: AppTextStyles.employmentSectionSubtitle)
                    ],
                  )),
                )
              ],
            )),
      ),
    );
  }
}
