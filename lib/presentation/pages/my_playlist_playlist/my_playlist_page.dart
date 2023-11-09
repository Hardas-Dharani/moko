import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/util/common_txt.dart';

import '../../../app/config/app_colors.dart';
import '../../../routes/app_routes.dart';
import 'controller/myplaylist_controller.dart';

class MyPlayListScreen extends GetView<MyPlayListController> {
  MyPlayListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyPlayListController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 66),
        child: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.addPlayList);
                },
                icon: Icon(
                  Icons.dashboard,
                  color: AppColors.white,
                ))
          ],
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: CommonText(
            text: "My Playlist",
            weight: FontWeight.bold,
            color: AppColors.white,
            fontSize: 24,
          ),
          centerTitle: false,
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
      backgroundColor: AppColors.white.withOpacity(0.9),

      // backgroundColor: AppColors.lightPurple.withOpacity(0.9),
      body: GetBuilder<MyPlayListController>(builder: (_) {
        return controller.myPlayListModel.data == null
            ? SizedBox(
                height: Get.height,
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          controller.myPlayListModel.data!.playlist!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(controller.myPlayListModel.data!
                              .playlist![index].seasonName!),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(controller
                                .myPlayListModel
                                .data!
                                .playlist![index]
                                .seasonPoster!),
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
      }),
    );
  }
}
