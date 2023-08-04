import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final double height;
  final bool titleBool;
  final double radius;
  final double width;
  final String imageUrl; // URL of the movie poster image

  MovieCard(
      {required this.title,
      this.height = 194,
      this.radius = 8.0,
      this.width = 141,
      this.titleBool = false,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width, // Adjust the width as needed
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Image.network(
                height: height,
                width: width,
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          if (titleBool) SizedBox(height: 15.0),
          if (titleBool)
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
