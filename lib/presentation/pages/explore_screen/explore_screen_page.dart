import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/custom_txt_field.dart';
import '../../../app/util/movie_card.dart';
import '../../../app/util/util.dart';
import '../../../data/models/search_model.dart';
import 'controller/explore_screen_controller.dart';

class ExploreScreen extends GetView<ExploreController> {
  List<String> movie = ['Movie 1', 'Movie 2', 'Movie 3'];

  List<String> buttonString = ['Horror', 'Action', 'Drama', 'Romance'];
  ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ExploreController());
    return Scaffold(
      key: controller.scaffoldKey,
      endDrawer: GetBuilder<ExploreController>(builder: (_) {
        return Drawer(
          child: controller.seachModel.data == null
              ? SizedBox()
              : ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    // Drawer header
                    DrawerHeader(
                      child: Text(
                        "Filter Options",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Filter by Creator
                    ListTile(
                      title: Text(
                        "Filter by Creator",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: DropdownButton<Creators>(
                        value: controller.selectedCreator,
                        onChanged: (value) {
                          controller.selectedCreator = value!;
                          controller.update();
                        },
                        items: controller.seachModel.data!.creators!
                            .map<DropdownMenuItem<Creators>>(
                          (Creators? creator) {
                            return DropdownMenuItem<Creators>(
                              value: creator,
                              child: Text(creator!.name!),
                            );
                          },
                        ).toList(),
                        hint: Text("Select Creator"),
                      ),
                    ),
                    // Filter by Language
                    ListTile(
                      title: Text(
                        "Filter by Language",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: DropdownButton<Creators>(
                        value: controller.selectedLanguage,
                        onChanged: (value) {
                          controller.selectedLanguage = value!;
                        },
                        items: controller.seachModel.data!.languages!
                            .map<DropdownMenuItem<Creators>>((language) {
                          return DropdownMenuItem<Creators>(
                            value: language,
                            child: Text(language.name!),
                          );
                        }).toList(),
                        hint: Text("Select Language"),
                      ),
                    ),
                    // Apply Filters button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.applyFilters();
                        },
                        child: Text("Apply Filters"),
                      ),
                    ),
                  ],
                ),
        );
      }),
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
            GetBuilder<ExploreController>(builder: (_) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
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
                            controller: controller.searchTxt,
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
                              controller.getSearch();
                              // Handle the submitted value here if needed.
                            },
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              onPressed: () {
                                controller.scaffoldKey.currentState!
                                    .openEndDrawer();
                              },
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
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // SizedBox(
                      //   height: 40,
                      //   child: ListView.separated(
                      //       shrinkWrap: true,
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (context, index) {
                      //         return CustomButton(
                      //             borderBool: true,
                      //             width: 97,
                      //             height: 40,
                      //             borderRadius: BorderRadius.circular(35),
                      //             backGroundColor:
                      //                 controller.indexSelected == index
                      //                     ? AppColors.blue
                      //                     : AppColors.pinkColor,
                      //             onPressed: () {
                      //               controller.indexSelected = index;
                      //               controller.update();
                      //             },
                      //             child: CommonText(
                      //               text: buttonString[index],
                      //               fontSize: 12,
                      //               color: AppColors.white,
                      //             ));
                      //       },
                      //       separatorBuilder: (context, index) => SizedBox(
                      //             width: 10,
                      //           ),
                      //       itemCount: buttonString.length),
                      // ),

                      SizedBox(
                        height: 20,
                      ),
                      controller.homeDetailData.data == null
                          ? SizedBox(
                              height: Get.height,
                            )
                          : SizedBox(
                              height: Get.height,
                              child: controller.seachModel.data != null &&
                                      controller
                                          .seachModel.data!.result!.isNotEmpty
                                  ? GridView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.filteredData.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 0.8,
                                              mainAxisSpacing: 30,
                                              crossAxisCount: 2),
                                      itemBuilder: (context, index) {
                                        return MovieCard(
                                            titleBool: true,
                                            channelID: controller
                                                .filteredData[index].id
                                                .toString(),
                                            title: controller
                                                    .filteredData[index]
                                                    .title ??
                                                "",
                                            imageUrl: controller
                                                        .filteredData[index]
                                                        .image !=
                                                    ""
                                                ? controller.seachModel.data!
                                                    .result![index].image!
                                                : "https://www.prokerala.com/movies/assets/img/no-poster-available.jpg");
                                      },
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(top: 60),
                                      child: Text(
                                        "No Recent Search..",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16),
                                      ),
                                    ),
                            )

                      //      SizedBox(
                      //         height: Get.height / 1.3,
                      //         child: ListView.separated(
                      //           separatorBuilder: (context, index) => SizedBox(
                      //             height: 20,
                      //           ),
                      //           shrinkWrap: true,
                      //           padding: EdgeInsets.only(bottom: 100),
                      //           // physics: NeverScrollableScrollPhysics(),
                      //           itemCount: controller.homeDetailData.data!
                      //               .sliderByGenres!.length,
                      //           itemBuilder: (context, categoryIndex) {
                      //             String category = controller
                      //                 .homeDetailData
                      //                 .data!
                      //                 .sliderByGenres![categoryIndex]
                      //                 .genreName!;
                      //             List<Map<String, dynamic>> movies =
                      //                 moviesByCategory[category] ?? [];

                      //             return CategorySection(
                      //                 category: category,
                      //                 sliderByGenres: controller
                      //                     .homeDetailData
                      //                     .data!
                      //                     .sliderByGenres![categoryIndex]);
                      //           },
                      //         ),
                      //       ),
                      // // SizedBox(
                      //   height: 60,
                      // ),
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
// 