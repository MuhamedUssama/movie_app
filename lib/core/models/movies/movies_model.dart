import 'package:json_annotation/json_annotation.dart';

import 'torrents_model.dart';

part 'movies_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Movies {
  int? id;
  String? url;
  @JsonKey(name: 'imdb_code')
  String? imdbCode;
  String? title;
  @JsonKey(name: 'title_english')
  String? titleEnglish;
  @JsonKey(name: 'title_long')
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  String? summary;
  @JsonKey(name: 'description_full')
  String? descriptionFull;
  String? synopsis;
  @JsonKey(name: 'yt_trailer_code')
  String? ytTrailerCode;
  String? language;
  @JsonKey(name: 'mpa_rating')
  String? mpaRating;
  @JsonKey(name: 'background_image')
  String? backgroundImage;
  @JsonKey(name: 'background_image_original')
  String? backgroundImageOriginal;
  @JsonKey(name: 'small_cover_image')
  String? smallCoverImage;
  @JsonKey(name: 'medium_cover_image')
  String? mediumCoverImage;
  @JsonKey(name: 'large_cover_image')
  String? largeCoverImage;
  String? state;
  List<Torrents>? torrents;
  @JsonKey(name: 'date_uploaded')
  String? dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  int? dateUploadedUnix;

  Movies({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}
