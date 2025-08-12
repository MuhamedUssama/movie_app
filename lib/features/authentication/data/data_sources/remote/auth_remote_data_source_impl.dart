import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/helpers/firebase_helper.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/authentication/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:movie_app_new_design/features/authentication/data/models/request/login_request_model.dart';
import 'package:movie_app_new_design/features/authentication/data/models/request/register_request_model.dart';
import 'package:movie_app_new_design/features/authentication/data/models/response/user_model.dart';
import 'package:movie_app_new_design/features/authentication/domain/entities/user_entity.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Either<ServerException, UserEntity>> login({
    required LoginRequestModel requestModel,
  }) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: requestModel.email,
            password: requestModel.password,
          );

      if (credential.user == null) {
        return left(const ServerException("User creation failed"));
      }

      if (!credential.user!.emailVerified) {
        await verifyAccount();
        return left(
          ServerException(
            "Please verify your email before signing in, Verification email sent to ${FirebaseAuth.instance.currentUser!.email}",
          ),
        );
      }

      CollectionReference<UserModel> usersCollection =
          FirebaseHelper.getUserCollection();

      DocumentSnapshot<UserModel> documentSnapShot =
          await usersCollection.doc(credential.user!.uid).get();

      UserModel userModel = documentSnapShot.data()!;
      UserEntity userEntity = userModel.toEntity();

      return right(userEntity);
    } on FirebaseAuthException catch (error) {
      return left(ServerException(error.message));
    }
  }

  @override
  Future<Either<ServerException, UserEntity>> register({
    required RegisterRequestModel requestModel,
  }) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: requestModel.email,
            password: requestModel.password,
          );

      if (userCredential.user == null) {
        return left(const ServerException('User creation failed'));
      }

      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        name: requestModel.name,
        email: requestModel.email,
        phoneNumber: requestModel.phoneNumber,
        imageId: requestModel.imageId,
      );

      CollectionReference usersCollection = FirebaseHelper.getUserCollection();

      await usersCollection.doc(userModel.id).set(userModel);

      return right(userModel.toEntity());
    } on FirebaseAuthException catch (authError) {
      return left(ServerException(authError.message ?? 'An error occurred'));
    } catch (exception) {
      return left(const ServerException('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<ServerException, String>> forgetPassword({
    required String email,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right("Password reset email sent to $email");
    } on FirebaseAuthException catch (error) {
      return left(
        ServerException(error.message ?? "Failed to send reset email"),
      );
    }
  }

  @override
  Future<Either<ServerException, UserEntity>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return left(const ServerException("Google sign-in aborted"));
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      if (userCredential.user == null) {
        return left(const ServerException("Google authentication failed"));
      }

      final UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        email: userCredential.user!.email ?? '',
        name: userCredential.user!.displayName ?? 'Google User',
        phoneNumber: userCredential.user!.phoneNumber ?? '',
      );

      await FirebaseHelper.getUserCollection().doc(userModel.id).set(userModel);

      return right(userModel.toEntity());
    } on FirebaseAuthException catch (error) {
      return left(
        ServerException(error.message ?? "Google authentication error"),
      );
    } catch (error) {
      return left(ServerException(error.toString()));
    }
  }

  @override
  Future<Either<ServerException, String>> verifyAccount() async {
    try {
      if (!FirebaseAuth.instance.currentUser!.emailVerified) {
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        return right(
          "Verification email sent to ${FirebaseAuth.instance.currentUser!.email}",
        );
      } else {
        return left(const ServerException("Email already verified"));
      }
    } on FirebaseAuthException catch (error) {
      return left(ServerException(error.message));
    }
  }

  @override
  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
  }
}
