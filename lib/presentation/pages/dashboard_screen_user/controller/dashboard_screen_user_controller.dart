import 'package:get/get.dart';

import '../../../../app/util/loader.dart';
import '../../../../app/util/toast_message.dart';
import '../../../../data/models/my_channel_model.dart';
import '../../../../data/repositories/content_creator_repository.dart';

enum buttonEnum { live, category, newest }

class DashBoardScreenUserController extends GetxController {
  MyChannelModel myChannelModel = MyChannelModel();

  myChannel() async {
    try {
      final result = await ContentCreatorRepositoryIml().myChannel();
      // videoListUserModel = VideoListUserModel.fromJson(result);
      if (result["status"]) {
        ToastMessage().toastMessae(result["message"]);
        myChannelModel = MyChannelModel.fromJson(result);
      } else {
        ToastMessage().toastMessae(result["message"]);
        ;
      }

      update();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    myChannel();
    super.onInit();
  }

  updateProfile() async {
    LoadingDialog.show();
    try {
      // await AuthenticationRepositoryIml()
      //     .updateProfile(usrTxt.text, emailTxt.text, phnTxt.text);
      LoadingDialog.hide();
      update();
    } catch (e) {
      LoadingDialog.hide();
      rethrow;
    }
  }
}
