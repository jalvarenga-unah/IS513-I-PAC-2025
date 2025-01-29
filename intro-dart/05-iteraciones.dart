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
  numeros.forEach((int numero) => print(numero * numero));
}

void imprimir(String valor) {
  print('Este postre es rico: ');
  print(valor);
}
