import '../../domain/entities/paging.dart';

class PagingModel extends Paging {
  @override
  final int totalResults;

  PagingModel({
    required this.totalResults,
  }) : super(totalResults: totalResults);
  @override
  factory PagingModel.fromJson(Map<String, dynamic> json) => PagingModel(
        totalResults: json["totalResults"],
      );
}
