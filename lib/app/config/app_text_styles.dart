import 'package:flutter/material.dart';

/// AppTextStyle format as follows:
/// [fontWeight][fontSize][colorName][opacity]
/// Example: bold18White05
///
class AppTextStyles {
  static TextStyle mainHeader = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle secondaryHeader = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle mainTxt = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
  static TextStyle secondaryTxt = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
}
