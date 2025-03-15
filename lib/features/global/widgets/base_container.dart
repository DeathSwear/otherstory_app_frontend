import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer(
      {super.key,
      required this.child,
      this.width,
      this.margin,
      this.padding,
      this.alignment,
      this.color,
      this.height});

  final AlignmentGeometry? alignment;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      margin: margin,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(13)),
      child: child,
    );
  }
}
