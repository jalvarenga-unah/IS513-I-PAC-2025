//callback

void main() {
  //Object, un iterable
  final postres = ['Torta', 'Helado', 'Gelatina'];
  final numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // ciclo for tradicional
  // for (int i = 0; i < postres.length; i++) {
  //   print(postres[i]);
  // }

  postres.forEach(print);

  // función anonima
  // numeros.forEach((int numero) => print(numero * numero));

  // for (final numero in numeros) {
  // print(numero);
  // }

  final pares = numeros.where((numero) {
    bool resultado = false;

    if (numero % 2 == 0) {
      resultado = true;
    }

    return resultado;
  }).toList();

  final impares = numeros.where((numero) {
    return numero % 2 != 0;
  }).toList();

  // print(pares);
  // print(impares);

  final numeros2 = numeros.map((int numero) {
    return numero.toDouble();
  }).toList();

  print(numeros2);
}

void imprimir(String valor) {
  print('Este postre es rico: ');
  print(valor);
}
