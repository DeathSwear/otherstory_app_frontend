import 'package:flutter/material.dart';
import 'package:otherstory_app/features/meditations_page/data/models/meditations_product_model.dart';

class CustomSharedMask extends StatelessWidget {
  const CustomSharedMask({
    super.key,
    required this.freeProducts,
    required this.currentIndex,
    required this.text,
  });

  final List<MeditationsProductModel> freeProducts;
  final int currentIndex;
  final Text text; 

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textSpan = TextSpan(
          text: text.data,
          style: text.style,
        );
        final textPainter = TextPainter(
          text: textSpan,
          maxLines: text.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(
            minWidth: 0,
            maxWidth: constraints.maxWidth,
          );

        final isOverflowing = textPainter.didExceedMaxLines;

        if (isOverflowing) {
          // Если текст не помещается, применяем градиент
          return ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.7, 1],
                colors: [
                  Colors.white,
                  Colors.transparent,
                ],
              ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
            },
            blendMode: BlendMode.dstIn,
            child: text,
          );
        } else {
          return text;
        }
      },
    );
  }
}
