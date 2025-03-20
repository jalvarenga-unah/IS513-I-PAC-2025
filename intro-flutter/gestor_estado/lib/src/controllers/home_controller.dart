import 'package:get/get.dart';

class HomeController extends GetxController {
  // espacio o contenedor "listener"
  final RxString nombre = 'Juan E. Alvarenga'.obs; // observable
  final contador = 20.obs;
  final lista = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //llamar a una api
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //eliminar informacion de sesiones
  }

  void addItem(int num) {
    lista.add(num);
  }
}
