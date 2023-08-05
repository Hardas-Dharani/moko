import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/extensions/color.dart';
import 'package:moko/app/util/common_txt.dart';
import 'package:moko/app/util/custom_button.dart';
import 'package:moko/routes/app_routes.dart';

import '../../../app/config/app_colors.dart';
import 'controller/dashboard_screen_controller.dart';

class BuildContainer extends StatelessWidget {
  final Widget? body;
  final String? title;
  const BuildContainer({this.title, this.body});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: HexColor("151515")),
      child: Column(
        children: [
          Container(
            height: 50,
            width: Get.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: HexColor("222222")),
            child: CommonText(
              text: title ?? "User Profile",
              fontSize: 16,
              color: AppColors.white,
              weight: FontWeight.bold,
            ),
          ),
          body ??
              Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25, top: 20),
                        child: CustomButton(
                            borderBool: true,
                            width: 65,
                            height: 25,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.pinkColor,
                                AppColors.lightPurple
                              ],
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.editProfileScreen);
                            },
                            child: CommonText(
                              text: "Edit",
                              color: AppColors.white,
                            )),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzF7xJ5l0YlkeFb-85hvKDGbnBMprT8P8HL5t-ctDH&s'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'john.doe@example.com',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
        ],
      ),
    );
  }
}

class DashBoardScreen extends GetView<DashBoardController> {
  DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardController());
    return Scaffold(
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
                    BuildContainer(),
                    SizedBox(
                      height: 20,
                    ),
                    BuildContainer(
                      title: "My Subscribtion",
                      body: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CommonText(
                                  text: "Current Plan:",
                                  fontSize: 16,
                                  color: AppColors.white,
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 90,
                                  alignment: Alignment.center,
                                  child: CommonText(
                                    text: "Free Plan",
                                    color: AppColors.white,
                                    fontSize: 12,
                                    weight: FontWeight.w300,
                                  ),
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        AppColors.pinkColor,
                                        AppColors.lightPurple
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CommonText(
                              text:
                                  "Subscribtion expires on December, 14, 2023",
                              fontSize: 14,
                              color: AppColors.white,
                              weight: FontWeight.w300,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BuildContainer(
                      title: "Last Invoice",
                      body: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CommonText(
                                  text: "Date:",
                                  fontSize: 16,
                                  color: AppColors.white,
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 150,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: CommonText(
                                    text: "December, 14, 2022",
                                    color: AppColors.white,
                                    fontSize: 12,
                                    weight: FontWeight.w300,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        AppColors.pinkColor,
                                        AppColors.lightPurple
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CommonText(
                                  text: "Plan:",
                                  fontSize: 16,
                                  color: AppColors.white,
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 90,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: CommonText(
                                    text: "Free Plan",
                                    color: AppColors.white,
                                    fontSize: 12,
                                    weight: FontWeight.w300,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        AppColors.pinkColor,
                                        AppColors.lightPurple
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CommonText(
                                  text: "Amount:",
                                  fontSize: 16,
                                  color: AppColors.white,
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 90,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: CommonText(
                                    text: "00.00",
                                    color: AppColors.white,
                                    fontSize: 12,
                                    weight: FontWeight.w300,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        AppColors.pinkColor,
                                        AppColors.lightPurple
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
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
