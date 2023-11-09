import 'package:get/get.dart';

import '../controller/myplaylist_controller.dart';

class MyPlayListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPlayListController());
  }
}
