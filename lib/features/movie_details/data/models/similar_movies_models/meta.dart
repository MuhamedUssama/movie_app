import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
  @JsonKey(name: 'server_time')
  final int? serverTime;
  @JsonKey(name: 'server_timezone')
  final String? serverTimezone;
  @JsonKey(name: 'api_version')
  final int? apiVersion;
  @JsonKey(name: 'execution_time')
  final String? executionTime;

  Meta({
    this.serverTime,
    this.serverTimezone,
    this.apiVersion,
    this.executionTime,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
