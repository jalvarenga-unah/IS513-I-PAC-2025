void main() {
  final List<int> numeros = [1, 2, 3];

  numeros[0] = 10;
  numeros.add(5);
  // numeros.clear();

  print(numeros.length);
  print(numeros);

  // Diccionaerios / Mapas / Objetos => clave - valor
  final Map<String, dynamic> mascota = {
    'nombre': 'Apolo',
    'edad': 3,
    'vacunas': [
      {
        'nombre': 'Pfizer',
        'ayuda': 'Contra la rabia',
        'fecha': '2025-01-01',
      },
    ]
  };

  print(mascota['nombre']);
  print(mascota['vacunas'][0]['fecha']);

  String nombre = 'Juan Enrique';

  final Map<String, dynamic> persona = {
    'nombre': nombre,
    'apellido': 'Alvarenga',
    'edad': 30,
    'direccion': {
      'ciudad': 'SPS',
      'calle': 'siempre viva',
      'ave': 43,
      'geo': {
        'lat': 124.2523,
        'log': 12.4325,
      }
    }
  };

//elimina una clave del mapa
  persona.remove('direccion');

  // al hacer referencia a una clave que no existe
  // la crea
  persona['titulo'] = 'Ingeniero en Sistemas';

  print(persona);
}
