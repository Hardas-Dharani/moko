import 'package:get/get.dart';

import '../../../../app/services/local_storage.dart';
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
          // 'Authorization':
          //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI3IiwianRpIjoiMWUzYjdkOTFlNDlhZjE2ZDI3ZWFjZTA5YWVhMjc3N2RmY2FhMDM1ZDg3ODJmMWQ2NGQ5MzBiYjgzM2ZkODE1ZWNjMGE4YjBhNDcyMDIxZDMiLCJpYXQiOjE2OTY1Mzg4MTcuNDM2NDcwMDMxNzM4MjgxMjUsIm5iZiI6MTY5NjUzODgxNy40MzY0NzA5ODU0MTI1OTc2NTYyNSwiZXhwIjoxNzI4MTYxMjE3LjQzMTU3OTExMzAwNjU5MTc5Njg3NSwic3ViIjoiNCIsInNjb3BlcyI6W119.2d01lZ8Y8sN7AYuFy96X75QY2EfQfS3__mQa_aWr0eAKm3Frh-EZFDdBCqulrA-xBJl0vVNtgVj-vpCqEFnmbyPRy-zDyjK_oPKhp_iRARN_RklWThgt56Y2C713NHNpMMvpAcmXwA9Vt4I52rsK8UbPBIleph6aI9xEdqJ7HZsJnlF-0L_IGPsUjojqL59RYwI9D7fsmsziqv5C7IOqtoF8qvBVVlMJZv6ThCXGG-72sfMGaas2DvH1UHSSJ_SDdSO_UiKHJKsxoBP2Z6Fb71KgRY9api_88Vx-Atfuks4_LEcIhdlYPUaZpucr2X0dK6klHQsGshif1kFNgvdFIgCUzztOwRDNS0VvKhDC1UZLxXFWn7Qpg6vrmPeFyZsC7InE4j7Kuee4p_nKWgdj_c4fhMlnfGX8ENDEX61E-R1ZNGAwZrPv8bJ7dObL5aIX9FwX3cZGwbC_5d3cP5nUuj0YPjZUH6N6EOKAPQIYSmpQu7BI7K1RhzN3jxy3b_GRayAHNUZVtYf6WJZsekWMGm0AKvNi7qVdLxWsXJnjp8rEyDo7B3DdFPOPLBTnNxcwH8G606ZT7fQWHdeBvxsjeSI8QpOi_LKG8GO3wCupB1i85CvddtkKwFh1L9Kg3YwOhKnUG-84hplUnvcf8pVzcaiF-GQJbGv49opDmu97R-Y'
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
        return HTTPMethod.post;
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
