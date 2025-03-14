import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_firebase_example/features/shared/ui/presentation/widgets/button_long.dart';
import 'package:flutter_firebase_example/features/shared/ui/presentation/widgets/button_square_with_image.dart';
import 'package:flutter_firebase_example/features/shared/ui/presentation/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Icon(Icons.blur_on_sharp, size: 100, color: Colors.blue[800]),
              const SizedBox(height: 50),
              Text(
                'Welcome!',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(height: 25),
              CustomTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(height: 50),
              ButtonLong(text: 'Sign Up', onTap: () {}),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey[400]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  ButtonSquareWithImage(
                    imagePath: 'assets/images/google.png',
                    imageSize: 40,
                    myOnTap: () {
                      debugPrint('Google');
                    },
                  ),
                  const SizedBox(width: 25),
                  ButtonSquareWithImage(
                    imagePath: 'assets/images/apple.png',
                    imageSize: 40,
                    myOnTap: () {
                      debugPrint('Apple');
                      debugPrint('User is Authenticated?: ');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('A member?', style: TextStyle(color: Colors.grey[700])),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      SchedulerBinding.instance.scheduleFrameCallback((
                        timeStamp,
                      ) {
                        Navigator.pushReplacementNamed(context, 'login');
                      });
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
