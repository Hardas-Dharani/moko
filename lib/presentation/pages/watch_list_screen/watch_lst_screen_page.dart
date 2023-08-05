import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/movie_card.dart';
import '../../../app/util/util.dart';
import 'controller/watch_lst_screen_controller.dart';

class WatchListScreen extends GetView<WatchListController> {
  WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WatchListController());
    return Scaffold(
      // backgroundColor: AppColors.lightPurple.withOpacity(0.9),
      body: Container(
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
        child: Stack(
          children: [
            GetBuilder<WatchListController>(builder: (_) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: movieList.length,
                          itemBuilder: (context, categoryIndex) {
                            return MovieCard(
                                titleBool: true,
                                title: movieList[categoryIndex]["title"],
                                imageUrl: movieList[categoryIndex]["imageUrl"]);
                          },
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  childAspectRatio: 2 / 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
