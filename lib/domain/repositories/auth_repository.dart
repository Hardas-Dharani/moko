import '../entities/auth_model.dart';

abstract class AuthenticationRepository {
  Future<AuthModal> signIn(String username, String password);
}
