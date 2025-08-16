// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_suggestions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSuggestionsResponse _$MovieSuggestionsResponseFromJson(
  Map<String, dynamic> json,
) => MovieSuggestionsResponse(
  status: json['status'] as String?,
  statusMessage: json['status_message'] as String?,
  data:
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
  meta:
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MovieSuggestionsResponseToJson(
  MovieSuggestionsResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'status_message': instance.statusMessage,
  'data': instance.data?.toJson(),
  'meta': instance.meta?.toJson(),
};
