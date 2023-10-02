import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/common_txt.dart';
import '../../../app/util/custom_button.dart';
import '../../../app/util/custom_txt_field.dart';
import '../../../app/util/util.dart';
import '../home_screen/widget/category_movie.dart';
import 'controller/explore_screen_controller.dart';

class ExploreScreen extends GetView<ExploreController> {
  List<String> movie = ['Movie 1', 'Movie 2', 'Movie 3'];

  List<String> buttonString = ['Horror', 'Action', 'Drama', 'Romance'];
  ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ExploreController());
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
            GetBuilder<ExploreController>(builder: (_) {
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
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomButton(
                                  borderBool: true,
                                  width: 97,
                                  height: 40,
                                  borderRadius: BorderRadius.circular(35),
                                  backGroundColor:
                                      controller.indexSelected == index
                                          ? AppColors.blue
                                          : AppColors.pinkColor,
                                  onPressed: () {
                                    controller.indexSelected = index;
                                    controller.update();
                                  },
                                  child: CommonText(
                                    text: buttonString[index],
                                    fontSize: 12,
                                    color: AppColors.white,
                                  ));
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                            itemCount: buttonString.length),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        itemBuilder: (context, categoryIndex) {
                          String category = categories[categoryIndex];
                          List<Map<String, dynamic>> movies =
                              moviesByCategory[category] ?? [];

                          return CategorySection(
                              showTitle: false,
                              category: category,
                              sliderByGenres: movies);
                        },
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
