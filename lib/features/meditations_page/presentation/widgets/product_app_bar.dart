import 'package:flutter/material.dart';

class MeditationAppBar extends StatelessWidget {
  const MeditationAppBar({
    super.key,
    this.icon,
  });

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, size: 20)),
            const Text('Медитации'),
            IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: Icon(icon ?? Icons.more_vert))
          ],
        ));
  }
}

// Icons.error_outline
