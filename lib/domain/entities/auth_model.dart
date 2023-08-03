class AuthModal {
  bool? error;
  String? message;
  Body? body;

  AuthModal({this.error, this.message, this.body});

  AuthModal.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    body = json['body'].isNotEmpty ? Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}

class Body {
  String? token;
  String? tokenType;

  Body({this.token, this.tokenType});

  Body.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['token_type'] = tokenType;
    return data;
  }
}
