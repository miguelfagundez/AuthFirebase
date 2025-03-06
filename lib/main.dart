import 'package:flutter/material.dart';
import 'package:flutter_firebase_example/config/di/di.dart';
import 'package:flutter_firebase_example/config/routes/routes.dart';
import 'package:flutter_firebase_example/core/theme/app_theme.dart';
import 'package:flutter_firebase_example/core/utils/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Bloc dependencies
  await initBlocServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.lightThemeMode,
      routerConfig: router,
    );
  }
}
