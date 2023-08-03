import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/config/app_colors.dart';
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            // color: AppColors.blue,
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 200, // Adjust the height as needed
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: movie.length,
              itemBuilder: (context, movieIndex) {
                String movieTitle = movie[movieIndex];
                return MovieCard(
                  title: movieTitle,
                  imageUrl:
                      "https://lumiere-a.akamaihd.net/v1/images/p_shangchiandthelegendofthetenringshomeentupdate_22055_7b62fa67.jpeg?region=0%2C0%2C540%2C810",
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.black,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemCount: categories.length,
                itemBuilder: (context, categoryIndex) {
                  String category = categories[categoryIndex];
                  List<String> movies = moviesByCategory[category] ?? [];

                  return CategorySection(category: category, movies: movies);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String category;
  final List<String> movies;

  CategorySection({required this.category, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: TextStyle(
                fontSize: 20,
                color: AppColors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 200, // Adjust the height as needed
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, movieIndex) {
              String movieTitle = movies[movieIndex];
              return MovieCard(
                title: movieTitle,
                imageUrl:
                    "https://lumiere-a.akamaihd.net/v1/images/p_shangchiandthelegendofthetenringshomeentupdate_22055_7b62fa67.jpeg?region=0%2C0%2C540%2C810",
              );
            },
          ),
        ),
      ],
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String imageUrl; // URL of the movie poster image

  MovieCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // Adjust the width as needed
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          // Text(
          //   title,
          //   style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold,
          //       color: AppColors.white),
          //   maxLines: 2,
          //   overflow: TextOverflow.ellipsis,
          // ),
        ],
      ),
    );
  }
}
