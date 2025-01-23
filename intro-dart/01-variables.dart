//metodo principal de un programa en Dart

void main() {
  // formas de definir variables
  // String nombre;

  // definiendo / declarando una variable
  final String nombre; //*Instacia de la clase "String"

  // asignando un valor a la variable
  nombre = 'Juan';

  // dynamic edad; //! ❌ no se deberian declarar variables así

  // edad = 23.5;
  // edad = 23.6;
  // edad = 'olii';

  int edad = 30;

  const String apellido = 'Perez';

  String segundoApellido = 'Gomez';

  // print(nombre + ' ' + apellido + ' ' + segundoApellido);
  //template string

  print(nombre[0]);

  print('${3 + 8}');
  print('me llamo ${nombre[0]}$apellido $segundoApellido tengo $edad años');
  print(edad);
}
