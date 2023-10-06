import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';

import '../../../../app/util/loader.dart';
import '../../../../data/models/channel_playlst.dart';
import '../../../../data/repositories/content_creator_repository.dart';
import '../../../../domain/entities/auth_model.dart';
import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

enum buttonEnum { live, category, newest }

class UpdateVideoController extends GetxController {
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
  BottomNavigationItem get currentItem => _currentItem;
  categoryMenu() async {
    LoadingDialog.show();
    try {
      final result = await ContentCreatorRepositoryIml().channelPlayList();
      if (result["status"]) {
        Get.snackbar('Message', result["message"]);
        channelPlayListModel = ChannelPlayListModel.fromJson(result);
        selectedChannel = channelPlayListModel.data!.channelsPlaylist!.first;
        selectedPlaylist = channelPlayListModel.data!.playlist!.first;
      } else {
        Get.snackbar('Message', result["message"]);
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

  @override
  void onInit() {
    // TODO: implement onInit
    categoryMenu();
    super.onInit();
  }

  uploadVideo() async {
    LoadingDialog.show();
    try {
      final result = await ContentCreatorRepositoryIml().updateVideos({
        "video_title": usrTxt.text,
        "video_thumbnail": imageThumbil,
        "channel_id": selectedChannel.id.toString(),
        "video_file": video,
        "playlist_id": selectedPlaylist.id.toString()
      }, Get.arguments);
      if (result["status"]) {
        Get.snackbar('Message', result["message"]);
      } else {
        Get.snackbar('Message', result["message"]);
      }

      // createrListMenuModel = CreaterListMenuModel.fromJson(s);
      LoadingDialog.hide();
      update();
    } catch (e) {
      Get.find();
      LoadingDialog.hide();
      rethrow;
    }
  }
}
