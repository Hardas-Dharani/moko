import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/data/models/home_detail_model.dart';
import 'package:moko/presentation/pages/home_screen/widget/live_stream.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../app/util/movie_card.dart';

class CategorySection extends StatelessWidget {
  final String category;
  final SliderByGenres sliderByGenres;
  // final List<Map<String, dynamic>> movies;
  final bool showTitle;
  CategorySection(
      {required this.category,
      this.showTitle = true,
      required this.sliderByGenres});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          SizedBox(
            height: 10,
          ),
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
          height: 15,
        ),
        Container(
          height: 200, // Adjust the height as needed
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: sliderByGenres.slider!.length,
            itemBuilder: (context, movieIndex) {
              // Map<String, dynamic> movieTitle = movies[movieIndex];
              return MovieCard(
                  channelID: sliderByGenres.slider![movieIndex].id.toString(),
                  titleBool: !showTitle,
                  title: sliderByGenres.slider![movieIndex].seriesName!,
                  imageUrl: sliderByGenres.slider![movieIndex].seriesPoster! !=
                          ""
                      ? sliderByGenres.slider![movieIndex].seriesPoster!
                      : "https://www.prokerala.com/movies/assets/img/no-poster-available.jpg");
            },
          ),
        ),
      ],
    );
  }
}
