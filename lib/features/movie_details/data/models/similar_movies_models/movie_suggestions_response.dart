import 'package:json_annotation/json_annotation.dart';
import 'data.dart';
import 'meta.dart';

part 'movie_suggestions_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieSuggestionsResponse {
  final String? status;
  @JsonKey(name: 'status_message')
  final String? statusMessage;
  final Data? data;
  final Meta? meta;

  MovieSuggestionsResponse({
    this.status,
    this.statusMessage,
    this.data,
    this.meta,
  });

  factory MovieSuggestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieSuggestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieSuggestionsResponseToJson(this);
}
