class ChannelAllVideos {
  int? id;
  String? videoAccess;
  int? episodeSeriesId;
  int? episodeSeasonId;
  String? videoTitle;
  int? releaseDate;
  String? duration;
  String? videoDescription;
  String? videoSlug;
  String? videoImage;
  String? videoType;
  int? videoQuality;
  String? videoUrl;
  String? videoUrl480;
  String? videoUrl720;
  String? videoUrl1080;
  int? downloadEnable;
  String? downloadUrl;
  int? subtitleOnOff;
  String? subtitleLanguage1;
  String? subtitleUrl1;
  String? subtitleLanguage2;
  String? subtitleUrl2;
  String? subtitleLanguage3;
  String? subtitleUrl3;
  String? imdbId;
  String? imdbRating;
  String? imdbVotes;
  String? seoTitle;
  String? seoDescription;
  String? seoKeyword;
  int? views;
  int? status;
  int? createdBy;
  String? createdAt;
  String? updatedAt;

  ChannelAllVideos(
      {this.id,
      this.videoAccess,
      this.episodeSeriesId,
      this.episodeSeasonId,
      this.videoTitle,
      this.releaseDate,
      this.duration,
      this.videoDescription,
      this.videoSlug,
      this.videoImage,
      this.videoType,
      this.videoQuality,
      this.videoUrl,
      this.videoUrl480,
      this.videoUrl720,
      this.videoUrl1080,
      this.downloadEnable,
      this.downloadUrl,
      this.subtitleOnOff,
      this.subtitleLanguage1,
      this.subtitleUrl1,
      this.subtitleLanguage2,
      this.subtitleUrl2,
      this.subtitleLanguage3,
      this.subtitleUrl3,
      this.imdbId,
      this.imdbRating,
      this.imdbVotes,
      this.seoTitle,
      this.seoDescription,
      this.seoKeyword,
      this.views,
      this.status,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  ChannelAllVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoAccess = json['video_access'];
    episodeSeriesId = json['episode_series_id'];
    episodeSeasonId = json['episode_season_id'];
    videoTitle = json['video_title'];
    releaseDate = json['release_date'];
    duration = json['duration'];
    videoDescription = json['video_description'];
    videoSlug = json['video_slug'];
    videoImage = json['video_image'];
    videoType = json['video_type'];
    videoQuality = json['video_quality'];
    videoUrl = json['video_url'];
    videoUrl480 = json['video_url_480'];
    videoUrl720 = json['video_url_720'];
    videoUrl1080 = json['video_url_1080'];
    downloadEnable = json['download_enable'];
    downloadUrl = json['download_url'];
    subtitleOnOff = json['subtitle_on_off'];
    subtitleLanguage1 = json['subtitle_language1'];
    subtitleUrl1 = json['subtitle_url1'];
    subtitleLanguage2 = json['subtitle_language2'];
    subtitleUrl2 = json['subtitle_url2'];
    subtitleLanguage3 = json['subtitle_language3'];
    subtitleUrl3 = json['subtitle_url3'];
    imdbId = json['imdb_id'];
    imdbRating = json['imdb_rating'];
    imdbVotes = json['imdb_votes'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeyword = json['seo_keyword'];
    views = json['views'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video_access'] = this.videoAccess;
    data['episode_series_id'] = this.episodeSeriesId;
    data['episode_season_id'] = this.episodeSeasonId;
    data['video_title'] = this.videoTitle;
    data['release_date'] = this.releaseDate;
    data['duration'] = this.duration;
    data['video_description'] = this.videoDescription;
    data['video_slug'] = this.videoSlug;
    data['video_image'] = this.videoImage;
    data['video_type'] = this.videoType;
    data['video_quality'] = this.videoQuality;
    data['video_url'] = this.videoUrl;
    data['video_url_480'] = this.videoUrl480;
    data['video_url_720'] = this.videoUrl720;
    data['video_url_1080'] = this.videoUrl1080;
    data['download_enable'] = this.downloadEnable;
    data['download_url'] = this.downloadUrl;
    data['subtitle_on_off'] = this.subtitleOnOff;
    data['subtitle_language1'] = this.subtitleLanguage1;
    data['subtitle_url1'] = this.subtitleUrl1;
    data['subtitle_language2'] = this.subtitleLanguage2;
    data['subtitle_url2'] = this.subtitleUrl2;
    data['subtitle_language3'] = this.subtitleLanguage3;
    data['subtitle_url3'] = this.subtitleUrl3;
    data['imdb_id'] = this.imdbId;
    data['imdb_rating'] = this.imdbRating;
    data['imdb_votes'] = this.imdbVotes;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keyword'] = this.seoKeyword;
    data['views'] = this.views;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ChannelDetail {
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
  String? imdbId;
  String? imdbRating;
  String? imdbVotes;
  String? seoTitle;
  String? seoDescription;
  String? seoKeyword;
  String? contentRating;
  int? status;
  int? termAgreed;
  int? createdBy;
  String? testPoster;
  List<Genres>? actors;
  List<Genres>? directors;
  Language? language;
  List<Genres>? genres;
  int? totalPlaylist;
  int? totalVideos;

  ChannelDetail(
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
      this.testPoster,
      this.actors,
      this.directors,
      this.language,
      this.genres,
      this.totalPlaylist,
      this.totalVideos});

  ChannelDetail.fromJson(Map<String, dynamic> json) {
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
    testPoster = json['test_poster'];
    // if (json['actors'] != null) {
    //   actors = <Null>[];
    //   json['actors'].forEach((v) {
    //     actors!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['directors'] != null) {
    //   directors = <Null>[];
    //   json['directors'].forEach((v) {
    //     directors!.add(new Null.fromJson(v));
    //   });
    // }
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    totalPlaylist = json['total_playlist'];
    totalVideos = json['total_videos'];
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
    data['test_poster'] = this.testPoster;
    // if (this.actors != null) {
    //   data['actors'] = this.actors!.map((v) => v.toJson()).toList();
    // }
    // if (this.directors != null) {
    //   data['directors'] = this.directors!.map((v) => v.toJson()).toList();
    // }
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    data['total_playlist'] = this.totalPlaylist;
    data['total_videos'] = this.totalVideos;
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

class MovieDetailData {
  ChannelDetail? channelDetail;
  List<ChannelAllVideos>? channelAllVideos;
  // List<ChannelPlaylists>? channelPlaylists;

  MovieDetailData({
    this.channelDetail,
    this.channelAllVideos,
  });

  MovieDetailData.fromJson(Map<String, dynamic> json) {
    channelDetail =
        json['channel_detail'] != null && json['channel_detail'].isNotEmpty
            ? new ChannelDetail.fromJson(json['channel_detail'])
            : null;
    if (json['channel_all_videos'] != null &&
        json['channel_all_videos'].isNotEmpty) {
      channelAllVideos = <ChannelAllVideos>[];
      json['channel_all_videos'].forEach((v) {
        channelAllVideos!.add(new ChannelAllVideos.fromJson(v));
      });
    }
    // if (json['channel_playlists'] != null) {
    //   channelPlaylists = <ChannelPlaylists>[];
    //   json['channel_playlists'].forEach((v) {
    //     channelPlaylists!.add(new ChannelPlaylists.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.channelDetail != null) {
      data['channel_detail'] = this.channelDetail!.toJson();
    }
    if (this.channelAllVideos != null) {
      data['channel_all_videos'] =
          this.channelAllVideos!.map((v) => v.toJson()).toList();
    }
    // if (this.channelPlaylists != null) {
    //   data['channel_playlists'] =
    //       this.channelPlaylists!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class MovieDetailModel {
  bool? status;
  String? message;
  MovieDetailData? data;

  MovieDetailModel({this.status, this.message, this.data});

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new MovieDetailData.fromJson(json['data'])
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

// class ChannelPlaylists {
//   int? id;
//   int? seriesId;
//   String? seasonName;
//   String? seasonSlug;
//   String? seasonPoster;
//   Null? trailerUrl;
//   String? seoTitle;
//   String? seoDescription;
//   String? seoKeyword;
//   int? status;
//   int? createdBy;
//   List<Videos>? videos;

//   ChannelPlaylists(
//       {this.id,
//       this.seriesId,
//       this.seasonName,
//       this.seasonSlug,
//       this.seasonPoster,
//       this.trailerUrl,
//       this.seoTitle,
//       this.seoDescription,
//       this.seoKeyword,
//       this.status,
//       this.createdBy,
//       this.videos});

//   ChannelPlaylists.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     seriesId = json['series_id'];
//     seasonName = json['season_name'];
//     seasonSlug = json['season_slug'];
//     seasonPoster = json['season_poster'];
//     trailerUrl = json['trailer_url'];
//     seoTitle = json['seo_title'];
//     seoDescription = json['seo_description'];
//     seoKeyword = json['seo_keyword'];
//     status = json['status'];
//     createdBy = json['created_by'];
//     if (json['videos'] != null) {
//       videos = <Videos>[];
//       json['videos'].forEach((v) {
//         videos!.add(new Videos.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['series_id'] = this.seriesId;
//     data['season_name'] = this.seasonName;
//     data['season_slug'] = this.seasonSlug;
//     data['season_poster'] = this.seasonPoster;
//     data['trailer_url'] = this.trailerUrl;
//     data['seo_title'] = this.seoTitle;
//     data['seo_description'] = this.seoDescription;
//     data['seo_keyword'] = this.seoKeyword;
//     data['status'] = this.status;
//     data['created_by'] = this.createdBy;
//     if (this.videos != null) {
//       data['videos'] = this.videos!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
