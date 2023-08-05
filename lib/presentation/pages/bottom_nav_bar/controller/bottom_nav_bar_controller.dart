import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  BottomNavigationItem _currentItem = BottomNavigationItem.Home;
  List<Map<String, dynamic>> drawerItem = [
    {'label': 'Home', 'icon': Icons.home_outlined},
    {'label': 'My Wish Lists', 'icon': Icons.list},
    {'label': 'TV Shows', 'icon': Icons.tv},
    {'label': 'Movies', 'icon': Icons.movie},
    {'label': 'Live Streaming Profile', 'icon': Icons.live_tv},
    {'label': 'Settings', 'icon': Icons.settings},
    {'label': 'Sign Out', 'icon': Icons.logout},
  ];
  DateTime now = DateTime.now();

  bool hasNewNotification = false;
  String fireStoreId = '';
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  BottomNavigationItem get currentItem => _currentItem;

  void changeCurrentItem(BottomNavigationItem item) {
    _currentItem = item;
    update();
  }
}

enum BottomNavigationItem { Home, explore, mywishlist, profile }
