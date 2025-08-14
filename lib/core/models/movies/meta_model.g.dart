// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  serverTime: (json['server_time'] as num?)?.toInt(),
  serverTimezone: json['server_timezone'] as String?,
  apiVersion: (json['api_version'] as num?)?.toInt(),
  executionTime: json['execution_time'] as String?,
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'server_time': instance.serverTime,
  'server_timezone': instance.serverTimezone,
  'api_version': instance.apiVersion,
  'execution_time': instance.executionTime,
};
