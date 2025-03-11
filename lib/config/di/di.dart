import 'package:flutter_firebase_example/config/di/services/di_auth.dart';
import 'package:flutter_firebase_example/config/di/services/ui_services.dart';

Future<void> initBlocServices() async {
  // Define all services
  await authServices();
  await uiServices();
}
