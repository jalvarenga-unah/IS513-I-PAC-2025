// modelo de "Persona"
class Persona {
  //atributos / propiedades

  final String nombre;
  final int edad;
  final double estatura;
  String? apellido;
  String? _apodo; // privado

  //constructor con argumentos posicionales
  // Persona(this.nombre, this.edad, this.estatura);

  Persona({
    required this.nombre,
    required this.edad,
    required this.estatura,
    this.apellido,
  });

  // constructor factory
  factory Persona.fromJson(Map datos) {
    return Persona(
      nombre: datos['nombre'],
      edad: datos['edad'],
      estatura: datos['estatura'],
      apellido: datos['apellido'],
    );
  }

  factory Persona.conApellido({
    required String nombre,
    required int edad,
    required double estatura,
    required String apellido,
  }) {
    return Persona(
      nombre: nombre,
      edad: edad,
      estatura: estatura,
      apellido: apellido,
    );
  }

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

  // no es permitido nombrar 2 funciones con el mismo nombre
  // void caminar() {
  //   print('${this.nombre} empezó a caminar');
  // }

  // METODOS GETTER Y SETTER

  String get apodo => _apodo ?? 'No tiene apodo';
  set apodo(final String apodo) => _apodo = apodo;

  // String getApodo() {
  //   return this._apodo ?? 'No tiene apodo';
  // }

  // void setApodo(String apodo) {
  //   this._apodo = apodo;
  // }
}
