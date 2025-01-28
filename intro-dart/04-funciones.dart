//main, es la función pricipal de nuestro app
void main() {
  saludar("Juan", "Alvarenga");
  saludar("Enrique");
  final cadena = saludar2("Alvarenga", "Juan");

  final cadena2 = saludar3(apellido: "Rodas", nombre: 'Enrique');

  print(cadena);
  print(cadena2);
  // saludar(saludar);
}

// Los [] hace que un parametro sea opcional
// si un parametro es opcional, se debe controlar que no sea null

void saludar([String? nombre, String apellido = '']) {
  print('olii $nombre $apellido');
}

String saludar2(String nombre, String apellido) {
  return 'olii $nombre $apellido'; // la ultima linea de la funcion
}

// convierte a los parametros en agumentos nombrados
String saludar3({
  required String nombre,
  required String apellido,
}) {
  return 'olii $nombre $apellido'; // la ultima linea de la funcion
}
