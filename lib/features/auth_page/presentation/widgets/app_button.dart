import 'package:flutter/material.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isEnabled,
  });
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (a) => setState(() {
        isPressed = true;
      }),
      onTapUp: (a) => setState(() {
        isPressed = false;
      }),
      onTapCancel: () => setState(() {
        isPressed = false;
      }),
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isEnabled
              ? Colors.black
              : Color.fromRGBO(242, 242, 247, 1),
          borderRadius: BorderRadius.circular(
            13,
          ),
        ),
        height: 52,
        width: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: AppTextStyles.authButtonText.copyWith(
              color: widget.isEnabled
                  ? Colors.white
                  : Color.fromRGBO(60, 60, 67, 0.6),
            ),
          ),
        ),
      ),
    );
  }
}
