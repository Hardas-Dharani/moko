import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/services/local_storage.dart';
import 'package:moko/routes/app_routes.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/common_txt.dart';
import '../../../app/util/custom_button.dart';
import 'controller/dashboard_screen_user_controller.dart';

class DashBoardScreenUser extends GetView<DashBoardScreenUserController> {
  DashBoardScreenUser({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardScreenUserController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 66),
        child: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: CommonText(
            text: "DashBoard",
            weight: FontWeight.bold,
            color: AppColors.white,
            fontSize: 24,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors.pinkColor, AppColors.lightPurple],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.black.withOpacity(0.9),

      // backgroundColor: AppColors.lightPurple.withOpacity(0.9),
      body: GetBuilder<DashBoardScreenUserController>(builder: (_) {
        ;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back, ${Get.find<LocalStorageService>().loginUser!.data!.user!.name}",
                textAlign: TextAlign.start,
                style: TextStyle(color: AppColors.white, fontSize: 20),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
                style: TextStyle(color: AppColors.white, fontSize: 12),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(page);
                    },
                    child: Container(
                      height: 165,
                      width: 165,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF333333)),
                          borderRadius: BorderRadius.circular(11)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(
                          //   Get.find<LocalStorageService>()
                          //       .loginUser!
                          //       .data!
                          //       .dashboard!
                          //       .totalLanguages
                          //       .toString(),
                          //   style: TextStyle(
                          //       color: Color(0xffED008C),
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          Text(
                            "My playlists",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.videoLst);
                    },
                    child: Container(
                      height: 165,
                      width: 165,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF333333)),
                          borderRadius: BorderRadius.circular(11)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(
                          //   Get.find<LocalStorageService>()
                          //       .loginUser!
                          //       .data!
                          //       .dashboard!
                          //       .totalGenres
                          //       .toString(),
                          //   style: TextStyle(
                          //       color: Color(0xffED008C),
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          Text(
                            "My Videos",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.myChannel);
                    },
                    child: Container(
                      height: 165,
                      width: 165,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF333333)),
                          borderRadius: BorderRadius.circular(11)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(
                          //   Get.find<LocalStorageService>()
                          //       .loginUser!
                          //       .data!
                          //       .dashboard!
                          //       .totalChannels
                          //       .toString(),
                          //   style: TextStyle(
                          //       color: Color(0xffED008C),
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          Text(
                            "Channels",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 165,
                    width: 165,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF333333)),
                        borderRadius: BorderRadius.circular(11)),
                    child: CustomButton(
                      width: 130,
                      height: 30,
                      borderBool: true,
                      backGroundColor: AppColors.pinkColor,
                      gradient: LinearGradient(
                          colors: [AppColors.pinkColor, AppColors.pinkColor]),
                      onPressed: () async {
                        Get.toNamed(Routes.editVideoScreen);
                        // controller.login();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Upload Videos',
                            style: TextStyle(fontSize: 12),
                          ),
                          Icon(
                            Icons.upload,
                            size: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "Total Video Views",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 100,
                  width: 251,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF333333)),
                      borderRadius: BorderRadius.circular(11)),
                  child: Text(
                    Get.find<LocalStorageService>()
                        .loginUser!
                        .data!
                        .dashboard!
                        .totalVideoViews
                        .toString(),
                    style: TextStyle(
                        color: Color(0xffED008C),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
