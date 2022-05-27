import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/pages/create_edit_note/create_edit_note_page.dart';
import 'package:notes/pages/splash/splash_page.dart';
import 'package:notes/shared/dependencies_register.dart';

import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';
import '../shared/auth/auth_controller.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    DependenciesRegister().registerDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      navigatorKey: GetIt.I.get<GlobalKey<NavigatorState>>(),
      title: 'Notes',
      //a primeira rota default do flutter é a rota '/', para modificar isso tem a propriedade initialRoute
      initialRoute: '/splash',
      routes: <String, Widget Function(BuildContext)>{
        '/splash': (BuildContext context) => SplashPage(
              authController: GetIt.I.get<AuthController>(),
            ),
        '/login': (BuildContext context) => LoginPage(
              authController: GetIt.I.get<AuthController>(),
            ),
        '/home': (BuildContext context) => HomePage(),
        '/create-note': (BuildContext context) => CreateNotePage(),
      },
    );
  }
}
