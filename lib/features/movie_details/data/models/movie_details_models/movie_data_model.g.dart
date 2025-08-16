// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieData _$MovieDataFromJson(Map<String, dynamic> json) =>
    MovieData(movie: Movie.fromJson(json['movie'] as Map<String, dynamic>));

Map<String, dynamic> _$MovieDataToJson(MovieData instance) => <String, dynamic>{
  'movie': instance.movie.toJson(),
};
