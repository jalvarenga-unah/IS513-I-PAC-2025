import 'package:flutter/material.dart';
import 'package:redit_clone/src/models/producto.dart';

class DetalleProductoPage extends StatelessWidget {
  const DetalleProductoPage(
      {super.key, required this.id, required this.producto});

  final String id;
  final Producto producto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del producto $id'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Detalle del producto ${producto.title}'),
            Text('${producto.rating?.rate}')
          ],
        ),
      ),
    );
  }
}
