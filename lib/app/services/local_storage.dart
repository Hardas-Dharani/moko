import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user.dart';

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var scaffoldKey1 = GlobalKey<ScaffoldState>();
  String? get token {
    final rawJson = _sharedPreferences?.getString(_Key.token.toString());
    if (rawJson == null) {
      return null;
    }
    return rawJson;
  }
set token(String? value) {
    if (value != null) {
      _sharedPreferences?.setString(_Key.token.toString(), value);
    } else {
      _sharedPreferences?.remove(_Key.token.toString());
    }
  }
  User? get user {
    final rawJson = _sharedPreferences?.getString(_Key.user.toString());
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return User.fromJson(map);
  }

  set user(User? value) {
    if (value != null) {
      _sharedPreferences?.setString(
          _Key.user.toString(), json.encode(value.toJson()));
    } else {
      _sharedPreferences?.remove(_Key.user.toString());
    }
  }

  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

enum _Key { user, token }
