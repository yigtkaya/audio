import 'package:audio/core/network/failure.dart';
import 'package:audio/features/auth/domain/user_model.dart';
import 'package:audio/features/home/data/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
final class UserRepositoryImpl implements UserRepository {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, UserModel>> fetchCurrentUser() async {
    try {
      final response = await _db
          .collection("users")
          .doc(_auth.currentUser?.uid)
          .withConverter<UserModel>(
            fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
            toFirestore: (userModel, _) => userModel.toJson(),
          )
          .get();

      return Right(response.data()!);
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
