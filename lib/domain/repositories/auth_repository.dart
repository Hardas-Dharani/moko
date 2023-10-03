import '../../data/models/login_model.dart';

abstract class AuthenticationRepository {
  Future<LoginModel> signIn(String username, String password);
  Future<Map<String, dynamic>> signUp(
      String username, String password, String email, String userType);
  Future<Map<String, dynamic>> updateProfile(
      String username, String email, String phoneNumber);
}
