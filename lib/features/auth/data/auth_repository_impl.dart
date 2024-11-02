import 'package:audio/core/network/failure.dart';
import 'package:audio/features/auth/data/auth_repository.dart';
import 'package:audio/features/auth/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithEmail({required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(
        Failure(message: e.message.toString(), code: e.code),
      );
    }
  }

  @override
  Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  @override
  Future<Either<Failure, UserCredential>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await createUserInFirestore(email: email, name: name);

      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(
        Failure(message: e.message.toString(), code: e.code),
      );
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signUpWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return Left(
          Failure(code: "1", message: ""),
        );
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return Right(await _auth.signInWithCredential(credential));
    } on FirebaseAuthException catch (e) {
      return Left(
        Failure(message: e.message.toString(), code: e.code),
      );
    }
  }

  @override
  User? currentUser() {
    return _auth.currentUser;
  }

  @override
  Future<Either<Failure, UserModel>> createUserInFirestore({required String email, required String name}) async {
    final model = UserModel(
      uid: _auth.currentUser?.uid,
      name: name,
      email: email,
    );

    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(model.uid)
          .withConverter<UserModel>(
            fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
            toFirestore: (userModel, _) => userModel.toJson(),
          )
          .set(model);

      return Right(model);
    } on FirebaseException catch (e) {
      return Left(
        Failure(
          message: e.message.toString(),
          code: e.code,
        ),
      );
    }
  }
}
