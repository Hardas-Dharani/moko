import 'dart:convert';

import '../../domain/repositories/auth_repository.dart';
import '../models/login_model.dart';
import '../providers/network/apis/auth_api.dart';

class AuthenticationRepositoryIml extends AuthenticationRepository {
  @override
  Future<LoginModel> signIn(String username, String password) async {
    try {
      final response = await AuthAPI.login(username, password).request();

      final result = json.decode(response);
      LoginModel authModal = LoginModel.fromJson(result);
      return authModal;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginModel> signUp(
      String username, String password, String email, String userType) async {
    try {
      final response =
          await AuthAPI.signUp(username, password, email, userType).request();

      final result = json.decode(response);
      LoginModel authModal = LoginModel.fromJson(result);
      return authModal;
    } catch (e) {
      rethrow;
    }
  }
}
