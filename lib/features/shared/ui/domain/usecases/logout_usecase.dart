import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_example/core/errors/failure.dart';
import 'package:flutter_firebase_example/features/shared/ui/domain/repository/ui_repository.dart';

class LogoutUserUsecase {
  final UiRepository uiRepository;

  LogoutUserUsecase({required this.uiRepository});

  Future<Either<Failure, bool>> call() async {
    return await uiRepository.logoutUser();
  }
}
