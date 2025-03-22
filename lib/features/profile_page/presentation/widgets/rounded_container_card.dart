import 'package:flutter/material.dart';

import '../../constants/profile_page_sizes.dart';

class RoundedContainerCard extends StatelessWidget {
  const RoundedContainerCard({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ProfilePageSizes.containerRadius),
        color: Colors.white,
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
