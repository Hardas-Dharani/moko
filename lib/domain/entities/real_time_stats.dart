class RealTimeStatistics {
  bool? error;
  String? message;
  RealTimeStatisticsBody? body;

  RealTimeStatistics({this.error, this.message, this.body});

  RealTimeStatistics.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    body = json['body'] != null
        ? RealTimeStatisticsBody.fromJson(json['body'])
        : null;
  }
}

class RealTimeStatisticsBody {
  List<RealTimeStatisticsData>? data;
  RealTimeStatisticsMeta? meta;

  RealTimeStatisticsBody({this.data, this.meta});

  RealTimeStatisticsBody.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RealTimeStatisticsData>[];
      json['data'].forEach((v) {
        data!.add(RealTimeStatisticsData.fromJson(v));
      });
    }
    meta = json['meta'] != null
        ? RealTimeStatisticsMeta.fromJson(json['meta'])
        : null;
  }
}

class RealTimeStatisticsData {
  String? operator;
  int? pinSent;
  int? multiplePinSent;
  int? newUsers;
  int? instantCharged;
  int? newChangedUsers;
  int? newUnsubs;
  int? unsubscribers;
  int? currentActive;
  int? sent;
  int? delivered;
  int? failed;

  RealTimeStatisticsData(
      {this.operator,
      this.pinSent,
      this.multiplePinSent,
      this.newUsers,
      this.instantCharged,
      this.newChangedUsers,
      this.newUnsubs,
      this.unsubscribers,
      this.currentActive,
      this.sent,
      this.delivered,
      this.failed});

  RealTimeStatisticsData.fromJson(Map<String, dynamic> json) {
    operator = json['operator'];
    pinSent = json['pin_sent'];
    multiplePinSent = json['multiple_pin_sent'];
    newUsers = json['new_users'];
    instantCharged = json['instant_charged'];
    newChangedUsers = json['new_changed_users'];
    newUnsubs = json['new_unsubs'];
    unsubscribers = json['unsubscribers'];
    currentActive = json['current_active'];
    sent = json['sent'];
    delivered = json['delivered'];
    failed = json['failed'];
  }
}

class RealTimeStatisticsMeta {
  int? totalRecords;
  int? totalPages;
  int? perPage;
  int? page;

  RealTimeStatisticsMeta(
      {this.totalRecords, this.totalPages, this.perPage, this.page});

  RealTimeStatisticsMeta.fromJson(Map<String, dynamic> json) {
    totalRecords = json['total_records'];
    totalPages = json['total_pages'];
    perPage = json['per_page'];
    page = json['page'];
  }
}
