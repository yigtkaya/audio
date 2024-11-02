import 'package:audio/core/network/failure.dart';
import 'package:audio/features/auth/domain/user_model.dart';
import 'package:either_dart/either.dart';

abstract interface class UserRepository {
  Future<Either<Failure, UserModel>> fetchCurrentUser();
}
