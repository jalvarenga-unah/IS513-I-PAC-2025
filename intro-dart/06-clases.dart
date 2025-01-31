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
    apodo: 'Kike',
  );

  print('=====Persona 1 ========');
  print(persona1.nombre);
  print(persona1.apodo);
  persona1.caminar();
  print('=====Persona 2 ========');
  print(persona2.nombre);
  print(persona2.apodo);
  persona2.caminar();
}

// modelo de "Persona"
class Persona {
  //atributos / propiedades

  final String nombre;
  final int edad;
  final double estatura;
  String? apodo;

  //constructor con argumentos posicionales
  // Persona(this.nombre, this.edad, this.estatura);

  Persona({
    required this.nombre,
    required this.edad,
    required this.estatura,
    this.apodo,
  });
  // ⬇️ No es valido
  //! Persona(this.nombre, this.edad, this.estatura, this.apodo);

  // Persona(String nombre, int edad, double estatura) {
  //   this.nombre = nombre;
  //   this.edad = edad;
  //   this.estatura = estatura;
  // }

  //comportaminetos
  void caminar([String? acompaniante]) {
    print('${this.nombre} empezó a caminar');
  }
  // habla
}
