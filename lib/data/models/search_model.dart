class Creators {
  int? id;
  String? name;
  String? slug;

  Creators({this.id, this.name, this.slug});

  Creators.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Result {
  int? id;
  String? title;
  String? image;
  List<int>? creatorIdList;
  List<Creators>? directorIdList;
  List<Creators>? actorIdList;
  int? languageId;
  String? type;
  int? channelId;
  int? playlistId;

  Result(
      {this.id,
      this.title,
      this.image,
      this.creatorIdList,
      this.directorIdList,
      this.actorIdList,
      this.languageId,
      this.type,
      this.channelId,
      this.playlistId});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    creatorIdList = (json['creator_id_list'] as List<dynamic>?)
        ?.map<int>((dynamic item) => item as int)
        .toList();
    if (json['director_id_list'] != null) {
      directorIdList = <Creators>[];
      json['director_id_list'].forEach((v) {
        directorIdList!.add(new Creators.fromJson(v));
      });
    }
    if (json['actor_id_list'] != null) {
      actorIdList = <Creators>[];
      json['actor_id_list'].forEach((v) {
        actorIdList!.add(new Creators.fromJson(v));
      });
    }
    languageId = json['language_id'];
    type = json['type'];
    channelId = json['channel_id'];
    playlistId = json['playlist_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['creator_id_list'] = this.creatorIdList;
    if (this.directorIdList != null) {
      data['director_id_list'] =
          this.directorIdList!.map((v) => v.toJson()).toList();
    }
    if (this.actorIdList != null) {
      data['actor_id_list'] = this.actorIdList!.map((v) => v.toJson()).toList();
    }
    data['language_id'] = this.languageId;
    data['type'] = this.type;
    data['channel_id'] = this.channelId;
    data['playlist_id'] = this.playlistId;
    return data;
  }
}

class SeachData {
  String? keyword;
  List<Result>? result;
  List<Creators>? creators;
  List<Creators>? languages;
  List<Creators>? actors;
  List<Creators>? directors;

  SeachData(
      {this.keyword,
      this.result,
      this.creators,
      this.languages,
      this.actors,
      this.directors});

  SeachData.fromJson(Map<String, dynamic> json) {
    keyword = json['keyword'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    if (json['creators'] != null) {
      creators = <Creators>[];
      json['creators'].forEach((v) {
        creators!.add(new Creators.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Creators>[];
      json['languages'].forEach((v) {
        languages!.add(new Creators.fromJson(v));
      });
    }
    if (json['actors'] != null) {
      actors = <Creators>[];
      json['actors'].forEach((v) {
        actors!.add(new Creators.fromJson(v));
      });
    }
    if (json['directors'] != null) {
      directors = <Creators>[];
      json['directors'].forEach((v) {
        directors!.add(new Creators.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyword'] = this.keyword;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    if (this.creators != null) {
      data['creators'] = this.creators!.map((v) => v.toJson()).toList();
    }
    if (this.languages != null) {
      data['languages'] = this.languages!.map((v) => v.toJson()).toList();
    }
    if (this.actors != null) {
      data['actors'] = this.actors!.map((v) => v.toJson()).toList();
    }
    if (this.directors != null) {
      data['directors'] = this.directors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeachModel {
  bool? status;
  String? message;
  SeachData? data;

  SeachModel({this.status, this.message, this.data});

  SeachModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new SeachData.fromJson(json['data']) : null;
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
