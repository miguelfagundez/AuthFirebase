import 'package:flutter/material.dart';
import 'package:flutter_firebase_example/core/utils/app_image_url.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImageUrl.logo, width: 150, height: 150),
      ),
    );
  }
}
