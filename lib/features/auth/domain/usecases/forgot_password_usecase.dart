import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_example/core/errors/failure.dart';
import 'package:flutter_firebase_example/features/auth/domain/repository/auth_repository.dart';

class ForgotPasswordUsecase {
  final AuthRepository authRepository;

  ForgotPasswordUsecase({required this.authRepository});

  Future<Either<Failure, bool>> call(String email) async {
    return await authRepository.forgotPassword(email);
  }
}
