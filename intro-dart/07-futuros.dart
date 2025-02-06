import 'dart:math';

void main() async {
  print('Inicio del programa');

  print('Hice la solicitud de informacion');

  // future simule una peticion

  // puedo resolver futuros de forma asincrona
  // obtenerInformacion().then((resultado) {
  //   print(resultado);

  //   print('hago otras cosas por mientras');

  //   print('Fin del programa');
  // }).catchError((error) {
  //   print(error);
  // });

  //? de forma sincrona

  try {
    final resultado = await obtenerInformacion(); // 20 min
    print(resultado);
  } catch (e) {
    print(e);
  }

  print('hago otras cosas por mientras');

  print('Fin del programa');
}

//1. en proceso o pendiente
//2. finalizado con exito / completada
//3. finalizado con error / rechazada

Future<String> obtenerInformacion() async {
  // await Future.delayed(Duration(seconds: 3), () {
  //   print('Obteniendo informacion');
  // });
  final r = Random().nextInt(2);

  if (r == 0) {
    return Future.error('Error al obtener la informacion');
  }

  return Future.value('Informacion obtenida');
}
