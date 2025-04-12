import 'package:flutter/material.dart';

class HabitsList extends StatelessWidget {
  const HabitsList({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => children[index],
        itemCount: children.length,
      ),
    );
  }
}
// Icon((Icons.check_circle_outline_sharp), color: Colors.grey) - можно использовать для dissable контейнеров
