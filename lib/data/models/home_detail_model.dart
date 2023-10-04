class HomeDetailData {
  List<Slider>? slider;
  List<SliderByGenres>? sliderByGenres;

  HomeDetailData({this.slider, this.sliderByGenres});

  HomeDetailData.fromJson(Map<String, dynamic> json) {
    // if (json['slider'] != null) {
    //   slider = <Slider>[];
    //   json['slider'].forEach((v) {
    //     slider!.add(new Slider.fromJson(v));
    //   });
    // }
    if (json['slider_by_genres'] != null) {
      sliderByGenres = <SliderByGenres>[];
      json['slider_by_genres'].forEach((v) {
        sliderByGenres!.add(new SliderByGenres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slider != null) {
      data['slider'] = this.slider!.map((v) => v.toJson()).toList();
    }
    if (this.sliderByGenres != null) {
      data['slider_by_genres'] =
          this.sliderByGenres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeDetailModel {
  bool? status;
  String? message;
  HomeDetailData? data;

  HomeDetailModel({this.status, this.message, this.data});

  HomeDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? new HomeDetailData.fromJson(json['data']) : null;
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

// class Slider {
//   String? sliderTitle;
//   String? sliderImage;
//   String? sliderType;
//   String? sliderDisplayOn;

//   Slider(
//       {this.sliderTitle,
//       this.sliderImage,
//       this.sliderType,
//       this.sliderDisplayOn});

//   Slider.fromJson(Map<String, dynamic> json) {
//     sliderTitle = json['slider_title'];
//     sliderImage = json['slider_image'];
//     sliderType = json['slider_type'];
//     sliderDisplayOn = json['slider_display_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['slider_title'] = this.sliderTitle;
//     data['slider_image'] = this.sliderImage;
//     data['slider_type'] = this.sliderType;
//     data['slider_display_on'] = this.sliderDisplayOn;
//     return data;
//   }
// }
class Slider {
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

  Slider(
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
      this.contentRating});

  Slider.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class SliderByGenres {
  int? id;
  String? genreName;
  String? genreSlug;
  int? status;
  List<Slider>? slider;

  SliderByGenres(
      {this.id, this.genreName, this.genreSlug, this.status, this.slider});

  SliderByGenres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    genreName = json['genre_name'];
    genreSlug = json['genre_slug'];
    status = json['status'];
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
        slider!.add(new Slider.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['genre_name'] = this.genreName;
    data['genre_slug'] = this.genreSlug;
    data['status'] = this.status;
    if (this.slider != null) {
      data['slider'] = this.slider!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
