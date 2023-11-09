import 'package:get/get.dart';

import '../controller/add_playlist_controller.dart';

class AddPlayListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPlayListController());
  }
}
