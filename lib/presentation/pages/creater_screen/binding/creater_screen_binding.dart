import 'package:get/get.dart';

import '../controller/creater_screen_controller.dart';

class CreaterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreaterController());
  }
}
