import 'package:audio/core/network/failure.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepository {
  User? currentUser();
  Future<Either<Failure, UserCredential>> signInWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserCredential>> signUpWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserCredential>> signUpWithGoogle();
  Future<void> resetPassword(String email);
  Future<void> signOut();
}
