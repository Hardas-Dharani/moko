import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/routes/app_routes.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/common_txt.dart';
import 'controller/user_video_lst_controller.dart';

class UserVideoLstScreen extends GetView<UserVideoLstScreenController> {
  UserVideoLstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(UserVideoLstScreenController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 66),
        child: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          centerTitle: false,
          title: CommonText(
            text: "Video List",
            weight: FontWeight.bold,
            color: AppColors.white,
            fontSize: 24,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.toNamed(Routes.editVideoScreen);
                },
                child: CommonText(
                  text: "Upload video",
                  color: AppColors.white,
                )),
            // IconButton(
            //     onPressed: () {

            //     },
            //     icon: Icon(Icons.dashboard))
          ],
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
      body: GetBuilder<UserVideoLstScreenController>(builder: (_) {
        return Container(
          height: Get.height,
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.videoListUserModel.data == null
                  ? SizedBox(
                      height: Get.height,
                    )
                  : Expanded(
                      child: ListView.separated(
                          // padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 20),
                                child: Container(
                                  // height: 222,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xff333333)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 15,
                                          left: 10,
                                          bottom: 15,
                                          right: 10,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Container(
                                            width: 120,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  controller
                                                              .videoListUserModel
                                                              .data!
                                                              .videos![index]
                                                              .videoImage ==
                                                          ""
                                                      ? "https://www.prokerala.com/movies/assets/img/no-poster-available.jpg"
                                                      : controller
                                                          .videoListUserModel
                                                          .data!
                                                          .videos![index]
                                                          .videoImage!,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: _buildActionButtons(
                                              index)), // Extracted Action Buttons to a separate function
                                    ],
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: controller
                              .videoListUserModel.data!.videos!.length),
                    ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildActionButtons(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.updateVideo,
                        arguments: controller
                            .videoListUserModel.data!.videos![index].id);
                  },
                  child: _buildButton("Edit", Icons.edit, Colors.red)),
              SizedBox(width: 8),
              GestureDetector(
                  onTap: () {
                    controller.deleteVideo(controller
                        .videoListUserModel.data!.videos![index].id
                        .toString());
                  },
                  child: _buildButton("Delete", Icons.cancel, Colors.green)),
              Spacer(),
              _buildButton("Active", null, Colors.pink),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            controller.videoListUserModel.data!.videos![index].channel!
                    .seriesName ??
                "",
            style: TextStyle(fontSize: 16, color: AppColors.white),
          ),
          SizedBox(height: 10),
          Text(
            controller.videoListUserModel.data!.videos![index].videoTitle ?? "",
            style: TextStyle(fontSize: 16, color: AppColors.white),
          ),
          SizedBox(height: 5),
          Text(
            controller
                    .videoListUserModel.data!.videos![index].videoDescription ??
                "",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 10, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label, IconData? icon, Color color) {
    return Container(
      height: 20,
      width: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, size: 10, color: AppColors.white),
          SizedBox(width: 3),
          Text(
            label,
            style: TextStyle(fontSize: 10, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildChannelInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Add your channel information widgets here
        ],
      ),
    );
  }
}
