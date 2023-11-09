import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/util/common_txt.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/custom_button.dart';
import 'controller/add_playlist_controller.dart';

class AddPlayListScreen extends GetView<AddPlayListController> {
  AddPlayListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddPlayListController());
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
            text: "Add Playlist",
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
      body: GetBuilder<AddPlayListController>(builder: (_) {
        return controller.channelPlayListModel.data == null
            ? SizedBox(
                height: Get.height,
              )
            : Padding(
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
                        text: "Playlist Title :-",
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
                          hintText: 'Enter Your Playlist Title',
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
                      SizedBox(height: 16),
                      CommonText(
                        text: "Playlist Poster :-",
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
                      SizedBox(height: 16),
                      // CommonText(
                      //   text: "Channels :-",
                      //   color: AppColors.white,
                      //   weight: FontWeight.bold,
                      //   fontSize: 14,
                      // ),
                      // DropdownButtonFormField<ChannelsPlaylist>(
                      //   value: controller
                      //       .selectedChannel, // Define a variable to hold the selected channel
                      //   onChanged: (ChannelsPlaylist? newValue) {
                      //     // Add a function to handle when a new channel is selected

                      //     controller.selectedChannel = newValue!;
                      //     controller.update();
                      //   },
                      //   items: controller
                      //       .channelPlayListModel.data!.channelsPlaylist!
                      //       .map<DropdownMenuItem<ChannelsPlaylist>>(
                      //           (ChannelsPlaylist value) {
                      //     // Define the dropdown items based on your channel data
                      //     return DropdownMenuItem<ChannelsPlaylist>(
                      //       value: value,
                      //       child: Text(
                      //         value.channelName.toString(),
                      //         style: TextStyle(
                      //           color: AppColors.white.withOpacity(0.5),
                      //           fontSize: 12,
                      //         ),
                      //       ),
                      //     );
                      //   }).toList(),
                      //   dropdownColor: Colors.black,
                      //   style: TextStyle(
                      //     color: AppColors.black,
                      //     fontSize: 12,
                      //   ),
                      //   decoration: InputDecoration(
                      //     hintText: 'Select Channels',
                      //     hintStyle: TextStyle(
                      //       color: AppColors.white.withOpacity(0.5),
                      //       fontSize: 12,
                      //     ),
                      //     enabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: AppColors.txtGrey,
                      //       ),
                      //     ),
                      //     disabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: AppColors.txtGrey,
                      //       ),
                      //     ),
                      //     focusedBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: AppColors.txtGrey,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // SizedBox(height: 16),
                      // SizedBox(height: 16),
                      // CommonText(
                      //   text: "Playlist :-",
                      //   color: AppColors.white,
                      //   weight: FontWeight.bold,
                      //   fontSize: 14,
                      // ),
                      // DropdownButtonFormField<Playlist>(
                      //   value: controller
                      //       .selectedPlaylist, // Define a variable to hold the selected channel
                      //   onChanged: (Playlist? newValue) {
                      //     // Add a function to handle when a new channel is selected

                      //     controller.selectedPlaylist = newValue!;
                      //     controller.update();
                      //   },
                      //   items: controller.channelPlayListModel.data!.playlist!
                      //       .map<DropdownMenuItem<Playlist>>((Playlist? value) {
                      //     // Define the dropdown items based on your channel data
                      //     return DropdownMenuItem<Playlist>(
                      //       value: value,
                      //       child: Text(
                      //         value!.playlistName.toString(),
                      //         style: TextStyle(
                      //           color: AppColors.white.withOpacity(0.5),
                      //           fontSize: 12,
                      //         ),
                      //       ),
                      //     );
                      //   }).toList(),
                      //   dropdownColor: Colors.black,
                      //   style: TextStyle(
                      //     color: AppColors.black,
                      //     fontSize: 12,
                      //   ),
                      //   decoration: InputDecoration(
                      //     hintText: 'Select Channels',
                      //     hintStyle: TextStyle(
                      //       color: AppColors.white.withOpacity(0.5),
                      //       fontSize: 12,
                      //     ),
                      //     enabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: AppColors.txtGrey,
                      //       ),
                      //     ),
                      //     disabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: AppColors.txtGrey,
                      //       ),
                      //     ),
                      //     focusedBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: AppColors.txtGrey,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 16),
                      // SizedBox(height: 16),
                      // CommonText(
                      //   text: "Video File :-",
                      //   color: AppColors.white,
                      //   weight: FontWeight.bold,
                      //   fontSize: 14,
                      // ),
                      // TextFormField(
                      //   onTap: () {
                      //     controller.getVideo();
                      //   },
                      //   controller: controller.videoTxt,
                      //   style: TextStyle(
                      //       color: AppColors.white.withOpacity(0.5),
                      //       fontSize: 12),
                      //   decoration: InputDecoration(
                      //     suffixIcon: Icon(
                      //       Icons.upload,
                      //       color: AppColors.white,
                      //       size: 15,
                      //     ),
                      //     hintText: 'Select Video File',
                      //     hintStyle: TextStyle(
                      //         color: AppColors.white.withOpacity(0.5),
                      //         fontSize: 12),
                      //     enabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //           color: AppColors
                      //               .txtGrey), // Set the color to white
                      //     ),
                      //     disabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //           color: AppColors
                      //               .txtGrey), // Set the color to white
                      //     ),
                      //     focusedBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //           color: AppColors
                      //               .txtGrey), // Set the color to white
                      //     ),
                      //   ),
                      // ),

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
                            // if (controller.usrTxt.text.isNotEmpty &&
                            //     controller.imageThumbil != null) {
                            controller.uploadplaylist();
                            // }

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
