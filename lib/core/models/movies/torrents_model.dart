import 'package:json_annotation/json_annotation.dart';

part 'torrents_model.g.dart';

@JsonSerializable()
class Torrents {
  String? url;
  String? hash;
  String? quality;
  String? type;
  @JsonKey(name: 'is_repack')
  String? isRepack;
  @JsonKey(name: 'video_codec')
  String? videoCodec;
  @JsonKey(name: 'bit_depth')
  String? bitDepth;
  @JsonKey(name: 'audio_channels')
  String? audioChannels;
  int? seeds;
  int? peers;
  String? size;
  @JsonKey(name: 'size_bytes')
  int? sizeBytes;
  @JsonKey(name: 'date_uploaded')
  String? dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  int? dateUploadedUnix;

  Torrents({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.isRepack,
    this.videoCodec,
    this.bitDepth,
    this.audioChannels,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Torrents.fromJson(Map<String, dynamic> json) =>
      _$TorrentsFromJson(json);
  Map<String, dynamic> toJson() => _$TorrentsToJson(this);
}
