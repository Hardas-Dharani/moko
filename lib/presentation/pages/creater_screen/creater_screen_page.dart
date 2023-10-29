import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/common_txt.dart';
import '../../../app/util/custom_txt_field.dart';
import '../../../app/util/util.dart';
import '../home_screen/widget/category_movie.dart';
import 'controller/creater_screen_controller.dart';

// ignore: must_be_immutable
class CreaterScreen extends GetView<CreaterController> {
  List<String> movie = ['Movie 1', 'Movie 2', 'Movie 3'];

  List<String> buttonString = ['Horror', 'Action', 'Drama', 'Romance'];
  CreaterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CreaterController());
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
            text: "Creater",
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
            GetBuilder<CreaterController>(builder: (_) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          CustomTextField(
                            height: 40,
                            width: 300,

                            contentPadding: EdgeInsets.all(7),
                            borderRadius: 10,
                            controller: TextEditingController(),
                            hintText: 'Search',
                            prefixIcon:
                                Image.asset(Utils.getImagePath("Search")),
                            // suffixIconData: Icons.clear,
                            obscureText: false,

                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            style:
                                TextStyle(color: AppColors.white, fontSize: 12),
                            // maxLines: 1,
                            onSubmitted: (value) {
                              // Handle the submitted value here if needed.
                            },
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                Utils.getImagePath("filter"),
                                height: 30,
                                width: 40,
                              ),
                              iconSize: 30,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // controller.homeDetailData.data == null
                      //     ? SizedBox(
                      //         height: Get.height,
                      //         child: Center(
                      //           child: Text(
                      //             "No data available",
                      //             style: TextStyle(color: AppColors.white),
                      //           ),
                      //         ),
                      //       )
                      //     : SizedBox(
                      //         height: 40,
                      //         child: ListView.separated(
                      //             padding: EdgeInsets.zero,
                      //             shrinkWrap: true,
                      //             scrollDirection: Axis.horizontal,
                      //             itemBuilder: (context, index) {
                      //               return Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.start,
                      //                 children: [
                      //                   CustomButton(
                      //                       borderBool: true,
                      //                       width: 97,
                      //                       height: 40,
                      //                       borderRadius:
                      //                           BorderRadius.circular(35),
                      //                       backGroundColor:
                      //                           controller.indexSelected ==
                      //                                   index
                      //                               ? AppColors.blue
                      //                               : AppColors.pinkColor,
                      //                       onPressed: () {
                      //                         controller.indexSelected = index;
                      //                         controller.update();
                      //                       },
                      //                       child: CommonText(
                      //                         text: controller
                      //                             .homeDetailData
                      //                             .data!
                      //                             .creators![index]
                      //                             .genreName!,
                      //                         fontSize: 12,
                      //                         color: AppColors.white,
                      //                       )),
                      //                 ],
                      //               );
                      //             },
                      //             separatorBuilder: (context, index) =>
                      //                 SizedBox(
                      //                   width: 10,
                      //                 ),
                      //             itemCount: controller
                      //                 .homeDetailData.data!.creators!.length),
                      //       ),

                      SizedBox(
                        height: 20,
                      ),
                      controller.homeDetailData.data == null
                          ? SizedBox(
                              height: Get.height,
                            )
                          : SizedBox(
                              height: Get.height,
                              child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 20,
                                ),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller
                                    .homeDetailData.data!.creators!.length,
                                itemBuilder: (context, categoryIndex) {
                                  String category = controller
                                      .homeDetailData
                                      .data!
                                      .creators![categoryIndex]
                                      .genreName!;
                                  List<Map<String, dynamic>> movies =
                                      moviesByCategory[category] ?? [];

                                  return CategorySection(
                                      category: category,
                                      sliderByGenres: controller.homeDetailData
                                          .data!.creators![categoryIndex]);
                                },
                              ),
                            ),
                    ],
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
