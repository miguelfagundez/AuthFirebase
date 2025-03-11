import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_example/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_firebase_example/features/shared/ui/presentation/bloc/ui_bloc.dart';
import 'package:get_it/get_it.dart';
import 'firebase_options.dart';
import 'package:flutter_firebase_example/config/di/di.dart';
import 'package:flutter_firebase_example/config/routes/routes.dart';
import 'package:flutter_firebase_example/core/theme/app_theme.dart';
import 'package:flutter_firebase_example/core/utils/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Init Bloc dependencies
  await initBlocServices();

  runApp(const BlocWidget());
}

class BlocWidget extends StatelessWidget {
  const BlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.instance.get<AuthBloc>()),
        BlocProvider(create: (_) => GetIt.instance.get<UiBloc>()),
      ],
      child: MyApp(),
    );
  }
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
