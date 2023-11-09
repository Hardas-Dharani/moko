import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:moko/app/services/local_storage.dart';
import 'package:moko/data/models/my_channel_model.dart';

import '../../../../app/util/loader.dart';
import '../../../../app/util/toast_message.dart';
import '../../../../data/models/creater_menu_model.dart';
import '../../../../data/repositories/content_creator_repository.dart';
import '../../../../data/repositories/home_repository.dart';
import '../../../../domain/entities/auth_model.dart';
import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

enum buttonEnum { live, category, newest }

class MyChannelController extends GetxController {
  TextEditingController actortxt = TextEditingController();
  TextEditingController usrTxt = TextEditingController();
  TextEditingController channelInfo = TextEditingController();
  TextEditingController drictortxt = TextEditingController();
  final passwordVisible = true.obs;
  final formKey = GlobalKey<FormState>();
  AuthModal authModal = AuthModal();
  BottomNavigationItem _currentItem = BottomNavigationItem.Home;
  List<String> actorValues = [];
  TextEditingController thumbnailTxt = TextEditingController();
  List<String> directorsValues = [];
  List<String> languageValues = [];
  List<String> genresValues = [];
  var seletectButton = buttonEnum.live;
  final TextEditingController textEditingController = TextEditingController();
  bool focusTagEnabled = false;

  File? imageThumbil;
  DateTime now = DateTime.now();
  int indexSelected = 0;

  bool hasNewNotification = false;
  String fireStoreId = '';
  MyChannelModel myChannelModel = MyChannelModel();
  CreaterListMenuModel createrListMenuModel = CreaterListMenuModel();
  List<Creators> selectedcreators = [];
  List<Creators> creators = [];
  BottomNavigationItem get currentItem => _currentItem;
  categoryMenu() async {
    try {
      final result = await HomeRepositoryIml().getCategory();

      if (result["status"]) {
        ToastMessage().toastMessae(result["message"]);
        createrListMenuModel = CreaterListMenuModel.fromJson(result);
      } else {
        // ToastMessage().toastMessae(result["message"]);;
      }
      update();
    } catch (e) {
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

  myChannel() async {
    LoadingDialog.show();
    selectedcreators = [];
    try {
      final result = await ContentCreatorRepositoryIml().myChannel();
      // videoListUserModel = VideoListUserModel.fromJson(result);
      if (result["status"]) {
        ToastMessage().toastMessae(result["message"]);
        myChannelModel = MyChannelModel.fromJson(result);
        usrTxt.text = myChannelModel.data!.myChannel!.seriesName ?? "";
        actortxt.text =
            myChannelModel.data!.myChannel!.actors!.first.actorName ?? "";
        drictortxt.text =
            myChannelModel.data!.myChannel!.directors!.first.directorName ?? "";
        myChannelModel.data!.myChannel!.actors!.forEach((element) {
          actorValues.add(element.actorName!);
          myChannelModel.data!.myChannel!.genres!.forEach((e) =>
              selectedcreators.add(Creators(
                  id: e.id, genreName: e.genreName, genreSlug: e.genreSlug)));
          print(selectedcreators);
        });
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

  onActorDeleted(index) {
    actorValues.removeAt(index);
    update();
  }

  onDirectorsDeleted(index) {
    directorsValues.removeAt(index);
    update();
  }

  onGenersDeleted(index) {
    directorsValues.removeAt(index);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit

    if (Get.find<LocalStorageService>().loginUser != null) {
      usrTxt.text =
          Get.find<LocalStorageService>().loginUser!.data!.user!.name!;
      drictortxt.text =
          Get.find<LocalStorageService>().loginUser!.data!.user!.email!;
      drictortxt.text =
          Get.find<LocalStorageService>().loginUser!.data!.user!.phone ?? "";
    }
    myChannel();
    categoryMenu();
    super.onInit();
  }

  onLanguageDeleted(index) {
    languageValues.removeAt(index);
    update();
  }

  updateChannel() async {
    LoadingDialog.show();
    try {
      final result = await ContentCreatorRepositoryIml().updateChannel({
        "channel_name": usrTxt.text,
        "channel_info": channelInfo.text,
        "language": "",
        "genres": creators.map((item) => item.id.toString()).join(','),
        "actors": actortxt.text, "directors": drictortxt.text,
        "poster": imageThumbil
        // "series_id": selectedChannel.id.toString(),
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
