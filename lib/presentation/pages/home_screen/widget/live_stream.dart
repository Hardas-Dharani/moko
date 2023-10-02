import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/util/common_txt.dart';
import 'package:moko/app/util/custom_button.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../app/util/util.dart';
import '../controller/home_screen_controller.dart';
import 'category_movie.dart';

class LiveStreamScreen extends GetView<HomeController> {
  LiveStreamScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 66),
        child: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
          ],
          title: Image.asset(
            Utils.getImagePath("logo"),
            width: 108,
            height: 250,
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
      body: Stack(
        children: [
          GetBuilder<HomeController>(builder: (_) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        CustomButton(
                            borderBool: true,
                            width: 85,
                            height: 40,
                            backGroundColor:
                                controller.seletectButton == buttonEnum.live
                                    ? AppColors.blue
                                    : AppColors.pinkColor,
                            onPressed: () {
                              controller.seletectButton = buttonEnum.live;
                              controller.update();
                            },
                            child: CommonText(
                              text: "Live",
                              fontSize: 12,
                              color: AppColors.white,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        CustomButton(
                            borderBool: true,
                            width: 85,
                            height: 40,
                            backGroundColor:
                                controller.seletectButton == buttonEnum.category
                                    ? AppColors.blue
                                    : AppColors.pinkColor,
                            onPressed: () {
                              controller.seletectButton = buttonEnum.category;
                              controller.update();
                            },
                            child: CommonText(
                              text: "Category",
                              fontSize: 12,
                              color: AppColors.white,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        CustomButton(
                            borderBool: true,
                            width: 85,
                            height: 40,
                            backGroundColor:
                                controller.seletectButton == buttonEnum.newest
                                    ? AppColors.blue
                                    : AppColors.pinkColor,
                            onPressed: () {
                              controller.seletectButton = buttonEnum.newest;
                              controller.update();
                            },
                            child: CommonText(
                              text: "Newest",
                              fontSize: 12,
                              color: AppColors.white,
                            )),
                      ],
                    ),
                    controller.homeDetailData.data == null
                        ? SizedBox()
                        : Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            color: AppColors.black,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller
                                  .homeDetailData.data!.sliderByGenres!.length,
                              itemBuilder: (context, categoryIndex) {
                                String category = controller
                                    .homeDetailData
                                    .data!
                                    .sliderByGenres![categoryIndex]
                                    .genreName!;
                                List<Map<String, dynamic>> movies =
                                    moviesByCategory[category] ?? [];

                                return CategorySection(
                                    showTitle: false,
                                    category: category,
                                    sliderByGenres: controller.homeDetailData
                                        .data!.sliderByGenres![categoryIndex]);
                              },
                            ),
                          ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
