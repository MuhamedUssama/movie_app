import 'package:json_annotation/json_annotation.dart';

import 'movies_model.dart';

part 'data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  @JsonKey(name: 'movie_count')
  int? movieCount;
  int? limit;
  @JsonKey(name: 'page_number')
  int? pageNumber;
  List<Movies>? movies;

  Data({this.movieCount, this.limit, this.pageNumber, this.movies});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
