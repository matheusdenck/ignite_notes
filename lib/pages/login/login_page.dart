import 'package:flutter/material.dart';
import 'package:notes/shared/auth/auth_controller.dart';

class LoginPage extends StatefulWidget {
  final AuthController authController;
  const LoginPage({
    Key? key,
    required this.authController,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Login'),
          onPressed: () {
            widget.authController.loginUser('Matheus');
          },
        ),
      ),
    );
  }
}
