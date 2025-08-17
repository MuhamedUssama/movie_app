import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_new_design/core/models/movies/meta_model.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_data_model.dart';

part 'movie_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetails {
  final String status;
  @JsonKey(name: 'status_message')
  final String statusMessage;
  final MovieData data;
  @JsonKey(name: '@meta')
  final Meta? meta;

  MovieDetails({
    required this.status,
    required this.statusMessage,
    required this.data,
    this.meta,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}
