import 'package:flutter/material.dart';
import '../config/app_colors.dart';

class ScafoldedWidget extends StatelessWidget {
  final Widget body;
  const ScafoldedWidget({super.key, required this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.black,
                  // AppColors.black.withOpacity(0.7),
                  AppColors.lightPurple,
                  AppColors.lightPurple,
                  // AppColors.lightPurple,
                  // AppColors.black.withOpacity(0.9),
                  AppColors.black
                ],
              ),
            ),
            child: body));
  }
}
