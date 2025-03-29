import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:otherstory_app/features/main_page/data/models/habits_item_data.dart';
import '../../../../theme/app_text_styles.dart';

class HabitItem extends StatelessWidget {
  const HabitItem({
    super.key,
    required this.onPressed,
    required this.data,
    required this.isSelected,
  });

  final HabitsItemData data;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          // blur для не выбранных 
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              image: DecorationImage(
                image: NetworkImage(data.imageSource),
                fit: BoxFit.cover,
              ),
            ),
            child: !isSelected
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  )
                : null,
          ),
          
          // isSelected
          Container(
            padding: const EdgeInsets.all(8),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
            ),
            child: Stack(
              children: [
                Text(
                  data.name,
                  style: AppTextStyles.habitsContainerTexctColor,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    isSelected
                        ? Icons.check_circle
                        : Icons.check_circle_outline,
                    color: isSelected ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Icon((Icons.check_circle_outline_sharp), color: Colors.grey) - можно использовать для dissable контейнеров
