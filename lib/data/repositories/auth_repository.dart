import 'dart:convert';

import '../../domain/repositories/auth_repository.dart';
import '../providers/network/apis/auth_api.dart';

class AuthenticationRepositoryIml extends AuthenticationRepository {
  @override
  Future<Map<String, dynamic>> signIn(String username, String password) async {
    try {
      final response = await AuthAPI.login(username, password).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> signUp(
      String username, String password, String email, String userType) async {
    try {
      final response =
          await AuthAPI.signUp(username, password, email, userType).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateProfile(
      String username, String email, String phoneNumber) async {
    try {
      final response =
          await AuthAPI.updateProfile(username, email, phoneNumber).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
