void main() {
  final int? edad = null;

  // NullSafety
  // final esMayor = edad! >= 18; // chequee la variable y no es nula
  final esMayor = (edad ?? 0) >= 18; // chequee la variable y no es nula

  print(esMayor);

  // && || !
  if (!((edad ?? 0) >= 18)) {
    print('Eres mayor de edad');
  } else {
    print('Eres menor de edad');
  }
}
