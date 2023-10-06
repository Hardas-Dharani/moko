import 'package:get/get.dart';

import '../../../../app/util/loader.dart';

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
