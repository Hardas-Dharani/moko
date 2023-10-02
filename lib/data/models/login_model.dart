class Dashboard {
  int? totalLanguages;
  int? totalGenres;
  int? totalChannels;
  int? totalPlaylists;
  int? totalVideos;
  int? totalVideoViews;

  Dashboard(
      {this.totalLanguages,
      this.totalGenres,
      this.totalChannels,
      this.totalPlaylists,
      this.totalVideos,
      this.totalVideoViews});

  Dashboard.fromJson(Map<String, dynamic> json) {
    totalLanguages = json['total_languages'];
    totalGenres = json['total_genres'];
    totalChannels = json['total_channels'];
    totalPlaylists = json['total_playlists'];
    totalVideos = json['total_videos'];
    totalVideoViews = json['total_video_views'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_languages'] = this.totalLanguages;
    data['total_genres'] = this.totalGenres;
    data['total_channels'] = this.totalChannels;
    data['total_playlists'] = this.totalPlaylists;
    data['total_videos'] = this.totalVideos;
    data['total_video_views'] = this.totalVideoViews;
    return data;
  }
}

class Data {
  User? user;
  Dashboard? dashboard;

  Data({this.user, this.dashboard});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    dashboard = json['dashboard'] != null
        ? new Dashboard.fromJson(json['dashboard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.dashboard != null) {
      data['dashboard'] = this.dashboard!.toJson();
    }
    return data;
  }
}

class LoginModel {
  bool? status;
  String? message;
  Data? data;
  String? accessToken;

  LoginModel({this.status, this.message, this.data, this.accessToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['access_token'] = this.accessToken;
    return data;
  }
}

class User {
  int? userId;
  String? userType;
  String? name;
  String? email;
  String? phone;
  String? userImage;

  User(
      {this.userId,
      this.userType,
      this.name,
      this.email,
      this.phone,
      this.userImage});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userType = json['user_type'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['user_image'] = this.userImage;
    return data;
  }
}
