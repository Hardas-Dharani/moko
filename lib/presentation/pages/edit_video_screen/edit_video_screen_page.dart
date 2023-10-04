import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/util/common_txt.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/custom_button.dart';
import 'controller/edit_video_screen_controller.dart';

class EditVideoScreen extends GetView<EditVideoController> {
  EditVideoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(EditVideoController());
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
            text: "Edit Video",
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

      // backgroundColor: AppColors.lightPurple.withOpacity(0.9),
      body: GetBuilder<EditVideoController>(builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
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
                  text: "Video Title :-",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  fontSize: 14,
                ),
                TextFormField(
                  controller: controller.usrTxt,
                  style: TextStyle(
                      color: AppColors.white.withOpacity(0.5), fontSize: 12),
                  decoration: InputDecoration(
                    hintText: 'Enter Your Video Title',
                    hintStyle: TextStyle(
                        color: AppColors.white.withOpacity(0.5), fontSize: 12),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                  ),
                ),
                SizedBox(height: 16),
                CommonText(
                  text: "Video Thumbnail :-",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  fontSize: 14,
                ),
                TextFormField(
                  controller: controller.emailTxt,
                  style: TextStyle(
                      color: AppColors.white.withOpacity(0.5), fontSize: 12),
                  decoration: InputDecoration(
                    hintText: 'Recommended resolution : 800x450',
                    hintStyle: TextStyle(
                        color: AppColors.white.withOpacity(0.5), fontSize: 12),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                  ),
                ),
                SizedBox(height: 16),
                CommonText(
                  text: "Channels :-",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  fontSize: 14,
                ),
                TextFormField(
                  controller: controller.phnTxt,
                  style: TextStyle(
                      color: AppColors.white.withOpacity(0.5), fontSize: 12),
                  decoration: InputDecoration(
                    hintText: 'Select Channels',
                    hintStyle: TextStyle(
                        color: AppColors.white.withOpacity(0.5), fontSize: 12),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // SizedBox(height: 16),
                CommonText(
                  text: "Playlist :-",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  fontSize: 14,
                ),
                TextFormField(
                  controller: controller.phnTxt,
                  style: TextStyle(
                      color: AppColors.white.withOpacity(0.5), fontSize: 12),
                  decoration: InputDecoration(
                    hintText: 'Select Playlist',
                    hintStyle: TextStyle(
                        color: AppColors.white.withOpacity(0.5), fontSize: 12),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // SizedBox(height: 16),
                CommonText(
                  text: "Video File :-",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  fontSize: 14,
                ),
                TextFormField(
                  controller: controller.phnTxt,
                  style: TextStyle(
                      color: AppColors.white.withOpacity(0.5), fontSize: 12),
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.upload,
                      color: AppColors.white,
                      size: 15,
                    ),
                    hintText: 'Select Video File',
                    hintStyle: TextStyle(
                        color: AppColors.white.withOpacity(0.5), fontSize: 12),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.txtGrey), // Set the color to white
                    ),
                  ),
                ),

                // CommonText(
                //   text: "Country :-",
                //   color: AppColors.white,
                //   weight: FontWeight.bold,
                //   fontSize: 14,
                // ),
                // TextFormField(
                //   controller: TextEditingController(),
                //   decoration: InputDecoration(
                //     hintText: 'Location here',
                //     hintStyle: TextStyle(
                //         color: AppColors.white.withOpacity(0.5), fontSize: 12),
                //     enabledBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(
                //           color: AppColors.txtGrey), // Set the color to white
                //     ),
                //     disabledBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(
                //           color: AppColors.txtGrey), // Set the color to white
                //     ),
                //     focusedBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(
                //           color: AppColors.txtGrey), // Set the color to white
                //     ),
                //   ),
                // ),

                SizedBox(height: 32),
                CustomButton(
                    borderBool: true,
                    // width: 65,
                    height: 55,
                    backGroundColor: AppColors.pinkColor,
                    onPressed: () {
                      // controller.updateProfile();
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
