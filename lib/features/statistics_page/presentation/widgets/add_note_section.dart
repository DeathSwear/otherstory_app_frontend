import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';

class AddNoteSection extends StatelessWidget {
  const AddNoteSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.addNoteContainerColor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/png/add_note.png"),
                    const SizedBox(width: 8),
                    const Text(
                      'Добавить заметку',
                      style: AppTextStyles.statisticsAddNoteTitle,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.only(right: 100),
                  child: Text(
                    'Все ваши творческие мысли могут храниться в одном месте',
                    style: AppTextStyles.statisticsAddNoteSubtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Positioned(
              top: -16,
              right: -16,
              bottom: -16,
              child: Image.asset(
                'assets/png/arrow_add_note.png',
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
