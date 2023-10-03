import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../app/services/local_storage.dart';
import '../../../../app/util/loader.dart';
import '../../../../data/models/login_model.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../routes/app_routes.dart';

class SignupController extends GetxController {
  TextEditingController emailTxt = TextEditingController();
  TextEditingController passTxt = TextEditingController();
  TextEditingController usrName = TextEditingController();
  // TextEditingController usrName = TextEditingController();
  final passwordVisible = true.obs;
  bool radioCheck = false;
  String creater = "User";
  final formKey = GlobalKey<FormState>();

  LoginModel authModal = LoginModel();
  signUP() async {
    LoadingDialog.show();
    try {
      final result = await AuthenticationRepositoryIml()
          .signUp(usrName.text, passTxt.text, emailTxt.text, "");
      print(result);
      if (authModal.status!) {
        LoadingDialog.hide();
        Get.find<LocalStorageService>().loginUser = authModal;
        print(Get.find<LocalStorageService>().loginUser!.message);
        Get.toNamed(Routes.bottomBar);
      } else {
        LoadingDialog.hide();
      }
      update();
    } catch (e) {
      LoadingDialog.hide();
      rethrow;
    }
  }

  updateBool(bool value) {
    radioCheck = value;
    update();
  }
}
