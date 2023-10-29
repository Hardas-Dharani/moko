import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/util/common_txt.dart';
import 'package:moko/presentation/pages/my_channel_screen/widget/chip.dart';
import 'package:super_tag_editor/tag_editor.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/custom_button.dart';
import 'controller/my_channel_controller.dart';

class MyChannelScreen extends GetView<MyChannelController> {
  MyChannelScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyChannelController());
    return Scaffold(
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
      backgroundColor: AppColors.black.withOpacity(0.9),

      // backgroundColor: AppColors.lightPurple.withOpacity(0.9),
      body: GetBuilder<MyChannelController>(builder: (_) {
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
                  text: "Channel Name :-",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  fontSize: 14,
                ),
                TextFormField(
                  controller: controller.usrTxt,
                  style: TextStyle(
                      color: AppColors.white.withOpacity(0.5), fontSize: 12),
                  decoration: InputDecoration(
                    hintText: 'info@yourdomain.com',
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
                TagEditor<String>(
                  // focusNode:controller. focusNode,
                  delimiters: [',', ' '],
                  hasAddButton: true,
                  resetTextOnSubmitted: true,
                  length: controller.values.length,
                  tagBuilder: (BuildContext, index) {
                    return ChipWidget(
                      index: index,
                      label: controller.values[index],
                      onDeleted: controller.onDeleted,
                    );
                  },
                  onTagChanged: (String value) {
                    controller.values.add(value);
                    controller.update();
                  },
                  textStyle: TextStyle(color: Colors.white),
                  suggestionBuilder: (BuildContext context,
                      TagsEditorState<String> state,
                      String data,
                      int index,
                      int lenght,
                      bool highlight,
                      String? suggestionValid) {
                    return Container();
                  },
                  findSuggestions: (String query) {
                    return [];
                  },
                ),
                CommonText(
                  text: "Email :-",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  fontSize: 14,
                ),
                TextFormField(
                  controller: controller.emailTxt,
                  style: TextStyle(
                      color: AppColors.white.withOpacity(0.5), fontSize: 12),
                  decoration: InputDecoration(
                    hintText: 'info@yourdomain.com',
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
                  text: "Phone :-",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  fontSize: 14,
                ),
                TextFormField(
                  controller: controller.phnTxt,
                  style: TextStyle(
                      color: AppColors.white.withOpacity(0.5), fontSize: 12),
                  decoration: InputDecoration(
                    hintText: '+1 123 456 7898',
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
