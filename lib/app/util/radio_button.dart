import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'common_txt.dart';

class RadioButtonCommon extends StatelessWidget {
  final Object groupValue;
  final Object value;
  final Function(Object?) onChanged;
  final String label;
  final Color? labelColor;
  final double labelFontSize;
  const RadioButtonCommon({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    required this.label,
    this.labelColor,
    this.labelFontSize = 14,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          fillColor: MaterialStateProperty.all(AppColors.primary),
        ),
        Expanded(
          child: CommonText(
            text: label,
            color: labelColor ?? AppColors.txtGrey,
            fontSize: labelFontSize,
            weight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
