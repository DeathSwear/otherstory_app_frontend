import 'package:flutter/material.dart';
import 'package:otherstory_app/features/onboarding_page/view/onboarding_model.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class OnboardingListPage extends StatelessWidget {
  final OnboardingModel step;

  const OnboardingListPage({Key? key, required this.step}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(child: step.content),
        // Контент по центру
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(step.title, style: AppTextStyles.onboardingTitle),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  step.description,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.onboardingSubtitle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
