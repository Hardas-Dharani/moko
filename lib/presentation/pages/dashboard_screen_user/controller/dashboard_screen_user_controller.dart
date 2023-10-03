import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moko/app/services/local_storage.dart';

import '../../../../app/util/loader.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../domain/entities/auth_model.dart';
import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

enum buttonEnum { live, category, newest }

class DashBoardScreenUserController extends GetxController {
 

  updateProfile() async {
    LoadingDialog.show();
    try {
      // await AuthenticationRepositoryIml()
      //     .updateProfile(usrTxt.text, emailTxt.text, phnTxt.text);
      LoadingDialog.hide();
      update();
    } catch (e) {
      LoadingDialog.hide();
      rethrow;
    }
  }
}
