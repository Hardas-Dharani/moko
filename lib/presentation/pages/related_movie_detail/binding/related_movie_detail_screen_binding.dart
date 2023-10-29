import 'package:get/get.dart';

import '../controller/related_movie_detail_screen_controller.dart';

class ReleatedMovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReleatedMovieDetailController());
  }
}
