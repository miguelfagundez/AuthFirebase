import 'package:flutter_firebase_example/config/routes/route_names.dart';
import 'package:flutter_firebase_example/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_firebase_example/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_firebase_example/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: RouteNames.splash,
      path: "/",
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      name: RouteNames.login,
      path: "/login",
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      name: RouteNames.register,
      path: "/register",
      builder: (context, state) => RegisterPage(),
    ),
  ],
);
