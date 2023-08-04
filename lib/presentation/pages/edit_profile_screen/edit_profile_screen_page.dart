import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/presentation/pages/home_screen/widget/category_movie.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/util/common_txt.dart';
import '../../../app/util/custom_button.dart';
import '../../../app/util/custom_txt_field.dart';
import '../../../app/util/movie_card.dart';
import '../../../app/util/util.dart';
import 'controller/edit_profile_screen_controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());
    return Scaffold(
      // backgroundColor: AppColors.lightPurple.withOpacity(0.9),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.black,
              AppColors.lightPurple,
              AppColors.lightPurple,
              AppColors.black
            ],
          ),
        ),
        child: GetBuilder<EditProfileController>(builder: (_) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          );
        }),
      ),
    );
  }
}
