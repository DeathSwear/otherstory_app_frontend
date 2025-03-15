import 'package:flutter/material.dart';
import '../../../global/widgets/base_container.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 1),
      child: BaseContainer(
          height: 44,
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, size: 30),
                  const SizedBox(width: 5),
                  Text(
                    title,
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_right, color: Colors.black45,)
            ],
          )),
          
    );
  }
}
