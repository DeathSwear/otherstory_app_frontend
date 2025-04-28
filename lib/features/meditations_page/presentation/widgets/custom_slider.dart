import 'package:flutter/material.dart';
import 'package:otherstory_app/theme/app_colors.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final double thumbRadius;

  const CustomSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.thumbRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 2,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: thumbRadius),
        activeTrackColor: AppColors.blackColor,
        inactiveTrackColor: AppColors.unactivePlayerColor,
        thumbColor: AppColors.blackColor,
      ),
      child: Slider(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        value: value,
        min: min,
        max: max,
        onChanged: onChanged,
      ),
    );
  }
}
