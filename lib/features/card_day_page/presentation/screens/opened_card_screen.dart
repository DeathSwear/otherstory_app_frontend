import 'package:flutter/material.dart';
import 'package:otherstory_app/features/card_day_page/presentation/widgets/card_status_row.dart';
import 'package:otherstory_app/features/card_day_page/presentation/widgets/close_screen_bar.dart';
import 'package:otherstory_app/features/card_day_page/presentation/widgets/opened_card.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class OpenedCardScreen extends StatelessWidget {
  final Map<String, String> card;

  const OpenedCardScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(28), child: CloseScreenBar()),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const OpenedCard(),
          const CardStatusRow(),
          const SizedBox(height: 4),
          Text(
            '- ${card['author']}',
            style: AppTextStyles.cardDayTitle,
          ),
          const SizedBox(height: 12),
          Text(
            '${card['quote']}',
            style: AppTextStyles.profileCardTitle,
          ),
        ],
      ),
    );
  }
}
