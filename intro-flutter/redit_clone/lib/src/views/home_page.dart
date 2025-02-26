import 'package:flutter/material.dart';
import 'package:redit_clone/src/api/productos.dart';
import 'package:redit_clone/src/widgets/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reddit'),
      ),
      drawer: SideMenu(),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                Image(
                  height: 250,
                  fit: BoxFit.fill,
                  image: NetworkImage(productos[index]['image']),
                ),
                Text(productos[index]['title']),
                Text('USD${productos[index]['price']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
