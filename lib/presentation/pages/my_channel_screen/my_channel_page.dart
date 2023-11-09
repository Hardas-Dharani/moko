import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/util/common_txt.dart';
import 'package:moko/presentation/pages/my_channel_screen/widget/chip.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/custom_button.dart';
import '../../../data/models/creater_menu_model.dart';
import 'controller/my_channel_controller.dart';

class MyChannelScreen extends GetView<MyChannelController> {
  MyChannelScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyChannelController());
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
            text: "My Channel",
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
      backgroundColor: AppColors.black.withOpacity(0.9),

      // appBar: PreferredSize(
      //   preferredSize: Size(Get.width, 66),
      //   child: AppBar(
      //     leading: IconButton(
      //         onPressed: () {
      //           Get.back();
      //         },
      //         icon: Icon(Icons.arrow_back_ios)),
      //     title: CommonText(
      //       text: "Profile",
      //       weight: FontWeight.bold,
      //       color: AppColors.white,
      //       fontSize: 24,
      //     ),
      //     flexibleSpace: Container(
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //           begin: Alignment.centerLeft,
      //           end: Alignment.centerRight,
      //           colors: [AppColors.pinkColor, AppColors.lightPurple],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      // backgroundColor: AppColors.black.withOpacity(0.9),

      // backgroundColor: AppColors.lightPurple.withOpacity(0.9),
      body: GetBuilder<MyChannelController>(builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: SingleChildScrollView(
            child: controller.myChannelModel.data == null &&
                    controller.createrListMenuModel.data == null
                ? SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),

                      // Align(
                      //   alignment: Alignment.center,
                      //   child: GestureDetector(
                      //     onTap: () {},
                      //     child: Stack(
                      //       alignment: Alignment.bottomCenter,
                      //       children: [
                      //         CircleAvatar(
                      //           radius: 40,
                      //           backgroundImage: NetworkImage(
                      //               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzF7xJ5l0YlkeFb-85hvKDGbnBMprT8P8HL5t-ctDH&s'),
                      //         ),
                      //         Container(
                      //           width: 20,
                      //           height: 20,
                      //           transform: Matrix4.translationValues(20, 0, 0),
                      //           decoration: BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             gradient: LinearGradient(
                      //               begin: Alignment.bottomRight,
                      //               end: Alignment.topLeft,
                      //               colors: [
                      //                 HexColor("7600FF"),
                      //                 HexColor("52CCF5"),
                      //                 HexColor("52CCF5"),
                      //               ],
                      //             ),
                      //           ),
                      //           alignment: Alignment.center,
                      //           child: Icon(
                      //             Icons.add,
                      //             color: AppColors.white,
                      //             size: 15,
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      SizedBox(height: 30),
                      CommonText(
                        text: "Channel Name :-",
                        color: AppColors.white,
                        weight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      TextFormField(
                        controller: controller.usrTxt,
                        style: TextStyle(
                            color: AppColors.white.withOpacity(0.5),
                            fontSize: 12),
                        decoration: InputDecoration(
                          hintText: 'Channel Name',
                          hintStyle: TextStyle(
                              color: AppColors.white.withOpacity(0.5),
                              fontSize: 12),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors
                                    .txtGrey), // Set the color to white
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors
                                    .txtGrey), // Set the color to white
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors
                                    .txtGrey), // Set the color to white
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      CommonText(
                        text: "Channel Info :-",
                        color: AppColors.white,
                        weight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      TextFormField(
                        controller: controller.channelInfo,
                        style: TextStyle(
                            color: AppColors.white.withOpacity(0.5),
                            fontSize: 12),
                        decoration: InputDecoration(
                          hintText: 'Channel Info',
                          hintStyle: TextStyle(
                              color: AppColors.white.withOpacity(0.5),
                              fontSize: 12),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors
                                    .txtGrey), // Set the color to white
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors
                                    .txtGrey), // Set the color to white
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors
                                    .txtGrey), // Set the color to white
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      CommonText(
                        text: "Upload Poster :-",
                        color: AppColors.white,
                        weight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      TextFormField(
                        onTap: () {
                          controller.getImage();
                        },
                        controller: controller.thumbnailTxt,
                        style: TextStyle(
                            color: AppColors.white.withOpacity(0.5),
                            fontSize: 12),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.upload,
                            color: AppColors.white,
                            size: 15,
                          ),
                          hintText: 'Recommended resolution : 800x450',
                          hintStyle: TextStyle(
                              color: AppColors.white.withOpacity(0.5),
                              fontSize: 12),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors
                                    .txtGrey), // Set the color to white
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors
                                    .txtGrey), // Set the color to white
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors
                                    .txtGrey), // Set the color to white
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      CommonText(
                        text: "Languages :-",
                        color: AppColors.white,
                        weight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      controller.myChannelModel.data == null
                          ? SizedBox()
                          : Container(
                              child: Column(
                                children: [
                                  Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: [
                                      ChipWidget(
                                        // index: index,
                                        label: controller.myChannelModel.data!
                                            .myChannel!.language!.languageName!,
                                        // onDeleted: controller.onDeleted,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      SizedBox(height: 30),
                      CommonText(
                        text: "Genres Name :-",
                        color: AppColors.white,
                        weight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      SizedBox(height: 16),
                      controller.createrListMenuModel.data == null
                          ? SizedBox()
                          : MultiSelectDialogField(
                              initialValue: controller.selectedcreators,
                              buttonText: Text(
                                "Select Genre",
                                style: TextStyle(color: AppColors.white),
                              ),
                              items: controller
                                  .createrListMenuModel.data!.creators!
                                  .map((e) => MultiSelectItem(e, e.genreName!))
                                  .toList(),
                              onConfirm: (List<Creators> d) {
                                controller.creators = d;
                                controller.update();
                              },
                            ),

                      SizedBox(height: 32),
                      CustomButton(
                          borderBool: true,
                          // width: 65,
                          height: 55,
                          backGroundColor: AppColors.pinkColor,
                          onPressed: () {
                            controller.updateChannel();
                          },
                          child: CommonText(
                            text: "Save Changes",
                            color: AppColors.white,
                          )),
                    ],
                  ),
          ),
        );
      }),
    );
  }
}
