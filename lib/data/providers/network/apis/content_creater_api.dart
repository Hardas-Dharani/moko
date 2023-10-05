import 'package:get/get.dart';
import 'package:moko/app/services/local_storage.dart';

import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

class ContentCreatorApi implements APIRequestRepresentable {
  final ContentCreatorType type;
  final String? channelId;
  final String? slug;
  final Map<String, dynamic>? jsonParse;
  ContentCreatorApi.channel_playlst()
      : this._(type: ContentCreatorType.channel_playlist);
  ContentCreatorApi.deleteVideo(String slug)
      : this._(type: ContentCreatorType.deleteVideo, slug: slug);

  ContentCreatorApi.updateVideo(Map<String, dynamic> jsonParse, String slug)
      : this._(
            type: ContentCreatorType.updateVideo,
            jsonParse: jsonParse,
            slug: slug);
  ContentCreatorApi.uploadVideo(Map<String, dynamic> jsonParse)
      : this._(type: ContentCreatorType.uploadVideo, jsonParse: jsonParse);
  ContentCreatorApi.videoDetail(String slug)
      : this._(type: ContentCreatorType.videoDetail, slug: slug);
  ContentCreatorApi.videoLst()
      : this._(
          type: ContentCreatorType.videoLst,
        );
  ContentCreatorApi._(
      {required this.type, this.jsonParse, this.channelId, this.slug});

  @override
  get body {
    switch (type) {
      case ContentCreatorType.uploadVideo:
        return jsonParse;
      case ContentCreatorType.updateVideo:
        return jsonParse;
      default:
        return {};
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String> get headers {
    //  ;
    switch (type) {
      default:
        return {
          'Authorization':
              'Bearer ${Get.find<LocalStorageService>().loginUser!.accessToken}'
        };
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case ContentCreatorType.uploadVideo:
        return HTTPMethod.memberFormMethod;
      case ContentCreatorType.updateVideo:
        return HTTPMethod.memberFormMethod;
      case ContentCreatorType.videoLst:
        return HTTPMethod.get;
      case ContentCreatorType.videoDetail:
        return HTTPMethod.get;
      case ContentCreatorType.channel_playlist:
        return HTTPMethod.get;
      case ContentCreatorType.deleteVideo:
        return HTTPMethod.delete;
      default:
        return HTTPMethod.post;
    }
  }

  @override
  String get path {
    switch (type) {
      case ContentCreatorType.uploadVideo:
        return APIEndpoint.middleWareUrl + APIEndpoint.uploadVideo;
      case ContentCreatorType.updateVideo:
        return APIEndpoint.middleWareUrl + APIEndpoint.updateVideo + slug!;
      case ContentCreatorType.deleteVideo:
        return APIEndpoint.middleWareUrl + APIEndpoint.deleteVideo + slug!;
      case ContentCreatorType.videoDetail:
        return APIEndpoint.middleWareUrl + APIEndpoint.videoDetail + slug!;
      case ContentCreatorType.videoLst:
        return APIEndpoint.middleWareUrl + APIEndpoint.videoLst;
      case ContentCreatorType.channel_playlist:
        return APIEndpoint.middleWareUrl + APIEndpoint.channel_play_list;

      default:
        return "";
    }
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, dynamic>? get urlParams {
    switch (type) {
      default:
        return {};
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }
}

enum ContentCreatorType {
  uploadVideo,
  updateVideo,
  deleteVideo,
  videoDetail,
  videoLst,
  channel_playlist
}
