import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 1. Un Widget sin estado  (StatelessWidget)
// 2. Un Widget con estado (StatefulWidget)

class MyApp extends StatelessWidget {
  final estiloTitulo = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    color: Color(0xff242424),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi primer App',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Mi primer App',
            style: estiloTitulo.copyWith(
              color: Colors.teal[50],
            ),
          ),
          backgroundColor: Colors.teal,
          centerTitle: false,
        ),
        body: Center(
          // color: Colors.red,
          // width: double.infinity,
          // width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hizo clic en el botón: ',
                style: estiloTitulo,
              ),
              Text(
                '0 ',
                style: estiloTitulo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
