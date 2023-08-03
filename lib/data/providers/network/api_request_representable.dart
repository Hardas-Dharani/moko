abstract class APIRequestRepresentable {
  dynamic get body;
  String get endpoint;
  Map<String, String> get headers;
  HTTPMethod get method;
  String get path;
  String get url;
  Map<String, dynamic>? get urlParams;
  Future request();
}

enum HTTPMethod { get, post, delete, put, patch, memberFormMethod }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return "get";
      case HTTPMethod.post:
        return "post";
      case HTTPMethod.delete:
        return "delete";
      case HTTPMethod.patch:
        return "patch";
      case HTTPMethod.put:
        return "put";
      case HTTPMethod.memberFormMethod:
        return "memberFormMethod";
    }
  }
}
