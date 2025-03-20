import 'package:flutter/material.dart';
import 'package:gestor_estado/src/controllers/home_controller.dart';
import 'package:get/get.dart';

class DetallePage extends StatelessWidget {
  DetallePage({super.key});

  // final controller = HomeController();

  final controller = Get.find<HomeController>();
  // final controller = Get.put(HomeController());
  // final controller = Get.lazyPut(() => HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle'),
      ),
      body: Center(
        child: Obx(() => Text(
              '${controller.contador}',
              style: TextStyle(fontSize: 40),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.contador.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
