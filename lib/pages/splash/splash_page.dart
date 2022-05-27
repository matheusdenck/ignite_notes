import 'package:flutter/material.dart';
import 'package:notes/shared/auth/auth_controller.dart';

class SplashPage extends StatefulWidget {
  final AuthController authController;
  const SplashPage({
    Key? key,
    required this.authController,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> initialize() async {
    await widget.authController.init();
  }

  @override
  // ignore: avoid_void_async
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
