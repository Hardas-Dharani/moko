import 'package:get/get.dart';

import '../controller/dashboard_screen_user_controller.dart';

class DashBoardScreenUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardScreenUserController());
  }
}
