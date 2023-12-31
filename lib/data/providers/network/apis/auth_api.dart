import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

class AuthAPI implements APIRequestRepresentable {
  final AuthType type;
  String? username;
  String? password;
  String? phone;
  String? email;
  String? userType;

  AuthAPI.login(String username, String password)
      : this._(type: AuthType.login, password: password, username: username);
  AuthAPI.signUp(
      String username, String password, String email, String userType)
      : this._(
            type: AuthType.signUp,
            password: password,
            username: username,
            email: email,
            userType: userType);
  AuthAPI.updateProfile(String username, String email, String phone)
      : this._(
            type: AuthType.updateProfile,
            phone: phone,
            username: username,
            email: email);

  AuthAPI._(
      {required this.type,
      this.password,
      this.username,
      this.userType,
      this.phone,
      this.email});

  @override
  get body {
    switch (type) {
      case AuthType.login:
        return {'email': username, 'password': password};
      case AuthType.signUp:
        return {
          'email': email,
          'password': password,
          'name': username,
          'user_type': userType
        };
      case AuthType.updateProfile:
        return {
          'email': email,
          'password': phone,
          'name': username,
        };
      default:
        return "";
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String> get headers => {};

  @override
  HTTPMethod get method {
    return HTTPMethod.post;
  }

  @override
  String get path {
    switch (type) {
      case AuthType.login:
        return APIEndpoint.middleWareUrl + APIEndpoint.loginUrl;
      case AuthType.updateProfile:
        return APIEndpoint.middleWareUrl + APIEndpoint.updateProfile;
      case AuthType.logout:
        return "/login";
      case AuthType.signUp:
        return APIEndpoint.middleWareUrl + APIEndpoint.signupUrl;

      default:
        return "";
    }
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, dynamic>? get urlParams => {};

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }
}

enum AuthType { login, logout, signUp, updateProfile }
