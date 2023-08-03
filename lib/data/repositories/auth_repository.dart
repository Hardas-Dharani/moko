import 'dart:convert';

import '../../domain/entities/auth_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../providers/network/apis/auth_api.dart';

class AuthenticationRepositoryIml extends AuthenticationRepository {
  @override
  Future<AuthModal> signIn(String username, String password) async {
    try {
      final response = await AuthAPI.login(username, password).request();

      final result = json.decode(response);
      AuthModal authModal = AuthModal.fromJson(result);
      return authModal;
    } catch (e) {
      rethrow;
    }
  }
}
