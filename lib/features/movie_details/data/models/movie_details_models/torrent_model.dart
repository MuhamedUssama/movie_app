import 'package:json_annotation/json_annotation.dart';

part 'torrent_model.g.dart';

@JsonSerializable()
class Torrent {
  final String url;
  final String hash;
  final String quality;
  final String type;
  @JsonKey(name: 'is_repack')
  final String isRepack;
  @JsonKey(name: 'video_codec')
  final String videoCodec;
  @JsonKey(name: 'bit_depth')
  final String bitDepth;
  @JsonKey(name: 'audio_channels')
  final String audioChannels;
  final int seeds;
  final int peers;
  final String size;
  @JsonKey(name: 'size_bytes')
  final int sizeBytes;
  @JsonKey(name: 'date_uploaded')
  final String dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  final int dateUploadedUnix;

  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.isRepack,
    required this.videoCodec,
    required this.bitDepth,
    required this.audioChannels,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.sizeBytes,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) =>
      _$TorrentFromJson(json);

  Map<String, dynamic> toJson() => _$TorrentToJson(this);
}
