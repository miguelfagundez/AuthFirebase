import 'package:flutter_firebase_example/config/di/services/di_auth.dart';

Future<void> initBlocServices() async {
  // Define all services
  await authServices();
}
