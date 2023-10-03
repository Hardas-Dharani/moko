import 'package:get/get.dart';

import '../../../../app/util/loader.dart';
import '../../../../data/models/creater_model.dart';
import '../../../../data/repositories/home_repository.dart';
import '../../../../domain/entities/auth_model.dart';
import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

enum buttonEnum { live, category, newest }

class CreaterController extends GetxController {
  AuthModal authModal = AuthModal();
  BottomNavigationItem _currentItem = BottomNavigationItem.Home;

  var seletectButton = buttonEnum.live;
  CreaterModel homeDetailData = CreaterModel();
  int indexCreater = 0;
  DateTime now = DateTime.now();

  int indexSelected = 0;
  bool hasNewNotification = false;
  String fireStoreId = '';
  BottomNavigationItem get currentItem => _currentItem;
  void changeCurrentItem(BottomNavigationItem item) {
    _currentItem = item;
    update();
  }

  getDashBoard() async {
    LoadingDialog.show();
    try {
      print(Get.arguments["channel_id"]);
      final s = await HomeRepositoryIml().getChannelId(
          Get.arguments["channel_id"].toString(),
          Get.arguments["slug"].toString());
      homeDetailData = CreaterModel.fromJson(s);
      print(s);
      // createrListMenuModel = CreaterListMenuModel.fromJson(s);
      LoadingDialog.hide();
      update();
    } catch (e) {
      LoadingDialog.hide();
      rethrow;
    }
  }

  @override
  void onInit() {
    getDashBoard();
    // TODO: implement onInit
    super.onInit();
  }
}
