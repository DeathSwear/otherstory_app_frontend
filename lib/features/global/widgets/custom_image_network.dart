// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:otherstory_app/theme/app_colors.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork(
      {super.key,
      required this.imageSource,
      this.width,
      this.height,
      required this.clipRadius,
      this.darken,
      this.extraDarken});
  final String imageSource;
  final double? width;
  final double? height;
  final double clipRadius;
  final bool? darken;
  final bool? extraDarken;

  Color? getDarkness() {
    if (extraDarken != null) {
      if (extraDarken == true) return AppColors.black45Color;
    }
    if (darken != null) {
      if (darken == true) return AppColors.black25Color;
    }
    return null;
  }

  BlendMode? getBlendMode() {
    if (extraDarken != null) {
      if (extraDarken == true) return BlendMode.darken;
    }
    if (darken != null) {
      if (darken == true) return BlendMode.darken;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(clipRadius),
      child: Image.network(
        fit: BoxFit.cover,
        imageSource,
        color: getDarkness(),
        colorBlendMode: getBlendMode(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return SizedBox(
              width: width,
              height: height,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.blackColor,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          }
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.black45Color),
            ),
            width: width,
            height: height,
            child: const Center(
                child: Icon(
              Icons.error_outline,
              // size: min(height, width) / 2, // убрал высоту :)
            )),
          );
        },
        width: width,
        height: height,
      ),
    );
  }
}
