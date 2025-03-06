import 'package:flutter_firebase_example/features/user/domain/entities/my_user.dart';

abstract class FirebaseDataSource {
  Future<MyUser> authenticateUserWithEmail(String email, String password);
  Future<MyUser?> registerUser(
    String name,
    String email,
    String password,
    DateTime time,
  );
  Future<bool> forgotPassword(String email);
}

class AuthFirebaseDataSourceImpl implements FirebaseDataSource {
  @override
  Future<MyUser> authenticateUserWithEmail(String email, String password) {
    // TODO: implement authenticateUserWithEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<MyUser> registerUser(
    String name,
    String email,
    String password,
    DateTime time,
  ) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
