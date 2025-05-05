import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';
import '../../../theme/app_colors.dart';
import '../widgets/dots_indicator.dart';
import '../widgets/onboarding_list_page.dart';
import 'onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _steps = [
    OnboardingModel(
      title: 'Other Story',
      description: 'Описание приложения на несколько строчек текста',
      content: const FirstStepContent(),
    ),
    OnboardingModel(
      title: 'Контент для тебя',
      description: 'Описание контента и приложений (курсы, медитации и т.д.)',
      content: const SecondStepContent(),
    ),
    OnboardingModel(
      title: 'Обо мне',
      description: 'Описание страницы “Обо мне”, основные функции',
      content: const TherdStepContent(),
    ),
    OnboardingModel(
      title: 'В разработке',
      description: 'Описание того, что приложение ещё в разработке',
      content: const FinallyStepContent(),
    ),
  ];

  void _nextPage() {
    if (_currentPage < _steps.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _steps.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                return OnboardingListPage(step: _steps[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: DotsIndicator(
                currentIndex: _currentPage, itemCount: _steps.length),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  backgroundColor: AppColors.blackColor,
                  minimumSize: const Size(double.infinity, 52)),
              child: Text(
                _currentPage == _steps.length - 1 ? 'Продолжить' : 'Далее',
                style: AppTextStyles.onboardingButtonTextStyle,
              ),
            ),
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}

class FirstStepContent extends StatelessWidget {
  const FirstStepContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Image.asset(
        'assets/png/onboarding_one_step.png',
        height: 600,
        fit: BoxFit.cover,
      ),
    );
  }
}

class SecondStepContent extends StatelessWidget {
  const SecondStepContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 70),
          child: Image.asset(
            'assets/png/onboarding_two_step.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class TherdStepContent extends StatelessWidget {
  const TherdStepContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Image.asset(
        'assets/png/onboarding_three_step.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class FinallyStepContent extends StatelessWidget {
  const FinallyStepContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 70),
          child: Image.asset(
            'assets/png/onboarding_finally_step.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
