class Estudiante {
  String nombre;
  int edad;
  double promedio;

  Estudiante({
    this.nombre = "",
    this.edad = 0,
    this.promedio = 0,
  });

  mostrarDatos() {
    return {
      'nomre': nombre,
      'edad': edad,
      'promedio': promedio,
    };
  }
}
