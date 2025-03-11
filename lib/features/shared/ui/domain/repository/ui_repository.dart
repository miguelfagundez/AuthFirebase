import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_example/core/errors/failure.dart';

abstract class UiRepository {
  // Logout user -> Return to login screen
  Future<Either<Failure, bool>> logoutUser();
}
