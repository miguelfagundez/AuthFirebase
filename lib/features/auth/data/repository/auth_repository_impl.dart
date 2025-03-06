import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_example/core/errors/failure.dart';
import 'package:flutter_firebase_example/features/auth/data/datasources/firebase_datasource.dart';
import 'package:flutter_firebase_example/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_firebase_example/features/user/domain/entities/my_user.dart';

class AuthRepositoryImpl implements AuthRepository {
  // --------------------------------
  // Need to be implemented
  // --------------------------------
  final AuthFirebaseDataSourceImpl authFirebaseDataSourceImpl;

  AuthRepositoryImpl({required this.authFirebaseDataSourceImpl});

  @override
  Future<Either<Failure, MyUser>> authenticateUserWithEmail(
    String email,
    String password,
  ) async {
    try {
      final MyUser user = await authFirebaseDataSourceImpl
          .authenticateUserWithEmail(email, password);
      return Right(user);
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString(), code: '400'));
    }
  }

  @override
  Future<Either<Failure, bool>> forgotPassword(String email) async {
    try {
      final bool result = await authFirebaseDataSourceImpl.forgotPassword(
        email,
      );
      return Right(result);
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString(), code: '400'));
    }
  }

  @override
  Future<Either<Failure, MyUser>> registerUser(
    String name,
    String email,
    String password,
    DateTime time,
  ) async {
    try {
      final MyUser result = await authFirebaseDataSourceImpl.registerUser(
        name,
        email,
        password,
        time,
      );
      return Right(result);
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString(), code: '400'));
    }
  }
}
