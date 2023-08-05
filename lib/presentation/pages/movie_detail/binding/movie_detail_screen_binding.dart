import 'package:get/get.dart';

import '../controller/movie_detail_screen_controller.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailController());
  }
}
