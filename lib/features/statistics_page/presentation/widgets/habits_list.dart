import 'package:flutter/material.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class HabitsList extends StatelessWidget {
  const HabitsList({
    super.key, required this.title, required this.decorImage,
  });

  final String decorImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                image: DecorationImage(
                  image: AssetImage(decorImage),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.all(8),
              child:  Stack(children: [
                Text(title,
                    style: AppTextStyles.habitsContainerTexctColor),
                const Positioned(
                  right: 0,
                  bottom: 0,
                  child: Icon((Icons.check_circle),
                      color: Colors.white), //active icon
                )
              ]),
            ),
          ],
        ));
  }
}
// Icon((Icons.check_circle_outline_sharp), color: Colors.grey) - можно использовать для dissable контейнеров
