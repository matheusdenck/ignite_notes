import 'package:flutter/material.dart';

import 'auth_repository.dart';

class AuthController {
  bool isLogged = false;
  dynamic user;

  final GlobalKey<NavigatorState> navigator;
  final AuthRepository repository;

  AuthController({
    required this.navigator,
    required this.repository,
  });

  Future<void> init() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    final dynamic user = await repository.getUser();
    if (user != null) {
      await loginUser(user);
    } else {
      await logoutUser();
    }
  }

  Future<void> loginUser(String user) async {
    this.user = user;
    isLogged = true;
    await repository.saveUser(user);
    await navigator.currentState!.pushReplacementNamed('/home');
  }

  Future<void> logoutUser() async {
    user = null;
    isLogged = false;
    await repository.remove();
    await navigator.currentState!.pushReplacementNamed('/login');
  }
}
