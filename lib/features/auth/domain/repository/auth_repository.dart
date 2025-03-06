import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_example/core/errors/failure.dart';
import 'package:flutter_firebase_example/features/user/domain/entities/my_user.dart';

abstract class AuthRepository {
  // Register a new user using email/password
  Future<Either<Failure, MyUser>> registerUser(
    String name,
    String email,
    String password,
    DateTime time,
  );

  // Authenticate an existing user
  Future<Either<Failure, MyUser>> authenticateUserWithEmail(
    String email,
    String password,
  );

  // Change password
  Future<Either<Failure, bool>> forgotPassword(String email);
}
