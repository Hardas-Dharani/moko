import 'dart:convert';

import 'package:moko/data/providers/network/apis/content_creater_api.dart';

import '../../domain/repositories/content_creator_repository.dart';

class ContentCreatorRepositoryIml extends ContentCreatorRepository {
  @override
  Future<Map<String, dynamic>> channelPlayList() async {
    try {
      final response = await ContentCreatorApi.channel_playlst().request();

      final result = json.decode(response);
      // Map<result, dynamic> authModal = LoginModel.fromJson(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> deleteVideo(String slug) async {
    try {
      final response = await ContentCreatorApi.deleteVideo(slug).request();

      final result = json.decode(response);
      // Map<result, dynamic> authModal = LoginModel.fromJson(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateVideos(
      Map<String, dynamic> jsonParser, String slug) async {
    try {
      final response =
          await ContentCreatorApi.updateVideo(jsonParser, slug).request();

      final result = json.decode(response);
      // Map<result, dynamic> authModal = LoginModel.fromJson(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<LoginModel> (String username, String password) async {
  //   try {
  //     final response = await AuthAPI.login(username, password).request();

  //     final result = json.decode(response);
  //     LoginModel authModal = LoginModel.fromJson(result);
  //     return authModal;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<Map<String, dynamic>> uploadVideos(
      Map<String, dynamic> jsonParser) async {
    try {
      final response =
          await ContentCreatorApi.uploadVideo(jsonParser).request();

      final result = json.decode(response);
      // Map<result, dynamic> authModal = LoginModel.fromJson(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> videoDetail(String slug) async {
    try {
      final response = await ContentCreatorApi.videoDetail(slug).request();

      final result = json.decode(response);
      // Map<result, dynamic> authModal = LoginModel.fromJson(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> videoLst() async {
    try {
      final response = await ContentCreatorApi.videoLst().request();

      final result = json.decode(response);
      // Map<result, dynamic> authModal = LoginModel.fromJson(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
