import 'package:movie_app_new_design/core/utils/app_assets.dart';

class AvatarsModel {
  final String id;
  final String imagePath;

  const AvatarsModel({required this.id, required this.imagePath});

  static List<AvatarsModel> get avatars => [
    const AvatarsModel(id: '1', imagePath: AppAvatars.avatar1),
    const AvatarsModel(id: '2', imagePath: AppAvatars.avatar2),
    const AvatarsModel(id: '3', imagePath: AppAvatars.avatar3),
    const AvatarsModel(id: '4', imagePath: AppAvatars.avatar4),
    const AvatarsModel(id: '5', imagePath: AppAvatars.avatar5),
    const AvatarsModel(id: '6', imagePath: AppAvatars.avatar6),
    const AvatarsModel(id: '7', imagePath: AppAvatars.avatar7),
    const AvatarsModel(id: '8', imagePath: AppAvatars.avatar8),
    const AvatarsModel(id: '9', imagePath: AppAvatars.avatar9),
  ];
}
