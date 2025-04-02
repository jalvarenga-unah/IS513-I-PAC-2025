import 'package:cloud_firestore/cloud_firestore.dart';

class Pelicula {
  String? id;
  String title;
  String director;
  int anio;
  DateTime createdAt;

  Pelicula({
    this.id,
    required this.title,
    required this.director,
    required this.anio,
    required this.createdAt,
  });

  factory Pelicula.fromJson(Map<String, dynamic> json) {
    return Pelicula(
      id: json['id'],
      title: json['title'],
      director: json['director'],
      anio: json['anio'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestoreDataBase() {
    return {
      'title': title,
      'director': director,
      'anio': anio,
      'createdAt': createdAt,
    };
  }
}
