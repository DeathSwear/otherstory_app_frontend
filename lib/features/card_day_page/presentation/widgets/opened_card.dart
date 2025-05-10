import 'package:flutter/material.dart';
import 'package:otherstory_app/features/card_day_page/data/constants/card_day_constants.dart';

class OpenedCard extends StatelessWidget {
  const OpenedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
          top: CardDayConstants.cardsVerticalPadding / 4,
          bottom: CardDayConstants.cardsVerticalPadding),
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/png/card_day_bg.png',
          width: maxWidth * CardDayConstants.openedCardWidth,
          height: maxHeight * CardDayConstants.openedCardHeight,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
