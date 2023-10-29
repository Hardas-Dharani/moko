import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moko/app/services/local_storage.dart';
import 'package:moko/data/models/my_channel_model.dart';

import '../../../../app/util/loader.dart';
import '../../../../app/util/toast_message.dart';
import '../../../../data/repositories/content_creator_repository.dart';
import '../../../../domain/entities/auth_model.dart';
import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

enum buttonEnum { live, category, newest }

class MyChannelController extends GetxController {
  TextEditingController emailTxt = TextEditingController();
  TextEditingController usrTxt = TextEditingController();
  TextEditingController phnTxt = TextEditingController();
  final passwordVisible = true.obs;
  final formKey = GlobalKey<FormState>();
  AuthModal authModal = AuthModal();
  BottomNavigationItem _currentItem = BottomNavigationItem.Home;
  List<String> values = [];
  var seletectButton = buttonEnum.live;
  final TextEditingController textEditingController = TextEditingController();
  bool focusTagEnabled = false;

  onDeleted(index) {
    values.removeAt(index);
    update();
  }

  DateTime now = DateTime.now();
  int indexSelected = 0;
  bool hasNewNotification = false;
  String fireStoreId = '';
  MyChannelModel myChannelModel = MyChannelModel();
  BottomNavigationItem get currentItem => _currentItem;

  void changeCurrentItem(BottomNavigationItem item) {
    _currentItem = item;
    update();
  }

  myChannel() async {
    LoadingDialog.show();
    try {
      final result = await ContentCreatorRepositoryIml().myChannel();
      // videoListUserModel = VideoListUserModel.fromJson(result);
      if (result["status"]) {
        ToastMessage().toastMessae(result["message"]);
        myChannelModel = MyChannelModel.fromJson(result);
        usrTxt.text = myChannelModel.data!.myChannel!.seriesName ?? "";
      } else {
        ToastMessage().toastMessae(result["message"]);
        ;
      }

      LoadingDialog.hide();
      update();
    } catch (e) {
      LoadingDialog.hide();
      rethrow;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit

    if (Get.find<LocalStorageService>().loginUser != null) {
      usrTxt.text =
          Get.find<LocalStorageService>().loginUser!.data!.user!.name!;
      emailTxt.text =
          Get.find<LocalStorageService>().loginUser!.data!.user!.email!;
      phnTxt.text =
          Get.find<LocalStorageService>().loginUser!.data!.user!.phone ?? "";
    }
    myChannel();
    super.onInit();
  }
}
