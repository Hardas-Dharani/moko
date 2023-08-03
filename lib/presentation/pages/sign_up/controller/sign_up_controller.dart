import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../domain/entities/auth_model.dart';

class SignupController extends GetxController {
  TextEditingController emailTxt = TextEditingController();
  TextEditingController passTxt = TextEditingController();
  final passwordVisible = true.obs;
  final formKey = GlobalKey<FormState>();
  AuthModal authModal = AuthModal();
  login() async {
    try {
      authModal = await AuthenticationRepositoryIml()
          .signIn(emailTxt.text, passTxt.text);

      update();
    } catch (e) {
      rethrow;
    }
  }
}
