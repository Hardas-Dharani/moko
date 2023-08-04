import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/presentation/pages/home_screen/widget/category_movie.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/util/common_txt.dart';
import '../../../app/util/custom_button.dart';
import '../../../app/util/movie_card.dart';
import '../../../app/util/util.dart';
import 'controller/dashboard_screen_controller.dart';

class DashBoardScreen extends GetView<DashBoardController> {
  DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 66),
        child: AppBar(
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
          GetBuilder<DashBoardController>(builder: (_) {
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
                    // Container(
                    //   padding: EdgeInsets.symmetric(vertical: 20),
                    //   color: AppColors.black,
                    //   child: ListView.separated(
                    //     separatorBuilder: (context, index) => SizedBox(
                    //       height: 20,
                    //     ),
                    //     shrinkWrap: true,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     itemCount: categories.length,
                    //     itemBuilder: (context, categoryIndex) {
                    //       String category = categories[categoryIndex];
                    //       List<String> movies =
                    //           moviesByCategory[category] ?? [];

                    //       return CategorySection(
                    //           showTitle: false,
                    //           category: category,
                    //           movies: movies);
                    //     },
                    //   ),
                    // ),
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
