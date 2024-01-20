import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:moko/routes/app_routes.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../app/util/loader.dart';
import '../../../../app/util/toast_message.dart';
import '../../../../data/models/channel_playlst.dart';
import '../../../../data/models/my_channel_model.dart';
import '../../../../data/models/my_playlist_model.dart';
import '../../../../data/repositories/content_creator_repository.dart';
import '../../../../domain/entities/auth_model.dart';
import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

enum buttonEnum { live, category, newest }

class MyPlayListController extends GetxController {
  TextEditingController emailTxt = TextEditingController();
  TextEditingController usrTxt = TextEditingController();
  TextEditingController playistTxt = TextEditingController();
  TextEditingController videoTxt = TextEditingController();
  TextEditingController thumbnailTxt = TextEditingController();
  //-- this btn for ads skip
  RxBool Ads_open = true.obs;
  // TextEditingController phnTxt = TextEditingController();
  final passwordVisible = true.obs;
  final formKey = GlobalKey<FormState>();
  AuthModal authModal = AuthModal();
  BottomNavigationItem _currentItem = BottomNavigationItem.Home;
  File? imageThumbil;
  File? video;
  var seletectButton = buttonEnum.live;

  DateTime now = DateTime.now();
  ChannelsPlaylist selectedChannel = ChannelsPlaylist();
  int indexSelected = 0;

  bool hasNewNotification = false;
  String fireStoreId = '';
  MyPlayListModel myPlayListModel = MyPlayListModel();
  MyChannelModel myChannelModel = MyChannelModel();
  BottomNavigationItem get currentItem => _currentItem;

  void changeCurrentItem(BottomNavigationItem item) {
    _currentItem = item;
    update();
  }

  Future getImage() async {
    var status = await Permission.manageExternalStorage.request();
    final res = await ImagesPicker.pick(
      count: 1,
      pickType: PickType.image,
    );
    imageThumbil = File(res![0].path);
    String filePath = res.first.path;
    List<String> pathSegments = filePath.split(Platform.pathSeparator);
    thumbnailTxt.text = pathSegments.last;
// Media
// .path
// .thumbPath (path for video thumb)
// .size (kb)
  }

  getMyPlaylist() async {
    LoadingDialog.show();
    try {
      final result = await ContentCreatorRepositoryIml().myPlayList();
      if (result["status"]) {
        ToastMessage().toastMessae(result["message"]);
        ;
        myPlayListModel = MyPlayListModel.fromJson(result);
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
    getMyPlaylist();
    super.onInit();
  }
}
