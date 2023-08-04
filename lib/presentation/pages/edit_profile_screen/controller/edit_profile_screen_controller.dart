import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../domain/entities/auth_model.dart';
import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

class EditProfileController extends GetxController {
  TextEditingController emailTxt = TextEditingController();
  TextEditingController passTxt = TextEditingController();
  final passwordVisible = true.obs;
  final formKey = GlobalKey<FormState>();
  AuthModal authModal = AuthModal();
  login() async {
    try {
      authModal = await AuthenticationRepositoryIml()
          .signIn(emailTxt.text, passTxt.text);

      update();
    } catch (e) {
      rethrow;
    }
  }

  BottomNavigationItem _currentItem = BottomNavigationItem.Home;

  BottomNavigationItem get currentItem => _currentItem;
  var seletectButton = buttonEnum.live;
  DateTime now = DateTime.now();
  int indexSelected = 0;
  bool hasNewNotification = false;
  String fireStoreId = '';

  void changeCurrentItem(BottomNavigationItem item) {
    _currentItem = item;
    update();
  }
}

enum buttonEnum { live, category, newest }
