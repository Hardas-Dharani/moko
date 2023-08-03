import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';

class DefaultElevatedButton extends StatelessWidget {
  final String? text;
  final Function()? press;
  final double? width;
  final double? height;
  final double? borderRadiusAll;
  final Color? backgrouondColor;
  final Color? textColor;
  const DefaultElevatedButton(
      {Key? key,
      this.text,
      this.press,
      this.width,
      this.height,
      this.backgrouondColor,
      this.textColor,
      this.borderRadiusAll = 15.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width,
      height: height ?? 59,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: backgrouondColor ?? AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusAll!),
            )),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor ?? AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
