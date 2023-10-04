import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/data/models/creater_menu_model.dart';

import '../../../../app/services/local_storage.dart';
import '../../../../data/repositories/home_repository.dart';

class BottomNavBarController extends GetxController {
  BottomNavigationItem _currentItem = BottomNavigationItem.Home;
  List<Map<String, dynamic>> drawerItem = [
    {'label': 'Home', 'icon': Icons.home_outlined},
    {'label': 'Creator', 'icon': Icons.list},
    {'label': 'User', 'icon': Icons.dashboard},
    // {'label': 'TV Shows', 'icon': Icons.tv},
    // {'label': 'Movies', 'icon': Icons.movie},
    // {'label': 'Live Streaming Profile', 'icon': Icons.live_tv},
    // {'label': 'Settings', 'icon': Icons.settings},
    {'label': 'Sign Out', 'icon': Icons.logout},
  ];
  DateTime now = DateTime.now();

  bool hasNewNotification = false;
  String fireStoreId = '';
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  CreaterListMenuModel createrListMenuModel = CreaterListMenuModel();
  BottomNavigationItem get currentItem => _currentItem;
  categoryMenu() async {
    try {
      final s = await HomeRepositoryIml().getCategory();
      createrListMenuModel = CreaterListMenuModel.fromJson(s);

      update();
    } catch (e) {
      rethrow;
    }
  }

  void changeCurrentItem(BottomNavigationItem item) {
    _currentItem = item;
    update();
  }

  @override
  void onInit() {
    categoryMenu();
    print(Get.find<LocalStorageService>().loginUser!.data!.user!.userType);
    // TODO: implement onInit
    super.onInit();
  }
}

enum BottomNavigationItem { Home, explore, mywishlist, profile }
