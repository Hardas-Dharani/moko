import 'package:get/get.dart';

import '../controller/update_video_screen_controller.dart';

class UpdateVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateVideoController());
  }
}
