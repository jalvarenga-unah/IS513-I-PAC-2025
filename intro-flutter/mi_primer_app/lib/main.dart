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
      home: Text('Moshi mosh'),
    );
  }
}
