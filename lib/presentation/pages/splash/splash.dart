import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/routes/app_routes.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/util/util.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500))
        .whenComplete(() => Get.toNamed(Routes.bottomBar));
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Utils.getImagePath("splash_background")))),
        child: Center(
          child: Hero(
            tag: 'logo',
            child: Image.asset(
              Utils.getImagePath("logo"),
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
