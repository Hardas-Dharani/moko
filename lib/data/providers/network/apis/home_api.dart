import 'package:get/get.dart';
import 'package:moko/app/services/local_storage.dart';

import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

class HomeApi implements APIRequestRepresentable {
  final HomeType type;
  final String? channelId;
  final String? slug;
  HomeApi.CreaterListMenu()
      : this._(
          type: HomeType.getCategory,
        );
  HomeApi.getChannelID(String channelId, String slug)
      : this._(type: HomeType.getChannelId, channelId: channelId, slug: slug);
  HomeApi.getDashBoard()
      : this._(
          type: HomeType.getDashBoard,
        );
  HomeApi.getMovieDetail(String search)
      : this._(type: HomeType.getMovieDetail, slug: search);
  HomeApi.getSearch(String search)
      : this._(type: HomeType.getSearch, slug: search);
  HomeApi._({required this.type, this.channelId, this.slug});

  @override
  get body => {};

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
      case HomeType.getSearch:
        return HTTPMethod.post;
      default:
        return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (type) {
      case HomeType.getCategory:
        return APIEndpoint.middleWareUrl + APIEndpoint.creater_list_menu;
      case HomeType.getDashBoard:
        return APIEndpoint.middleWareUrl + APIEndpoint.home;
      case HomeType.getChannelId:
        return APIEndpoint.middleWareUrl + APIEndpoint.creators;
      case HomeType.getSearch:
        return APIEndpoint.middleWareUrl + APIEndpoint.search;
      case HomeType.getMovieDetail:
        return APIEndpoint.middleWareUrl + APIEndpoint.channel_detail;
      case HomeType.logout:
        return "/login";
      default:
        return "";
    }
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, dynamic>? get urlParams {
    switch (type) {
      case HomeType.getChannelId:
        return {"genre_id": channelId, 'slug': slug};
      case HomeType.getSearch:
        return {"keyword": slug};
      case HomeType.getMovieDetail:
        return {"channel_id": slug};

      default:
        return {};
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }
}

enum HomeType {
  getCategory,
  getDashBoard,
  getSearch,
  getMovieDetail,
  getChannelId,
  logout
}
