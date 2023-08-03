import 'package:get/get.dart';

import '../controller/sign_up_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}
