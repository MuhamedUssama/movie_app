import 'package:json_annotation/json_annotation.dart';

import 'data_model.dart';
import 'meta_model.dart';

part 'movie_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie {
  String? status;
  @JsonKey(name: 'status_message')
  String? statusMessage;
  Data? data;
  @JsonKey(name: '@meta')
  Meta? meta;

  Movie({this.status, this.statusMessage, this.data, this.meta});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
