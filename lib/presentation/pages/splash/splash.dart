import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/services/local_storage.dart';

import '../../../app/util/util.dart';
import '../../../routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.find<LocalStorageService>().loginUser == null) {
      Future.delayed(Duration(milliseconds: 500))
          .whenComplete(() => Get.toNamed(Routes.signInScreen));
    } else {
      Future.delayed(Duration(milliseconds: 500))
          .whenComplete(() => Get.toNamed(Routes.bottomBar));
    }
    return Container(
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
    );
  }
}
