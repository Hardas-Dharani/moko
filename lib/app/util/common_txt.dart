import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight weight;
  final double fontSize;
  final TextAlign textAlign;
  final double lineHeight;
  final double letterSpacing;
  final TextOverflow overFlow;
  const CommonText({
    Key? key,
    required this.text,
    this.color,
    this.weight = FontWeight.w300,
    this.fontSize = 14.0,
    this.textAlign = TextAlign.left,
    this.overFlow = TextOverflow.visible,
    this.letterSpacing = 0.10,
    this.lineHeight = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? AppColors.black,
        fontWeight: weight,
        overflow: overFlow,
        fontSize: fontSize,
        height: lineHeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
