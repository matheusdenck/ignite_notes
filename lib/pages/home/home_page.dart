import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/shared/auth/auth_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = <String>['Primeiro Item'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: const Text('NOTES'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GetIt.I.get<AuthController>().logoutUser();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              for (int i = 0; i < notes.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: ListTile(
                      title: Center(
                        child: Text(notes[i]),
                      ),
                      onTap: () async {
                        await Navigator.pushNamed(context, '/create-note',
                                arguments: notes[i])
                            .then(
                          (dynamic value) {
                            if (value != null) {
                              String description = value as String;
                              if (value.isEmpty) {
                                notes.removeAt(i);
                              } else {
                                notes[i] = description;
                              }
                              setState(() {});
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: ElevatedButton(
          child: const Icon(Icons.add_box_outlined),
          onPressed: () async {
            await Navigator.pushNamed(context, '/create-note').then(
              (dynamic value) {
                if (value != null) {
                  setState(
                    () {
                      notes.add(value as String);
                    },
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
