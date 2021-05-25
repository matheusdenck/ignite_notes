import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  var description = '';
  var textController = TextEditingController();
  var isEdit = false;

  @override
  void initState() {
    //esse método serve para esperar o primeiro build, gerando o context necessário para o funcionamento do if abaixo
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      //se a rota do contexto contem algum argumentos, ou seja, está retornando alguma variável, description recebe esta variável como uma String
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = description;
        setState(() {
          isEdit = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Note' : 'Create Note'),
        centerTitle: true,
        actions: [
          if (isEdit)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Navigator.pop(context, '');
              },
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              maxLines: null,
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Descrição',
              ),
            ),
            SizedBox(
              height: 32,
            ),
            if (description.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, description);
                      },
                      child: Text('Salvar'),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
