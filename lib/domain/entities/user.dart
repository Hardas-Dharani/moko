class StatsModal {
  int? id;
  String? date;
  String? subService;
  String? source;
  String? subSource;
  int? currentActive;
  int? pinSent;
  int? newUsers;
  int? newChargedUsers;
  int? newUnSubs;
  int? unSubScribes;
  StatsModal(
      {this.currentActive,
      this.date,
      this.id,
      this.newChargedUsers,
      this.newUnSubs,
      this.newUsers,
      this.pinSent,
      this.source,
      this.subService,
      this.subSource,
      this.unSubScribes});
}

class User {
  String? username;

  User({this.username});

  factory User.fromJson(Map<String, dynamic>? json) {
    return User(
      username: json?['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
      };
}
