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
import '../../../../data/repositories/content_creator_repository.dart';
import '../../../../domain/entities/auth_model.dart';
import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

class AddPlayListController extends GetxController {
  TextEditingController emailTxt = TextEditingController();
  TextEditingController usrTxt = TextEditingController();
  TextEditingController playistTxt = TextEditingController();
  TextEditingController videoTxt = TextEditingController();
  TextEditingController thumbnailTxt = TextEditingController();
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
  Playlist selectedPlaylist = Playlist();
  int indexSelected = 0;

  bool hasNewNotification = false;
  String fireStoreId = '';
  ChannelPlayListModel channelPlayListModel = ChannelPlayListModel();
  MyChannelModel myChannelModel = MyChannelModel();
  BottomNavigationItem get currentItem => _currentItem;

  categoryMenu() async {
    LoadingDialog.show();
    try {
      final result = await ContentCreatorRepositoryIml().channelPlayList();
      if (result["status"]) {
        ToastMessage().toastMessae(result["message"]);
        ;
        channelPlayListModel = ChannelPlayListModel.fromJson(result);
        selectedChannel = channelPlayListModel.data!.channelsPlaylist!.first;
        selectedPlaylist = channelPlayListModel.data!.playlist!.first;
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

  Future getVideo() async {
    final res = await ImagesPicker.pick(
        pickType: PickType.video, maxTime: 230, count: 1);
    final s = res!.first.thumbPath;
    video = File(res.first.path);
    String filePath = res.first.path;
    List<String> pathSegments = filePath.split(Platform.pathSeparator);
    videoTxt.text = pathSegments.last;
// Media
// .path
// .thumbPath (path for video thumb)
// .size (kb)
  }

  myChannel() async {
    LoadingDialog.show();

    try {
      final result = await ContentCreatorRepositoryIml().myChannel();
      // videoListUserModel = VideoListUserModel.fromJson(result);
      if (result["status"]) {
        ToastMessage().toastMessae(result["message"]);
        myChannelModel = MyChannelModel.fromJson(result);
        if (myChannelModel.data!.myChannel!.seriesName == null) {
          Get.toNamed(Routes.myChannel);
        }
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
    categoryMenu();
    myChannel();
    super.onInit();
  }

  uploadplaylist() async {
    LoadingDialog.show();
    try {
      final result = await ContentCreatorRepositoryIml().addPlayList({
        "playlist_name": usrTxt.text,
        "poster": imageThumbil,
        "series_id": myChannelModel.data!.myChannel!.id.toString(),
      });
      if (result["status"]) {
        ToastMessage().toastMessae(result["message"]);
        Get.back();
        ;
      } else {
        ToastMessage().toastMessae(result["message"]);
        ;
      }
      // createrListMenuModel = CreaterListMenuModel.fromJson(s);
      LoadingDialog.hide();
      update();
    } catch (e) {
      LoadingDialog.hide();
      rethrow;
    }
  }
}

enum buttonEnum { live, category, newest }
