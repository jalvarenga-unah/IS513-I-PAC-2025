import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pelicula.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        if (!context.mounted) return;
        Navigator.of(context).pushReplacementNamed('/login');
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase App'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut(); //cierran sesion
                Navigator.of(context).pushReplacementNamed('/login');
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('movies')
              .withConverter<Pelicula>(
                  fromFirestore: (snapshot, _) {
                    final data = snapshot.data()!;
                    data['id'] = snapshot.id; //id del documento

                    return Pelicula.fromJson(data);
                  },
                  toFirestore: (pelicula, _) => pelicula.toFirestoreDataBase())
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot<Pelicula>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            print(snapshot.data);

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ' + snapshot.error.toString()),
              );
            }

            if (!snapshot.hasData) {
              return Center(
                child: Text('No hay informacion de peliculas ' +
                    snapshot.error.toString()),
              );
            }
            final movies = snapshot.data!.docs
                .map(
                  (doc) => doc.data(),
                )
                .toList();

            // final movies = List<Map<String, dynamic>>.from(
            //   snapshot.data!.docs.map(
            //     (doc) => doc.data(),
            //   ),
            // );

            if (movies.isEmpty) {
              return Center(
                child: Text('No hay peliculas'),
              );
            }

            return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  print(movie.id);

                  return Dismissible(
                    secondaryBackground: Container(
                      color: Colors.green,
                      child: const Icon(Icons.edit),
                    ),
                    background: Container(
                      color: Colors.red,
                      child: const Icon(Icons.delete),
                    ),
                    key: Key(movie.id!),
                    child: ListTile(
                      title: Text(movie.title),
                      subtitle: Text(movie.director),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // FirebaseMessaging.instance.subscribeToTopic('promos');
        // FirebaseMessaging.instance.unsubscribeFromTopic('weather');

        Navigator.of(context).pushNamed('/create_movie');
      }),
    );
  }
}
