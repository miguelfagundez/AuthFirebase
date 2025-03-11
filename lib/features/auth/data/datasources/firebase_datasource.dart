import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_example/core/errors/failure.dart';
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
  final FirebaseAuth _firebaseAuth;

  AuthFirebaseDataSourceImpl({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<MyUser> registerUser(
    String name,
    String email,
    String password,
    DateTime time,
  ) async {
    try {
      debugPrint(email);
      debugPrint(password);
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint(credentials.user?.uid);

      if (credentials.user?.uid != null) {
        final MyUser user = MyUser(
          id: credentials.user?.uid.toString() ?? '',
          name: email,
          email: email,
          password: password,
          createAt: DateTime.now(),
        );
        return user;
      } else {
        throw (FirebaseFailure(
          message: 'User cannot be created!',
          code: '400',
        ));
      }
    } catch (error) {
      if (kDebugMode) {
        debugPrint(error.toString());
      }
      throw (FirebaseFailure(message: error.toString(), code: '400'));
    }
  }

  @override
  Future<MyUser> authenticateUserWithEmail(
    String email,
    String password,
  ) async {
    try {
      debugPrint(email);
      debugPrint(password);
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint(credentials.user?.uid);

      if (credentials.user?.uid != null) {
        final MyUser user = MyUser(
          id: credentials.user?.uid.toString() ?? '',
          name: email,
          email: email,
          password: password,
          createAt: DateTime.now(),
        );
        return user;
      } else {
        debugPrint('User cannot be authenticated!');
        throw (FirebaseFailure(
          message: 'User cannot be authenticated!',
          code: '400',
        ));
      }
    } catch (error) {
      if (kDebugMode) {
        debugPrint(error.toString());
      }
      throw (FirebaseFailure(message: error.toString(), code: '400'));
    }
  }

  @override
  Future<bool> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }
}
