class CreaterListMenuData {
  List<Creators>? creators;

  CreaterListMenuData({this.creators});

  CreaterListMenuData.fromJson(Map<String, dynamic> json) {
    if (json['creators'] != null) {
      creators = <Creators>[];
      json['creators'].forEach((v) {
        creators!.add(new Creators.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.creators != null) {
      data['creators'] = this.creators!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CreaterListMenuModel {
  bool? status;
  String? message;
  CreaterListMenuData? data;

  CreaterListMenuModel({this.status, this.message, this.data});

  CreaterListMenuModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new CreaterListMenuData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Creators {
  int? id;
  String? genreName;
  String? genreSlug;

  Creators({this.id, this.genreName, this.genreSlug});

  Creators.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    genreName = json['genre_name'];
    genreSlug = json['genre_slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['genre_name'] = this.genreName;
    data['genre_slug'] = this.genreSlug;
    return data;
  }
}
