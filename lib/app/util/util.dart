class Utils {
  static Map<String, dynamic> exceptionWidget(bool error, {String? message}) {
    if (error) {
      return {'sucess': error, 'message': "successfully"};
    } else {
      return {'sucess': error, 'message': message!};
    }
  }

  static String getGifImagePath(String name, {String format = 'gif'}) {
    return 'assets/gif/$name.$format';
  }

  static String getImageIconPath(String name, {String format = 'png'}) {
    return 'assets/icons/$name.$format';
  }

  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String getJsonFilePath(String name, {String format = 'json'}) {
    return 'assets/json/$name.$format';
  }

  static String getSvgFilePath(String name, {String format = 'svg'}) {
    return 'assets/svg/$name.$format';
  }
}
