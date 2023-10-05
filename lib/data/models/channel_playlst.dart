class ChannelPlayListModel {
  bool? status;
  String? message;
  ChannelPlayListModelData? data;

  ChannelPlayListModel({this.status, this.message, this.data});

  ChannelPlayListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new ChannelPlayListModelData.fromJson(json['data'])
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

class ChannelPlayListModelData {
  List<ChannelsPlaylist>? channelsPlaylist;
  List<Playlist>? channels;
  List<Playlist>? playlist;

  ChannelPlayListModelData(
      {this.channelsPlaylist, this.channels, this.playlist});

  ChannelPlayListModelData.fromJson(Map<String, dynamic> json) {
    if (json['channels_playlist'] != null) {
      channelsPlaylist = <ChannelsPlaylist>[];
      json['channels_playlist'].forEach((v) {
        channelsPlaylist!.add(new ChannelsPlaylist.fromJson(v));
      });
    }
    if (json['channels'] != null) {
      channels = <Playlist>[];
      json['channels'].forEach((v) {
        channels!.add(new Playlist.fromJson(v));
      });
    }
    if (json['playlist'] != null) {
      playlist = <Playlist>[];
      json['playlist'].forEach((v) {
        playlist!.add(new Playlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.channelsPlaylist != null) {
      data['channels_playlist'] =
          this.channelsPlaylist!.map((v) => v.toJson()).toList();
    }
    if (this.channels != null) {
      data['channels'] = this.channels!.map((v) => v.toJson()).toList();
    }
    if (this.playlist != null) {
      data['playlist'] = this.playlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChannelsPlaylist {
  int? id;
  String? channelName;
  List<Playlist>? playlist;

  ChannelsPlaylist({this.id, this.channelName, this.playlist});

  ChannelsPlaylist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channelName = json['channel_name'];
    if (json['playlist'] != null) {
      playlist = <Playlist>[];
      json['playlist'].forEach((v) {
        playlist!.add(new Playlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['channel_name'] = this.channelName;
    if (this.playlist != null) {
      data['playlist'] = this.playlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Playlist {
  int? id;
  String? playlistName;

  Playlist({this.id, this.playlistName});

  Playlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playlistName = json['playlist_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['playlist_name'] = this.playlistName;
    return data;
  }
}
