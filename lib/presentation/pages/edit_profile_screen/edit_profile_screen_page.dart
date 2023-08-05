import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/extensions/color.dart';
import 'package:moko/app/util/common_txt.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/custom_button.dart';
import 'controller/edit_profile_screen_controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());
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
            text: "Profile",
            weight: FontWeight.bold,
            color: AppColors.white,
            fontSize: 24,
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

      // backgroundColor: AppColors.lightPurple.withOpacity(0.9),
      body: GetBuilder<EditProfileController>(builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {},
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzF7xJ5l0YlkeFb-85hvKDGbnBMprT8P8HL5t-ctDH&s'),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          transform: Matrix4.translationValues(20, 0, 0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                HexColor("7600FF"),
                                HexColor("52CCF5"),
                                HexColor("52CCF5"),
                              ],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.add,
                            color: AppColors.white,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                CommonText(
                  text: "Name :-",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  fontSize: 14,
                ),
                TextFormField(
                  controller: TextEditingController(),
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
                  text: "Email :-",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  fontSize: 14,
                ),
                TextFormField(
                  controller: TextEditingController(),
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
                  controller: TextEditingController(),
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
                CommonText(
                  text: "Country :-",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  fontSize: 14,
                ),
                TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'Location here',
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
                SizedBox(height: 32),
                CustomButton(
                    borderBool: true,
                    // width: 65,
                    height: 55,
                    backGroundColor: AppColors.pinkColor,
                    onPressed: () {},
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
