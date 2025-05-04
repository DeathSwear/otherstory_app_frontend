import 'package:flutter/material.dart';
import 'package:otherstory_app/theme/app_colors.dart';

class PlayerControls extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final bool isPlaying;

  const PlayerControls({
    super.key,
    required this.onPrevious,
    required this.onPlayPause,
    required this.onNext,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onPrevious,
            icon: const Icon(
              Icons.skip_previous,
              size: 40,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(width: 15),
          IconButton(
            onPressed: onPlayPause,
            icon: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                  color: AppColors.blackColor, shape: BoxShape.circle),
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: AppColors.whiteColor,
                size: 40,
              ),
            ),
          ),
          const SizedBox(width: 15),
          IconButton(
            onPressed: onNext,
            icon: const Icon(
              Icons.skip_next,
              size: 40,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
