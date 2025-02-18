void generarPago() {
  print('generando pago de planilla');
}

void consultaHistorial() {
  print('consulta de pagos por fecha');
}

void main() {
  // Maps

  // [ 4, 6, 2, 1  ]

  // clave - valor
  final Map<String, dynamic> auto = {
    'marca': 'toyota',
    'anio': 2025,
    'modelo': 'Prado',

    'motor': {
      'clindros': 6,
      'cc': 2400,
    }
    // 4: [],
  };

  final Map<int, Function> opcionesMenu = {
    10: generarPago,
    15: consultaHistorial,
    100: () {}
  };

  print(auto['marca']);
  final motor = auto['motor'];
  print(motor['cc']);

  // este "10" no es una posición
  final test = opcionesMenu[10]!; // <- tengo ya la referencia de una funcion
  test();
}
