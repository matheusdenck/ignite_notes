import 'package:flutter/material.dart';

import '../create_edit_note/create_edit_note_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["Primeiro Item"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text('NOTES'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < notes.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: ListTile(
                      title: Center(
                        child: Text(notes[i]),
                      ),
                      onTap: () async {
                        var response = await Navigator.pushNamed(
                            context, '/create-note',
                            arguments: notes[i]);
                        if (response != null) {
                          var description = response as String;
                          if (response.isEmpty) {
                            notes.removeAt(i);
                          } else {
                            notes[i] = description;
                          }
                          setState(() {});
                        }
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
          child: Icon(Icons.add_box_outlined),
          onPressed: () async {
            var description =
                await Navigator.pushNamed(context, '/create-note');
            if (description != null) {
              setState(() {
                notes.add(description as String);
              });
            }
          },
        ),
      ),
    );
  }
}
