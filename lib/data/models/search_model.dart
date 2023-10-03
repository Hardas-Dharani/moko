class Result {
  int? id;
  String? title;
  String? image;
  String? type;
  int? channelId;
  int? playlistId;

  Result(
      {this.id,
      this.title,
      this.image,
      this.type,
      this.channelId,
      this.playlistId});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    type = json['type'];
    channelId = json['channel_id'];
    playlistId = json['playlist_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['type'] = this.type;
    data['channel_id'] = this.channelId;
    data['playlist_id'] = this.playlistId;
    return data;
  }
}

class SeachModel {
  bool? status;
  String? message;
  SearchData? data;

  SeachModel({this.status, this.message, this.data});

  SeachModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new SearchData.fromJson(json['data']) : null;
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

class SearchData {
  String? keyword;
  List<Result>? result;
  // List<String>? actors;
  // List<String>? directors;

  SearchData({
    this.keyword,
    this.result,
  });

  SearchData.fromJson(Map<String, dynamic> json) {
    keyword = json['keyword'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    // if (json['actors'] != null) {
    //   actors = <String>[];
    //   json['actors'].forEach((v) {
    //     actors!.add(new String.fromJson(v));
    //   });
    // }
    // if (json['directors'] != null) {
    //   directors = <String>[];
    //   json['directors'].forEach((v) {
    //     directors!.add(new String.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyword'] = this.keyword;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    // if (this.actors != null) {
    //   data['actors'] = this.actors!.map((v) => v.toJson()).toList();
    // }
    // if (this.directors != null) {
    //   data['directors'] = this.directors!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
