import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redit_clone/src/models/producto.dart';

class ProductosProvider {
  Future<List<Producto>> getProducts() async {
    // consultar los datos del API

    // final url = Uri.https('fakestoreapi', '/products');
    final url = Uri.parse(
      'https://fakestoreapi.com/products',
    );

    try {
      final response = await http.get(url);

      // transformar los datos en el formato deseado
      // final List<Map<String, dynamic>> data = json.decode(response.body);

      //? Forma 1 de parsear los datos
      // final data = json.decode(response.body);

      // final parsedData = List<Producto>.from(
      //   data.map(
      //     (item) => Producto(
      //       id: item['id'],
      //       title: item['title'],
      //       price: item['price'].toDouble(),
      //       description: item['description'],
      //       category: item['category'],
      //       image: item['image'],
      //     ),
      //   ),
      // );

      //retornar los datos
      return productoFromJson(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
