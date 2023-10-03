import 'package:get/get.dart';

import '../controller/edit_video_screen_controller.dart';

class EditVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditVideoController());
  }
}
