import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase App'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('movies')
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            print(snapshot.data);

            if (!snapshot.hasData) {
              return Center(
                child: Text('No hay informacion de peliculas ' +
                    snapshot.error.toString()),
              );
            }

            final movies = List<Map<String, dynamic>>.from(
              snapshot.data!.docs.map(
                (doc) => doc.data(),
              ),
            );

            if (movies.isEmpty) {
              return Center(
                child: Text('No hay peliculas'),
              );
            }

            return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return ListTile(
                    title: Text(movie['title']),
                    subtitle: Text(movie['director']),
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
