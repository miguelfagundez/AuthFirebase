import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_example/core/errors/failure.dart';
import 'package:flutter_firebase_example/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_firebase_example/features/user/domain/entities/my_user.dart';

class AuthenticateUserWithEmailUsecase {
  final AuthRepository authRepository;

  AuthenticateUserWithEmailUsecase({required this.authRepository});

  Future<Either<Failure, MyUser>> call(String email, String password) async {
    return await authRepository.authenticateUserWithEmail(email, password);
  }
}
