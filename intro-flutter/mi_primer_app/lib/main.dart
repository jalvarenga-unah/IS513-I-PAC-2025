import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 1. Un Widget sin estado  (StatelessWidget)
// 2. Un Widget con estado (StatefulWidget)

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi primer App',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Mi primer App',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.teal[50],
            ),
          ),
          backgroundColor: Colors.teal,
          centerTitle: false,
        ),
        body: Center(
          child: Text('Moshi mosh'),
        ),
      ),
    );
  }
}
