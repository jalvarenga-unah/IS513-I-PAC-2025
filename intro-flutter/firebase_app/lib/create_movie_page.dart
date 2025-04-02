import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pelicula.dart';
import 'package:flutter/material.dart';

class CreateMoviePage extends StatelessWidget {
  CreateMoviePage({super.key});

  final title = TextEditingController(text: 'Nueva pelicula');
  final director = TextEditingController(text: 'prueba');
  final anio = TextEditingController(text: 2025.toString());

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
          // final data = {
          //   'title': title.text,
          //   'director': director.text,
          //   'anio': int.parse(anio.text),
          //   'createdAt': DateTime.now(), //timestamp
          // };

          Pelicula data = Pelicula(
            title: title.text,
            director: director.text,
            anio: int.parse(anio.text),
            createdAt: DateTime.now(),
          );

          final newDoc = await FirebaseFirestore.instance
              .collection('movies')
              .add(data.toFirestoreDataBase());

          if (!context.mounted) return;

          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Pelicula ${data.title} creada'),
            ),
          );
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
