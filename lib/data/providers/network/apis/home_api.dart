import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

class HomeApi implements APIRequestRepresentable {
  final HomeType type;
  HomeApi.CreaterListMenu()
      : this._(
          type: HomeType.getCategory,
        );
  HomeApi.getDashBoard()
      : this._(
          type: HomeType.getDashBoard,
        );

  HomeApi._({
    required this.type,
  });

  @override
  get body => {};

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String> get headers => {};

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  String get path {
    switch (type) {
      case HomeType.getCategory:
        return APIEndpoint.middleWareUrl + APIEndpoint.creater_list_menu;
      case HomeType.getDashBoard:
        return APIEndpoint.middleWareUrl + APIEndpoint.home;
      case HomeType.logout:
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

enum HomeType { getCategory, getDashBoard, logout }
