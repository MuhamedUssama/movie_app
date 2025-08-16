import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';

part 'movie_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieData {
  final Movie movie;

  MovieData({required this.movie});

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDataToJson(this);
}
