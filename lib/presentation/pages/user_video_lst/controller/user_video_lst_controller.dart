import 'package:get/get.dart';

import '../../../../app/util/loader.dart';
import '../../../../app/util/toast_message.dart';
import '../../../../data/models/video_list_user.dart';
import '../../../../data/repositories/content_creator_repository.dart';

enum buttonEnum { live, category, newest }

class UserVideoLstScreenController extends GetxController {
  VideoListUserModel videoListUserModel = VideoListUserModel();
  deleteVideo(String id) async {
    LoadingDialog.show();
    try {
      final result = await ContentCreatorRepositoryIml().deleteVideo(id);
      // videoListUserModel = VideoListUserModel.fromJson(result);
      if (result["status"]) {
        ToastMessage().toastMessae(result["message"]);
        ;
        getVideoList();
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

  getVideoList() async {
    LoadingDialog.show();
    try {
      final result = await ContentCreatorRepositoryIml().videoLst();
      if (result["status"]) {
        ToastMessage().toastMessae(result["message"]);
        ;
        videoListUserModel = VideoListUserModel.fromJson(result);
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
    getVideoList();
    super.onInit();
  }
}
