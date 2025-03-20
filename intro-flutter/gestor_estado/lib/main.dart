import 'package:flutter/material.dart';
import 'package:gestor_estado/src/controllers/home_controller.dart';
import 'package:gestor_estado/src/detalle_page.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/detalle': (context) => DetallePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  // final controller = HomeController();

  //un singleton
  final controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => controller.contador.value % 2 == 0
                  ? Text(
                      '${controller.nombre}',
                      style: TextStyle(
                          fontSize: controller.contador.value.toDouble()),
                    )
                  : SizedBox(),
            ),
            Obx(() {
              return Text(
                '${controller.contador}',
                style: TextStyle(fontSize: 30),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/detalle');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
