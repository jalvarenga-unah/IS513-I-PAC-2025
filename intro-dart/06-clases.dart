import 'persona.dart';

void main() {
  final persona1 = Persona(
    nombre: 'Juan',
    edad: 30,
    estatura: 1.60,
  );

  final persona2 = Persona(
    nombre: 'Enrique',
    edad: 30,
    estatura: 1.60,
    // apodo: 'Kike',
  );

  Map dataUser = {
    'nombre': true,
    'edad': 22,
    'estatura': 1.90,
    'apellido': 'Contreras',
    'direccion': {'lat': 2424.234, 'lng': 12.234}
  };

  final persona3 = Persona.fromJson(dataUser);

  final persona4 = Persona.conApellido(
    nombre: 'Enrique',
    edad: 30,
    estatura: 1.60,
    apellido: 'Alvarenga',
  );

  print('=====Persona 1 ========');
  print(persona1.nombre);
  persona1.apodo = 'kike'; // setter
  // persona1.apodo('kike');
  print(persona1.apodo); // getter
  persona1.caminar();
  print('=====Persona 2 ========');
  print(persona2.nombre);
  print(persona2.apodo); // getter
  persona2.caminar();
  print('=====Persona 3 ========');
  print(persona3.nombre);
  print(persona3.apellido);
  print(persona3.apodo); // getter
  persona3.caminar();
}
