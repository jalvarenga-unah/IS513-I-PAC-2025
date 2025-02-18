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
    print('metdo build');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi primer App',
      home: HomePage(estiloTitulo: estiloTitulo),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required this.estiloTitulo,
  });

  final TextStyle estiloTitulo;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;
  bool hideButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mi primer App',
          style: widget.estiloTitulo.copyWith(
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
              style: widget.estiloTitulo,
            ),
            Text(
              '$contador',
              style: widget.estiloTitulo,
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: hideButton
          ? Container()
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    print('hizo clic');

                    // notifica al estado, que una propiedad cambió
                    // y es necesario redibujar el widget
                    setState(() {});
                    contador++;

                    if (contador > 2) {
                      hideButton = true;
                      Future.delayed(Duration(seconds: 2), () {
                        hideButton = false;
                        setState(() {});
                      });
                    }
                  },
                ),
                SizedBox(
                  // color: Colors.blue,
                  height: 16,
                  // width: 1,
                ),
                FloatingActionButton(
                  child: Icon(Icons.exposure_minus_1_rounded),
                  onPressed: () {
                    print('hizo clic');

                    // notifica al estado, que una propiedad cambió
                    // y es necesario redibujar el widget
                    setState(() {});
                    contador--;
                  },
                ),
              ],
            ),
    );
  }
}
