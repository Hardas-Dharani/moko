import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moko/app/util/util.dart';

import '../config/app_colors.dart';

class SvgImageAssetWidget extends StatelessWidget {
  final String imagePath;
  final double height;
  final double? width;
  final Color? color;
  final BoxFit boxFit;
  const SvgImageAssetWidget({
    Key? key,
    required this.imagePath,
    this.height = 20,
    this.width = 20,
    this.boxFit = BoxFit.fill,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Utils.getSvgFilePath(imagePath),
      color: color ?? AppColors.primary,
      height: height,
      width: width,
      fit: boxFit,
    );
  }
}
