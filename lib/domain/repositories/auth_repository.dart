import '../../data/models/login_model.dart';

abstract class AuthenticationRepository {
  Future<LoginModel> signIn(String username, String password);
  Future<LoginModel> signUp(
      String username, String password, String email, String userType);
}
