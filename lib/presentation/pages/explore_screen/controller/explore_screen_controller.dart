import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/util/loader.dart';
import '../../../../data/models/home_detail_model.dart';
import '../../../../data/models/search_model.dart';
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
  SeachModel seachModel = SeachModel();
  List<Result> filteredData = [];

  // Initialize filter values
  Creators selectedCreator = Creators();
  Creators selectedLanguage = Creators();
  // String selectedActor = "";
  // String selectedDirector = "";

  // Controller for the end drawer
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  DateTime now = DateTime.now();

  int indexSelected = 0;

  bool hasNewNotification = false;
  String fireStoreId = '';
  BottomNavigationItem get currentItem => _currentItem;
  applyFilters() {
    // Apply filters to the original data based on selected values

    // filteredData =
    filteredData = (seachModel.data?.result
        ?.where((item) =>
            item.creatorIdList?.contains(
                    int.tryParse(selectedCreator.id.toString()) ?? 0) ==
                true &&
            item.languageId == int.tryParse(selectedLanguage.id.toString()))
        .toList())!;

    // Close the end drawer after applying filters
    Get.back();
    update();
  }

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
      seachModel = SeachModel.fromJson(s);
      filteredData = seachModel.data!.result!;
      if (seachModel.data!.languages!.isNotEmpty) {
        selectedLanguage = seachModel.data!.languages![0];
      }
      if (seachModel.data!.creators!.isNotEmpty) {
        selectedCreator = seachModel.data!.creators![0];
      }
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
