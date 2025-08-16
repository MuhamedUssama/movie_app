import 'package:json_annotation/json_annotation.dart';

part 'cast_model.g.dart';

@JsonSerializable()
class Cast {
  final String name;
  @JsonKey(name: 'character_name')
  final String characterName;
  @JsonKey(name: 'url_small_image')
  final String? urlSmallImage;
  @JsonKey(name: 'imdb_code')
  final String imdbCode;

  Cast({
    required this.name,
    required this.characterName,
    this.urlSmallImage,
    required this.imdbCode,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}
