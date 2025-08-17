import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/cast_model.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/torrent_model.dart';

part 'movie_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie {
  final int id;
  final String url;
  @JsonKey(name: 'imdb_code')
  final String imdbCode;
  final String title;
  @JsonKey(name: 'title_english')
  final String titleEnglish;
  @JsonKey(name: 'title_long')
  final String titleLong;
  final String slug;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  @JsonKey(name: 'like_count')
  final int likeCount;
  @JsonKey(name: 'description_intro')
  final String descriptionIntro;
  @JsonKey(name: 'description_full')
  final String descriptionFull;
  @JsonKey(name: 'yt_trailer_code')
  final String ytTrailerCode;
  final String language;
  @JsonKey(name: 'mpa_rating')
  final String mpaRating;
  @JsonKey(name: 'background_image')
  final String backgroundImage;
  @JsonKey(name: 'background_image_original')
  final String backgroundImageOriginal;
  @JsonKey(name: 'small_cover_image')
  final String smallCoverImage;
  @JsonKey(name: 'medium_cover_image')
  final String mediumCoverImage;
  @JsonKey(name: 'large_cover_image')
  final String largeCoverImage;
  @JsonKey(name: 'medium_screenshot_image1')
  final String mediumScreenshotImage1;
  @JsonKey(name: 'medium_screenshot_image2')
  final String mediumScreenshotImage2;
  @JsonKey(name: 'medium_screenshot_image3')
  final String mediumScreenshotImage3;
  @JsonKey(name: 'large_screenshot_image1')
  final String largeScreenshotImage1;
  @JsonKey(name: 'large_screenshot_image2')
  final String largeScreenshotImage2;
  @JsonKey(name: 'large_screenshot_image3')
  final String largeScreenshotImage3;
  final List<Cast> cast;
  final List<Torrent> torrents;
  @JsonKey(name: 'date_uploaded')
  final String dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  final int dateUploadedUnix;

  Movie({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.descriptionIntro,
    required this.descriptionFull,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.mediumScreenshotImage1,
    required this.mediumScreenshotImage2,
    required this.mediumScreenshotImage3,
    required this.largeScreenshotImage1,
    required this.largeScreenshotImage2,
    required this.largeScreenshotImage3,
    required this.cast,
    required this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
