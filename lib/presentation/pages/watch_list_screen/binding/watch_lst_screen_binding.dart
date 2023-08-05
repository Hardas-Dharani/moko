import 'package:get/get.dart';

import '../controller/watch_lst_screen_controller.dart';

class WatchListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WatchListController());
  }
}
