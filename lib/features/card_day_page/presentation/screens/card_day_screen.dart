import 'dart:math';
import 'package:flutter/material.dart';
import 'package:otherstory_app/features/card_day_page/data/constants/card_day_constants.dart';
import 'package:otherstory_app/features/card_day_page/presentation/screens/opened_card_screen.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import 'package:otherstory_app/theme/app_strings.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class CardDayScreen extends StatefulWidget {
  const CardDayScreen({super.key});

  @override
  State<CardDayScreen> createState() => _CardDayScreenState();
}

class _CardDayScreenState extends State<CardDayScreen>
    with SingleTickerProviderStateMixin {
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 15),
    backgroundColor: AppColors.blackColor,
    overlayColor: AppColors.whiteColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13),
    ),
  );

  final PageController _pageController = PageController(viewportFraction: 0.75);

  int _currentPage = 0;
  bool _cardSelected = false;
  late AnimationController _flipController;
  late Animation<double> _animation;

  final List<Map<String, String>> _cards = [
    {
      'quote': 'Стань лучшей версией себя.',
      'author': 'Опра Уинфри',
    },
    {
      'quote': 'Счастье — это путь, а не цель.',
      'author': 'Будда',
    },
    {
      'quote': 'Каждое утро — это новый шанс.',
      'author': 'Неизвестный автор',
    },
  ];

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: pi).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          final selectedCard = _cards[_currentPage];
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (_, animation, secondaryAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: OpenedCardScreen(card: selectedCard),
                );
              },
            ),
          );
        }
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  void _onChooseCard() {
    if (!_cardSelected) {
      setState(() => _cardSelected = true);
      _flipController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppStrings.yourCardDay,
                style: AppTextStyles.cardDayTitle,
              ),
              const SizedBox(height: CardDayConstants.textVerticalPadding),
              const Text(
                AppStrings.cardDaySubtitle,
                style: AppTextStyles.cardDaySubtitle,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: CardDayConstants.cardsVerticalPadding,
                    bottom: CardDayConstants.cardsVerticalPadding / 2),
                child: SizedBox(
                  height: maxHeight * CardDayConstants.cardHeight,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) =>
                        setState(() => _currentPage = index),
                    scrollDirection: Axis.horizontal,
                    itemCount: _cards.length,
                    itemBuilder: (_, index) {
                      final isCurrent = index == _currentPage;
                      return AnimatedBuilder(
                        animation: _animation,
                        builder: (_, child) {
                          final angle = isCurrent && _cardSelected
                              ? _animation.value
                              : 0.0;
                          final isFront = angle < pi / 2;
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(angle),
                            child: Container(
                              //ширина контейнера больше чем карточка
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  isFront
                                      ? 'assets/png/card_day_bg.png'
                                      : 'assets/png/cards.png',
                                  width: maxWidth * CardDayConstants.cardWidth,
                                  height:
                                      maxHeight * CardDayConstants.cardHeight,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _onChooseCard,
                style: buttonStyle,
                child: const Text(
                  AppStrings.selectCardDay,
                  style: AppTextStyles.cardDayButtonText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
