import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductosProvider {
  Future<List<Map<String, dynamic>>> getProducts() async {
    // consultar los datos del API

    // final url = Uri.https('fakestoreapi', '/products');
    final url = Uri.parse('https://fakestoreapi.com/products');

    try {
      final response = await http.get(url);

      response.body; //body -> String

      // transformar los datos en el formato deseado
      // final List<Map<String, dynamic>> data = json.decode(response.body);
      final List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(json.decode(response.body));

      //retornar los datos
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
