import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_example/core/errors/failure.dart';
import 'package:flutter_firebase_example/features/shared/ui/data/datasources/ui_firebase_datasource.dart';
import 'package:flutter_firebase_example/features/shared/ui/domain/repository/ui_repository.dart';

class UiRepositoryImpl implements UiRepository {
  // --------------------------------
  // Need to be implemented
  // --------------------------------
  final UiFirebaseDataSourceImpl uiDataSourceImpl;

  UiRepositoryImpl({required this.uiDataSourceImpl});

  @override
  Future<Either<Failure, bool>> logoutUser() async {
    try {
      final bool success = await uiDataSourceImpl.logoutUser();
      return Right(success);
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString(), code: '400'));
    }
  }
}
