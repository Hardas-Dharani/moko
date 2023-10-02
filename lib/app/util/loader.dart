import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';

class LoadingDialog {
  static void hide() {
    Get.back();
  }

  static Future<void> show() async {
    const forceFullyBackEnable = kDebugMode;
    await Future.delayed(Duration.zero, () {
      Get.dialog(
        WillPopScope(
          onWillPop: () async => forceFullyBackEnable,
          child: GestureDetector(
            onTap: () {
              // if (kDebugMode) {
              //   Get.back();
              // }
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SizedBox(
                  width: 180,
                  height: Get.height * 280 / 812,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // height: 100,
                        child: CupertinoActivityIndicator(
                          color: AppColors.blue,
                          animating: true,
                          radius: 30,
                        ),
                      ),
                      // SpinKitThreeInOut(
                      //   color: AppColors.blueColor,
                      //   duration: Duration(milliseconds: 300),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        barrierColor: Colors.transparent,
        barrierDismissible: forceFullyBackEnable,
      );
    });
  }
}
