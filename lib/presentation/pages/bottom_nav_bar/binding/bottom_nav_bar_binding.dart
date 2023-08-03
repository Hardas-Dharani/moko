import 'package:get/get.dart';
import 'package:moko/presentation/pages/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
  }
}
