import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moko/app/services/local_storage.dart';

import '../../../../app/util/loader.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../domain/entities/auth_model.dart';
import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

enum buttonEnum { live, category, newest }

class EditVideoController extends GetxController {
  TextEditingController emailTxt = TextEditingController();
  TextEditingController usrTxt = TextEditingController();
  TextEditingController phnTxt = TextEditingController();
  final passwordVisible = true.obs;
  final formKey = GlobalKey<FormState>();
  AuthModal authModal = AuthModal();
  BottomNavigationItem _currentItem = BottomNavigationItem.Home;

  var seletectButton = buttonEnum.live;

  DateTime now = DateTime.now();
  int indexSelected = 0;
  bool hasNewNotification = false;
  String fireStoreId = '';
  BottomNavigationItem get currentItem => _currentItem;
  void changeCurrentItem(BottomNavigationItem item) {
    _currentItem = item;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit

    if (Get.find<LocalStorageService>().loginUser != null) {
      usrTxt.text =
          Get.find<LocalStorageService>().loginUser!.data!.user!.name!;
      emailTxt.text =
          Get.find<LocalStorageService>().loginUser!.data!.user!.email!;
      phnTxt.text =
          Get.find<LocalStorageService>().loginUser!.data!.user!.phone!;
    }
    super.onInit();
  }

  updateProfile() async {
    LoadingDialog.show();
    try {
      await AuthenticationRepositoryIml()
          .updateProfile(usrTxt.text, emailTxt.text, phnTxt.text);
      LoadingDialog.hide();
      update();
    } catch (e) {
      LoadingDialog.hide();
      rethrow;
    }
  }
}
