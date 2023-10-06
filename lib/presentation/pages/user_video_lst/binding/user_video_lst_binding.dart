import 'package:get/get.dart';

import '../controller/user_video_lst_controller.dart';

class UserVideoLstScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserVideoLstScreenController());
  }
}
