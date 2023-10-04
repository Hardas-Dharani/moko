import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/services/local_storage.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/movie_card.dart';
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
                        Get.find<LocalStorageService>().movieModels != null
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: Get.find<LocalStorageService>()
                                    .movieModels!
                                    .length,
                                itemBuilder: (context, categoryIndex) {
                                  return MovieCard(
                                      titleBool: true,
                                      channelID: Get.find<LocalStorageService>()
                                          .movieModels![categoryIndex]
                                          .id!,
                                      title: Get.find<LocalStorageService>()
                                          .movieModels![categoryIndex]
                                          .movieName!,
                                      imageUrl: Get.find<LocalStorageService>()
                                          .movieModels![categoryIndex]
                                          .image!);
                                },
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 300,
                                        childAspectRatio: 2 / 3,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                              )
                            : SizedBox(),
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
