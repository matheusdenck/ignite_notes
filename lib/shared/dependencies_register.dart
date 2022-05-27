import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/shared/auth/auth_controller.dart';
import 'package:notes/shared/auth/auth_repository_impl.dart';

import 'auth/auth_repository.dart';

class DependenciesRegister {
  void registerDependencies() {
    GetIt.I.registerSingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>(),
    );
    GetIt.I.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(),
    );
    GetIt.I.registerSingleton<AuthController>(
      AuthController(
        navigator: GetIt.I.get<GlobalKey<NavigatorState>>(),
        repository: GetIt.I.get<AuthRepository>(),
      ),
    );
  }
}
