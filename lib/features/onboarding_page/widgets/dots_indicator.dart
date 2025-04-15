import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class DotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const DotsIndicator({
    Key? key,
    required this.currentIndex,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 44 : 16,
          height: 16,
          decoration: BoxDecoration(
            color: isActive ? AppColors.blackColor : AppColors.black25Color,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}
