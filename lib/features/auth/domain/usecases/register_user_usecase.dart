import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_example/core/errors/failure.dart';
import 'package:flutter_firebase_example/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_firebase_example/features/user/domain/entities/my_user.dart';

class RegisterUserUsecase {
  final AuthRepository authRepository;

  RegisterUserUsecase({required this.authRepository});

  Future<Either<Failure, MyUser>> call(
    String name,
    String email,
    String password,
    DateTime time,
  ) async {
    return await authRepository.registerUser(name, email, password, time);
  }
}
