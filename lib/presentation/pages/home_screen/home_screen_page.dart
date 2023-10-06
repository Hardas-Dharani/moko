import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/presentation/pages/home_screen/widget/category_movie.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/util.dart';
import 'controller/home_screen_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.black.withOpacity(0.9),
      body: SingleChildScrollView(
        child: GetBuilder<HomeController>(builder: (_) {
          return Column(
            children: [
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   // color: AppColors.blue,
              //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              //   height: 236, // Adjust the height as needed

              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: movieList.length,
              //     itemBuilder: (context, movieIndex) {
              //       return MovieCard(
              //           width: 185,
              //           height: 236,
              //           radius: 6,
              //           title: movieList[movieIndex]["title"],
              //           imageUrl: movieList[movieIndex]["imageUrl"]);
              //     },
              //   ),
              // ),
              controller.homeDetailData.data == null
                  ? SizedBox(
                      height: Get.height,
                      child: Center(
                        child: Text(
                          "No data available",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    )
                  : Container(
                      color: AppColors.black,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                        itemCount: controller
                            .homeDetailData.data!.sliderByGenres!.length,
                        itemBuilder: (context, categoryIndex) {
                          String category = controller.homeDetailData.data!
                              .sliderByGenres![categoryIndex].genreName!;
                          List<Map<String, dynamic>> movies =
                              moviesByCategory[category] ?? [];

                          return CategorySection(
                              category: category,
                              sliderByGenres: controller.homeDetailData.data!
                                  .sliderByGenres![categoryIndex]);
                        },
                      ),
                    ),
              SizedBox(
                height: 100,
              ),
            ],
          );
        }),
      ),
    );
  }
}
