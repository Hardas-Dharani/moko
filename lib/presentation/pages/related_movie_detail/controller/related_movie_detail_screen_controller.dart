import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moko/data/models/movie_detail_model.dart';

import '../../../../app/util/loader.dart';
import '../../../../app/util/toast_message.dart';
import '../../../../data/repositories/home_repository.dart';
import '../../../../domain/entities/auth_model.dart';
import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

class ReleatedMovieDetailController extends GetxController {
  TextEditingController emailTxt = TextEditingController();
  TextEditingController passTxt = TextEditingController();
  final passwordVisible = true.obs;
  final formKey = GlobalKey<FormState>();
  AuthModal authModal = AuthModal();
  BottomNavigationItem _currentItem = BottomNavigationItem.Home;

  DateTime now = DateTime.now();
  int indexSelected = 0;
  bool hasNewNotification = false;
  String fireStoreId = '';
  MovieDetailModel movieDetailModel = MovieDetailModel();
  BottomNavigationItem get currentItem => _currentItem;

  void changeCurrentItem(BottomNavigationItem item) {
    _currentItem = item;
    update();
  }

  movieDetail() async {
    LoadingDialog.show();
    try {
      print(Get.arguments["channel_id"]);
      final result =
          await HomeRepositoryIml().getMovieDetail(Get.arguments["channel_id"]);
      if (result["status"]) {
        ToastMessage().toastMessae(result["message"]);
        ;
        movieDetailModel = MovieDetailModel.fromJson(result);
      } else {
        ToastMessage().toastMessae(result["message"]);
        ;
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
    movieDetail();
    // TODO: implement onInit
    super.onInit();
  }
}
