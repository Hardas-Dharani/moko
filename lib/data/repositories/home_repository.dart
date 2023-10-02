import 'dart:convert';

import 'package:moko/domain/repositories/home_repository.dart';

import '../providers/network/apis/home_api.dart';

class HomeRepositoryIml extends HomeRepository {
  // @override
  // Future<LoginModel> (String username, String password) async {
  //   try {
  //     final response = await AuthAPI.login(username, password).request();

  //     final result = json.decode(response);
  //     LoginModel authModal = LoginModel.fromJson(result);
  //     return authModal;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<Map<String, dynamic>> getCategory() async {
    try {
      final response = await HomeApi.CreaterListMenu().request();

      final result = json.decode(response);
      // Map<result, dynamic> authModal = LoginModel.fromJson(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getDashBoard() async {
    try {
      final response = await HomeApi.getDashBoard().request();

      final result = json.decode(response);
      // Map<result, dynamic> authModal = LoginModel.fromJson(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
