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
      final result = await HomeRepositoryIml().getCategory();

      if (result["status"]) {
        Get.snackbar('Message', result["message"]);
        createrListMenuModel = CreaterListMenuModel.fromJson(result);
      } else {
        Get.snackbar('Message', result["message"]);
      }
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
    try {
      if (Get.find<LocalStorageService>().loginUser!.data!.user!.userType ==
          "User") {
        categoryMenu();
        print(Get.find<LocalStorageService>().loginUser!.data!.user!.userType);
      }
    } catch (e) {
      rethrow;
    }

    // TODO: implement onInit
    super.onInit();
  }
}

enum BottomNavigationItem { Home, explore, mywishlist, profile }
