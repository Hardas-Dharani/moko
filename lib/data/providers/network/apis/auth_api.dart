import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

class AuthAPI implements APIRequestRepresentable {
  final AuthType type;
  String? username;
  String? password;

  AuthAPI.login(String username, String password)
      : this._(type: AuthType.login, password: password, username: username);

  AuthAPI._({required this.type, this.password, this.username});

  @override
  get body => {'username': username, 'password': password};

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String> get headers => {};

  @override
  HTTPMethod get method {
    return HTTPMethod.memberFormMethod;
  }

  @override
  String get path {
    switch (type) {
      case AuthType.login:
        return APIEndpoint.middleWareUrl + APIEndpoint.loginUrl;
      case AuthType.logout:
        return "/login";
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

enum AuthType { login, logout }
