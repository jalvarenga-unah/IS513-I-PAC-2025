import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateMoviePage extends StatelessWidget {
  CreateMoviePage({super.key});

  final title = TextEditingController();
  final director = TextEditingController();
  final anio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Pelicula'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: title,
                decoration: InputDecoration(
                  labelText: 'Titulo',
                ),
              ),
              TextField(
                controller: director,
                decoration: InputDecoration(
                  labelText: 'Director',
                ),
              ),
              TextField(
                controller: anio,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Año',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final data = {
            'title': title.text,
            'director': director.text,
            'anio': int.parse(anio.text),
            'createdAt': DateTime.now(), //timestamp
          };

          final newDoc =
              await FirebaseFirestore.instance.collection('movies').add(data);

          print('Pelicula agregada con id: ${newDoc.id}');
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
