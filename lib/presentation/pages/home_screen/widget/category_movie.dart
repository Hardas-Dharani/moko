import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/presentation/pages/home_screen/widget/live_stream.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../app/util/movie_card.dart';

class CategorySection extends StatelessWidget {
  final String category;
  final List<String> movies;
  final bool showTitle;
  CategorySection(
      {required this.category, this.showTitle = true, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          GestureDetector(
            onTap: () {
              Get.to(LiveStreamScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category,
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
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
                titleBool: !showTitle,
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
