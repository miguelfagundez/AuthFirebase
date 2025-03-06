import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_example/config/routes/route_names.dart';
import 'package:flutter_firebase_example/core/utils/app_image_url.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.goNamed(RouteNames.login);
      Timer(
        const Duration(seconds: 3),
        () => context.goNamed(RouteNames.login),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImageUrl.logo, width: 150, height: 150),
      ),
    );
  }
}
