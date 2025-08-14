import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable()
class Meta {
  @JsonKey(name: 'server_time')
  int? serverTime;
  @JsonKey(name: 'server_timezone')
  String? serverTimezone;
  @JsonKey(name: 'api_version')
  int? apiVersion;
  @JsonKey(name: 'execution_time')
  String? executionTime;

  Meta({
    this.serverTime,
    this.serverTimezone,
    this.apiVersion,
    this.executionTime,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
