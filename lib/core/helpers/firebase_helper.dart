import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_new_design/features/authentication/data/models/response/user_model.dart';

abstract class FirebaseHelper {
  static CollectionReference<UserModel> getUserCollection() {
    CollectionReference<UserModel> userCollection = FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );

    return userCollection;
  }
}
