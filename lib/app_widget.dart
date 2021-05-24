import 'package:flutter/material.dart';
import 'package:notes/create_note_page.dart';
import 'home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      //a primeira rota default do flutter é a rota '/', para modificar isso tem a propriedade initialRoute
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/create-note': (context) => CreateNotePage(),
      },
    );
  }
}
