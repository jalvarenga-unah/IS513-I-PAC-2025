import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pelicula.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateMoviePage extends StatefulWidget {
  const CreateMoviePage({super.key});

  @override
  State<CreateMoviePage> createState() => _CreateMoviePageState();
}

class _CreateMoviePageState extends State<CreateMoviePage> {
  final title = TextEditingController(text: 'Nueva pelicula');

  final director = TextEditingController(text: 'prueba');

  final anio = TextEditingController(text: 2025.toString());

  File? fileToUpload;

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
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  final picker = ImagePicker();

                  final file =
                      await picker.pickImage(source: ImageSource.gallery);

                  if (file == null) return;

                  // final name = file.name;
                  final path = file.path;

                  fileToUpload = File(path);
                  setState(() {});
                  // final url = await mountainsRef.getDownloadURL();
                },
                child: Text('Subir foto portada'),
              ),
              if (fileToUpload != null)
                Image(
                  image: FileImage(fileToUpload!),
                )
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

          final storageRef = FirebaseStorage.instance.ref(); //bucket
          final fileRef = storageRef.child(
              '${FirebaseAuth.instance.currentUser!.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg');

          await fileRef.putFile(fileToUpload!);

          final url = await fileRef.getDownloadURL();

          Pelicula data = Pelicula(
              title: title.text,
              director: director.text,
              anio: int.parse(anio.text),
              createdAt: DateTime.now(),
              posterImage: url);

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
