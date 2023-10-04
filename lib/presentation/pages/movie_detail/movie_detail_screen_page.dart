import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/app/services/local_storage.dart';
import 'package:moko/app/util/common_txt.dart';
import 'package:moko/app/util/custom_button.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/util/movie_card.dart';
import '../../../app/util/util.dart';
import 'controller/movie_detail_screen_controller.dart';

class CircleImageWithName extends StatelessWidget {
  final String imageUrl;
  final String userName;

  CircleImageWithName({required this.imageUrl, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: ClipOval(child: Image.network(imageUrl)),
        ),
        SizedBox(height: 8),
        Text(
          userName,
          style: TextStyle(
              fontSize: 12,
              color: AppColors.white,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class MovieDetailScreen extends GetView<MovieDetailController> {
  MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MovieDetailController());
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size(Get.width, 66),
      //   child: AppBar(
      //     actions: [
      //       IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
      //     ],
      //     title: Image.asset(
      //       Utils.getImagePath("logo"),
      //       width: 108,
      //       height: 250,
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
        child: GetBuilder<MovieDetailController>(builder: (_) {
          return Container(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: controller.movieDetailModel.data == null
                  ? SizedBox(
                      height: Get.height,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 460,
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  // Image Container
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(controller
                                                .movieDetailModel
                                                .data!
                                                .channelDetail!
                                                .seriesPoster ??
                                            Get.arguments),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  // Gradient Container
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          AppColors.lightPurple,
                                          AppColors.lightPurple
                                              .withOpacity(0.6),
                                          AppColors.pinkColor.withOpacity(0.2),

                                          AppColors.black.withOpacity(0.2),

                                          // Add more colors if needed
                                        ],
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                  ),

                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.play_circle_outline_outlined,
                                        color: AppColors.white,
                                        weight: 5,
                                        size: 90,
                                      ))
                                ],
                              ),
                            ),
                            PreferredSize(
                              preferredSize: Size(Get.width, 66),
                              child: AppBar(
                                leading: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(Icons.arrow_back_ios)),
                                backgroundColor:
                                    AppColors.black.withOpacity(0.2),
                                centerTitle: true,
                                actions: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_border))
                                ],
                                title: Image.asset(
                                  Utils.getImagePath("logo"),
                                  width: 108,
                                  height: 250,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    padding: EdgeInsets.all(2),
                                    child: CommonText(
                                      text: "#4",
                                      color: AppColors.black,
                                      fontSize: 12,
                                      weight: FontWeight.bold,
                                    ),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CommonText(
                                    text: "84% Match",
                                    color: AppColors.blue,
                                    weight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CommonText(
                                    text: "2018",
                                    color: AppColors.white,
                                    weight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CommonText(
                                    text: "2 h - 21 m",
                                    color: AppColors.white,
                                    weight: FontWeight.bold,
                                    fontSize: 12,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  CommonText(
                                    text: "Share:",
                                    color: AppColors.white,
                                    fontSize: 14,
                                    weight: FontWeight.bold,
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.center,
                                    onPressed: () {},
                                    icon: Image.network(
                                      "https://cdn-icons-png.flaticon.com/512/124/124010.png",
                                      width: 20,
                                    ),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.centerLeft,
                                    onPressed: () {},
                                    icon: Image.network(
                                      "https://1000logos.net/wp-content/uploads/2018/05/Gmail-Logo-2013.png",
                                      width: 30,
                                    ),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.centerLeft,
                                    onPressed: () {},
                                    icon: Image.network(
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/767px-WhatsApp.svg.png",
                                      width: 20,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  CustomButton(
                                      width: 200,
                                      borderBool: true,
                                      backGroundColor: AppColors.pinkColor,
                                      onPressed: () {
                                        final movieModels =
                                            Get.find<LocalStorageService>()
                                                .movieModels;

                                        if (movieModels != null) {
                                          final newMovie = MovieModelDemo(
                                            movieName: controller
                                                    .movieDetailModel
                                                    .data
                                                    ?.channelDetail
                                                    ?.seriesName ??
                                                '',
                                            id: controller.movieDetailModel.data
                                                    ?.channelDetail?.id
                                                    ?.toString() ??
                                                '',
                                            image: controller
                                                    .movieDetailModel
                                                    .data
                                                    ?.channelDetail
                                                    ?.seriesPoster ??
                                                Get.arguments,
                                          );

                                          final existingIndex =
                                              movieModels.indexWhere((movie) =>
                                                  movie.id == newMovie.id);

                                          if (existingIndex != -1) {
                                            // If a movie with the same ID exists, replace it
                                            movieModels[existingIndex] =
                                                newMovie;
                                          } else {
                                            // Otherwise, add the new movie
                                            movieModels.add(newMovie);
                                          }
                                        } else {
                                          final defaultMovieModel =
                                              MovieModelDemo(
                                            movieName: controller
                                                    .movieDetailModel
                                                    .data
                                                    ?.channelDetail
                                                    ?.seriesName ??
                                                '',
                                            id: controller.movieDetailModel.data
                                                    ?.channelDetail?.id
                                                    ?.toString() ??
                                                '',
                                            image: controller
                                                    .movieDetailModel
                                                    .data
                                                    ?.channelDetail
                                                    ?.seriesPoster ??
                                                Get.arguments,
                                          );

                                          // Create a new list and add the defaultMovieModel
                                          final newMovieModelsList = [
                                            defaultMovieModel
                                          ];

                                          // Store the new list in the LocalStorageService
                                          Get.find<LocalStorageService>()
                                              .movieModels = newMovieModelsList;
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CommonText(
                                            text: "Add To Watchlist",
                                            color: AppColors.white,
                                          )
                                        ],
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CommonText(
                                text: "Description:",
                                color: AppColors.white,
                                weight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CommonText(
                                text: controller.movieDetailModel.data!
                                        .channelDetail!.seriesInfo ??
                                    "",
                                color: AppColors.white,
                                fontSize: 12,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // RichText(
                              //   text: TextSpan(
                              //       text: "Director:",
                              //       children: [
                              //         TextSpan(
                              //             text: "  Name goes here",
                              //             style: TextStyle(
                              //                 color: AppColors.white,
                              //                 fontSize: 12,
                              //                 fontWeight: FontWeight.w300))
                              //       ],
                              //       style: TextStyle(
                              //           color: AppColors.white,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.bold)),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // RichText(
                              //   text: TextSpan(
                              //       text: "Writer:",
                              //       children: [
                              //         TextSpan(
                              //             text:
                              //                 "  Name goes here, Name goes here, Name goes here.",
                              //             style: TextStyle(
                              //                 color: AppColors.white,
                              //                 fontSize: 12,
                              //                 fontWeight: FontWeight.w300))
                              //       ],
                              //       style: TextStyle(
                              //           color: AppColors.white,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.bold)),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // RichText(
                              //   text: TextSpan(
                              //       text: "Production:",
                              //       children: [
                              //         TextSpan(
                              //             text: "  Name goes here",
                              //             style: TextStyle(
                              //                 color: AppColors.white,
                              //                 fontSize: 12,
                              //                 fontWeight: FontWeight.w300))
                              //       ],
                              //       style: TextStyle(
                              //           color: AppColors.white,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.bold)),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Row(
                              //   children: [
                              //     Container(
                              //       height: 30,
                              //       width: 5,
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(35),
                              //         gradient: LinearGradient(
                              //           begin: Alignment.bottomCenter,
                              //           end: Alignment.topCenter,
                              //           colors: [
                              //             AppColors.darkpinkColor,
                              //             AppColors.darkPurple,
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 10,
                              //     ),
                              //     CommonText(
                              //       text: "Actors",
                              //       color: AppColors.white,
                              //       fontSize: 16,
                              //       weight: FontWeight.bold,
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // SizedBox(
                              //   height: 100,
                              //   child: ListView.separated(
                              //       itemCount: 3,
                              //       padding: EdgeInsets.only(left: 15),
                              //       shrinkWrap: true,
                              //       scrollDirection: Axis.horizontal,
                              //       separatorBuilder: (context, index) =>
                              //           SizedBox(
                              //             width: 10,
                              //           ),
                              //       itemBuilder: (context, index) {
                              //         return CircleImageWithName(
                              //           imageUrl:
                              //               'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png', // Replace with the URL of the user's profile image
                              //           userName:
                              //               'John Doe', // Replace with the user's name
                              //         );
                              //       }),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Row(
                              //   children: [
                              //     Container(
                              //       height: 30,
                              //       width: 5,
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(35),
                              //         gradient: LinearGradient(
                              //           begin: Alignment.bottomCenter,
                              //           end: Alignment.topCenter,
                              //           colors: [
                              //             AppColors.darkpinkColor,
                              //             AppColors.darkPurple,
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: 10,
                              //     ),
                              //     CommonText(
                              //       text: "Director",
                              //       color: AppColors.white,
                              //       fontSize: 16,
                              //       weight: FontWeight.bold,
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // SizedBox(
                              //   height: 100,
                              //   child: ListView.separated(
                              //       itemCount: 2,
                              //       padding: EdgeInsets.only(left: 15),
                              //       shrinkWrap: true,
                              //       scrollDirection: Axis.horizontal,
                              //       separatorBuilder: (context, index) =>
                              //           SizedBox(
                              //             width: 10,
                              //           ),
                              //       itemBuilder: (context, index) {
                              //         return CircleImageWithName(
                              //           imageUrl:
                              //               'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png', // Replace with the URL of the user's profile image
                              //           userName:
                              //               'John Doe', // Replace with the user's name
                              //         );
                              //       }),
                              // ),

                              CommonText(
                                text: "Related More",
                                color: AppColors.white,
                                fontSize: 16,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 220,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  // separatorBuilder: (context, index) => SizedBox(
                                  //   width: 15,
                                  // ),
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemCount: controller.movieDetailModel.data!
                                      .channelAllVideos!.length,
                                  itemBuilder: (context, categoryIndex) {
                                    return MovieCard(
                                      titleBool: true,
                                      channelID: controller
                                          .movieDetailModel
                                          .data!
                                          .channelAllVideos![categoryIndex]
                                          .id
                                          .toString(),
                                      title: controller
                                              .movieDetailModel
                                              .data!
                                              .channelAllVideos![categoryIndex]
                                              .videoTitle ??
                                          "",
                                      imageUrl: controller
                                                  .movieDetailModel
                                                  .data!
                                                  .channelAllVideos![
                                                      categoryIndex]
                                                  .videoImage! !=
                                              ""
                                          ? controller
                                              .movieDetailModel
                                              .data!
                                              .channelAllVideos![categoryIndex]
                                              .videoImage!
                                          : "https://www.prokerala.com/movies/assets/img/no-poster-available.jpg",
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          );
        }),
      ),
    );
  }
}
