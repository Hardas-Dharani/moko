class Actors {
  int? id;
  String? actorName;
  String? actorSlug;
  String? actorImage;

  Actors({this.id, this.actorName, this.actorSlug, this.actorImage});

  Actors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    actorName = json['actor_name'];
    actorSlug = json['actor_slug'];
    actorImage = json['actor_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['actor_name'] = this.actorName;
    data['actor_slug'] = this.actorSlug;
    data['actor_image'] = this.actorImage;
    return data;
  }
}

class Directors {
  int? id;
  String? directorName;
  String? directorSlug;
  String? directorImage;

  Directors(
      {this.id, this.directorName, this.directorSlug, this.directorImage});

  Directors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    directorName = json['director_name'];
    directorSlug = json['director_slug'];
    directorImage = json['director_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['director_name'] = this.directorName;
    data['director_slug'] = this.directorSlug;
    data['director_image'] = this.directorImage;
    return data;
  }
}

class Genres {
  int? id;
  String? genreName;
  String? genreSlug;

  Genres({this.id, this.genreName, this.genreSlug});

  Genres.fromJson(Map<String, dynamic> json) {
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

class Language {
  int? id;
  String? languageName;
  String? languageSlug;

  Language({this.id, this.languageName, this.languageSlug});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageName = json['language_name'];
    languageSlug = json['language_slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['language_name'] = this.languageName;
    data['language_slug'] = this.languageSlug;
    return data;
  }
}

class MyChannel {
  int? id;
  int? seriesLangId;
  String? seriesGenres;
  int? upcoming;
  String? seriesAccess;
  String? seriesName;
  String? seriesSlug;
  String? seriesInfo;
  String? actorId;
  String? directorId;
  String? seriesPoster;
  Null imdbId;
  Null imdbRating;
  Null imdbVotes;
  String? seoTitle;
  String? seoDescription;
  String? seoKeyword;
  Null contentRating;
  int? status;
  int? termAgreed;
  int? createdBy;
  List<Actors>? actors;
  List<Directors>? directors;
  Language? language;
  List<Genres>? genres;

  MyChannel(
      {this.id,
      this.seriesLangId,
      this.seriesGenres,
      this.upcoming,
      this.seriesAccess,
      this.seriesName,
      this.seriesSlug,
      this.seriesInfo,
      this.actorId,
      this.directorId,
      this.seriesPoster,
      this.imdbId,
      this.imdbRating,
      this.imdbVotes,
      this.seoTitle,
      this.seoDescription,
      this.seoKeyword,
      this.contentRating,
      this.status,
      this.termAgreed,
      this.createdBy,
      this.actors,
      this.directors,
      this.language,
      this.genres});

  MyChannel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seriesLangId = json['series_lang_id'];
    seriesGenres = json['series_genres'];
    upcoming = json['upcoming'];
    seriesAccess = json['series_access'];
    seriesName = json['series_name'];
    seriesSlug = json['series_slug'];
    seriesInfo = json['series_info'];
    actorId = json['actor_id'];
    directorId = json['director_id'];
    seriesPoster = json['series_poster'];
    imdbId = json['imdb_id'];
    imdbRating = json['imdb_rating'];
    imdbVotes = json['imdb_votes'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeyword = json['seo_keyword'];
    contentRating = json['content_rating'];
    status = json['status'];
    termAgreed = json['term_agreed'];
    createdBy = json['created_by'];
    if (json['actors'] != null) {
      actors = <Actors>[];
      json['actors'].forEach((v) {
        actors!.add(new Actors.fromJson(v));
      });
    }
    if (json['directors'] != null) {
      directors = <Directors>[];
      json['directors'].forEach((v) {
        directors!.add(new Directors.fromJson(v));
      });
    }
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['series_lang_id'] = this.seriesLangId;
    data['series_genres'] = this.seriesGenres;
    data['upcoming'] = this.upcoming;
    data['series_access'] = this.seriesAccess;
    data['series_name'] = this.seriesName;
    data['series_slug'] = this.seriesSlug;
    data['series_info'] = this.seriesInfo;
    data['actor_id'] = this.actorId;
    data['director_id'] = this.directorId;
    data['series_poster'] = this.seriesPoster;
    data['imdb_id'] = this.imdbId;
    data['imdb_rating'] = this.imdbRating;
    data['imdb_votes'] = this.imdbVotes;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keyword'] = this.seoKeyword;
    data['content_rating'] = this.contentRating;
    data['status'] = this.status;
    data['term_agreed'] = this.termAgreed;
    data['created_by'] = this.createdBy;
    if (this.actors != null) {
      data['actors'] = this.actors!.map((v) => v.toJson()).toList();
    }
    if (this.directors != null) {
      data['directors'] = this.directors!.map((v) => v.toJson()).toList();
    }
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyChannelData {
  MyChannel? myChannel;

  MyChannelData({this.myChannel});

  MyChannelData.fromJson(Map<String, dynamic> json) {
    myChannel = json['my_channel'] != null
        ? new MyChannel.fromJson(json['my_channel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myChannel != null) {
      data['my_channel'] = this.myChannel!.toJson();
    }
    return data;
  }
}

class MyChannelModel {
  bool? status;
  String? message;
  MyChannelData? data;

  MyChannelModel({this.status, this.message, this.data});

  MyChannelModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? new MyChannelData.fromJson(json['data']) : null;
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
