class MyPlaylist {
  int? id;
  int? seriesId;
  String? seasonName;
  String? seasonSlug;
  String? seasonPoster;
  Null trailerUrl;
  Null seoTitle;
  Null seoDescription;
  Null seoKeyword;
  int? status;
  int? createdBy;

  MyPlaylist(
      {this.id,
      this.seriesId,
      this.seasonName,
      this.seasonSlug,
      this.seasonPoster,
      this.trailerUrl,
      this.seoTitle,
      this.seoDescription,
      this.seoKeyword,
      this.status,
      this.createdBy});

  MyPlaylist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seriesId = json['series_id'];
    seasonName = json['season_name'];
    seasonSlug = json['season_slug'];
    seasonPoster = json['season_poster'];
    trailerUrl = json['trailer_url'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeyword = json['seo_keyword'];
    status = json['status'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['series_id'] = this.seriesId;
    data['season_name'] = this.seasonName;
    data['season_slug'] = this.seasonSlug;
    data['season_poster'] = this.seasonPoster;
    data['trailer_url'] = this.trailerUrl;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keyword'] = this.seoKeyword;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    return data;
  }
}

class MyPlayListModel {
  bool? status;
  String? message;
  MyPlayListModelData? data;

  MyPlayListModel({this.status, this.message, this.data});

  MyPlayListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new MyPlayListModelData.fromJson(json['data'])
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

class MyPlayListModelData {
  List<MyPlaylist>? playlist;
  String? hash;

  MyPlayListModelData({this.playlist, this.hash});

  MyPlayListModelData.fromJson(Map<String, dynamic> json) {
    if (json['playlist'] != null) {
      playlist = <MyPlaylist>[];
      json['playlist'].forEach((v) {
        playlist!.add(new MyPlaylist.fromJson(v));
      });
    }
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.playlist != null) {
      data['playlist'] = this.playlist!.map((v) => v.toJson()).toList();
    }
    data['hash'] = this.hash;
    return data;
  }
}
