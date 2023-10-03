import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../app/util/loader.dart';
import '../../../../data/models/home_detail_model.dart';
import '../../../../data/repositories/home_repository.dart';
import '../../../../domain/entities/auth_model.dart';
import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

enum buttonEnum { live, category, newest }

class ExploreController extends GetxController {
  TextEditingController searchTxt = TextEditingController();
  TextEditingController passTxt = TextEditingController();
  final passwordVisible = true.obs;
  final formKey = GlobalKey<FormState>();
  AuthModal authModal = AuthModal();
  BottomNavigationItem _currentItem = BottomNavigationItem.Home;

  var seletectButton = buttonEnum.live;
  HomeDetailModel homeDetailData = HomeDetailModel();

  DateTime now = DateTime.now();

  int indexSelected = 0;
  bool hasNewNotification = false;
  String fireStoreId = '';
  BottomNavigationItem get currentItem => _currentItem;
  void changeCurrentItem(BottomNavigationItem item) {
    _currentItem = item;
    update();
  }

  getDashBoard() async {
    LoadingDialog.show();
    try {
      final s = await HomeRepositoryIml().getDashBoard();
      homeDetailData = HomeDetailModel.fromJson(s);
      print(s);
      // createrListMenuModel = CreaterListMenuModel.fromJson(s);
      LoadingDialog.hide();
      update();
    } catch (e) {
      LoadingDialog.hide();
      rethrow;
    }
  }

  getSearch() async {
    LoadingDialog.show();
    try {
      final s = await HomeRepositoryIml().getSearch(searchTxt.text);
      homeDetailData = HomeDetailModel.fromJson(s);
      print(s);
      // createrListMenuModel = CreaterListMenuModel.fromJson(s);
      LoadingDialog.hide();
      update();
    } catch (e) {
      LoadingDialog.hide();
      rethrow;
    }
  }

  @override
  void onInit() {
    getDashBoard();
    // TODO: implement onInit
    super.onInit();
  }
}
