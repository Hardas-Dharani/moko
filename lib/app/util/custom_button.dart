import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final bool borderBool;
  final Gradient? gradient;
  final Color? backGroundColor;
  final VoidCallback? onPressed;
  final Widget child;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.borderBool = false,
    this.backGroundColor = Colors.transparent,
    this.width = 343,
    this.height = 59.0,
    this.gradient,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: borderBool
          ? gradient == null
              ? null
              : BoxDecoration(
                  gradient: gradient,
                  borderRadius: borderRadius ??
                      const BorderRadius.all(Radius.circular(33)),
                )
          : BoxDecoration(
              border: Border.all(color: AppColors.white),
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(33)),
            ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.black),
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(33))),
        ),
        child: child,
      ),
    );
  }
}
