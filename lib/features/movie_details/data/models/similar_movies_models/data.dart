import 'package:json_annotation/json_annotation.dart';
import 'movie.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  @JsonKey(name: 'movie_count')
  final int? movieCount;
  final List<Movie>? movies;

  Data({this.movieCount, this.movies});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
