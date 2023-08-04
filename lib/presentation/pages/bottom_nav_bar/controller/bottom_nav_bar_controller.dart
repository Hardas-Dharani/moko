import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  BottomNavigationItem _currentItem = BottomNavigationItem.Home;

  BottomNavigationItem get currentItem => _currentItem;

  DateTime now = DateTime.now();
  bool hasNewNotification = false;
  String fireStoreId = '';

  void changeCurrentItem(BottomNavigationItem item) {
    _currentItem = item;
    update();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
}

enum BottomNavigationItem { Home, explore, mywishlist, profile }
