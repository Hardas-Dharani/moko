import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/presentation/pages/home_screen/widget/category_movie.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/util/movie_card.dart';
import 'controller/home_screen_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});
  final List<String> categories = [
    'Popular Shows',
    'Upcoming Shows',
    'Popular Shows',
    'Sci-Fi',
  ];

  final Map<String, List<String>> moviesByCategory = {
    'Popular Shows': ['Movie 1', 'Movie 2', 'Movie 3'],
    'Upcoming Shows': ['Movie 4', 'Movie 5', 'Movie 6'],
    // ignore: equal_keys_in_map
    'Popular Shows': ['Movie 7', 'Movie 8', 'Movie 9'],
    'Sci-Fi': ['Movie 10', 'Movie 11', 'Movie 12'],
  };
  List<String> movie = ['Movie 1', 'Movie 2', 'Movie 3'];
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.black.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              // color: AppColors.blue,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 236, // Adjust the height as needed

              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: movie.length,
                itemBuilder: (context, movieIndex) {
                  String movieTitle = movie[movieIndex];
                  return MovieCard(
                    width: 185,
                    height: 236,
                    radius: 6,
                    title: movieTitle,
                    imageUrl:
                        "https://lumiere-a.akamaihd.net/v1/images/p_shangchiandthelegendofthetenringshomeentupdate_22055_7b62fa67.jpeg?region=0%2C0%2C540%2C810",
                  );
                },
              ),
            ),
            Container(
              color: AppColors.black,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                itemCount: categories.length,
                itemBuilder: (context, categoryIndex) {
                  String category = categories[categoryIndex];
                  List<String> movies = moviesByCategory[category] ?? [];

                  return CategorySection(category: category, movies: movies);
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
