import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moko/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/util.dart';

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var scaffoldKey1 = GlobalKey<ScaffoldState>();
  // User? get user {
  //   final rawJson = _sharedPreferences?.getString(_Key.user.toString());
  //   if (rawJson == null) {
  //     return null;
  //   }
  //   Map<String, dynamic> map = jsonDecode(rawJson);
  //   return User.fromJson(map);
  // }

  // set user(User? value) {
  //   if (value != null) {
  //     _sharedPreferences?.setString(
  //         _Key.user.toString(), json.encode(value.toJson()));
  //   } else {
  //     _sharedPreferences?.remove(_Key.user.toString());
  //   }
  // }

  LoginModel? get loginUser {
    final rawJson = _sharedPreferences?.getString(_Key.user.toString());
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return LoginModel.fromJson(map);
  }

  set loginUser(LoginModel? value) {
    if (value != null) {
      _sharedPreferences?.setString(
          _Key.user.toString(), json.encode(value.toJson()));
    } else {
      _sharedPreferences?.remove(_Key.user.toString());
    }
  }

  List<MovieModelDemo>? get movieModels {
    final rawJsonList =
        _sharedPreferences?.getStringList(_Key.movieModel.toString());
    if (rawJsonList == null) {
      return null;
    }

    return rawJsonList
        .map((rawJson) => MovieModelDemo.fromJson(jsonDecode(rawJson)))
        .toList();
  }

  set movieModels(List<MovieModelDemo>? values) {
    if (values != null) {
      final rawJsonList =
          values.map((value) => json.encode(value.toJson())).toList();
      _sharedPreferences?.setStringList(
          _Key.movieModel.toString(), rawJsonList);
    } else {
      _sharedPreferences?.remove(_Key.movieModel.toString());
    }
  }

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

  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

enum _Key { user, token, movieModel }
