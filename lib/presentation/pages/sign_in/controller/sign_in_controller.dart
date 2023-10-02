import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moko/app/services/local_storage.dart';
import 'package:moko/app/util/loader.dart';
import 'package:moko/data/models/login_model.dart';

import '../../../../data/repositories/auth_repository.dart';
import '../../../../routes/app_routes.dart';

class SignInController extends GetxController {
  TextEditingController emailTxt = TextEditingController();
  TextEditingController passTxt = TextEditingController();
  final passwordVisible = true.obs;
  final formKey = GlobalKey<FormState>();
  LoginModel authModal = LoginModel();
  login() async {
    LoadingDialog.show();
    try {
      authModal = await AuthenticationRepositoryIml()
          .signIn(emailTxt.text, passTxt.text);
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
}
