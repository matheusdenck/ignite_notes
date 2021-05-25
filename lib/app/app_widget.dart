import 'package:flutter/material.dart';
import 'package:notes/pages/create_edit_note/create_edit_note_page.dart';
import '../pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
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
