import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_example/core/errors/failure.dart';

abstract class UiFirebaseDataSource {
  Future<bool> logoutUser();
}

class UiFirebaseDataSourceImpl implements UiFirebaseDataSource {
  final FirebaseAuth _firebaseAuth;

  UiFirebaseDataSourceImpl({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<bool> logoutUser() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (error) {
      if (kDebugMode) {
        debugPrint('UiFirebaseDataSourceImpl - try/catch block');
        debugPrint(error.toString());
      }
      throw (FirebaseFailure(message: error.toString(), code: '400'));
    }
  }
}
