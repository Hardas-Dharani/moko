import 'package:get/get.dart';

import '../controller/my_channel_controller.dart';

class MyChannelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyChannelController());
  }
}
