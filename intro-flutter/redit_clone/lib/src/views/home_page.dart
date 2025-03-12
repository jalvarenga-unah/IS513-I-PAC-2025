import 'package:flutter/material.dart';
import 'package:redit_clone/src/providers/productos_provider.dart';
import 'package:redit_clone/src/widgets/item_list.dart';
import 'package:redit_clone/src/widgets/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    print('Iniciando home page');
    // realizar peticiones
    // comprobar informacion local (sqlite o shared preferences)
    // comprabar si hay internet
    // comprobar si el usuario esta logueado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reddit'),
      ),
      drawer: SideMenu(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        // onPageChanged: (value) => {
        //   currentIndex = value,
        //   setState(() {}),
        // },
        children: [
          ProductosFragment(),
          PerfilFragment(),
        ],
      ),
      floatingActionButton: currentIndex == 1
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.settings),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          currentIndex = index;
          // pageController.jumpToPage(index);
          pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          setState(() {});
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class PerfilFragment extends StatelessWidget {
  const PerfilFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('Creando perfil fragment');
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Perfil'),
      ),
    );
  }
}

class ProductosFragment extends StatelessWidget {
  ProductosFragment({
    super.key,
  });

  final productosProvider = ProductosProvider();

  @override
  Widget build(BuildContext context) {
    // productosProvider.getProducts(); // ! ❌ NO SE DEBE HACER AQUI
    print('Creando productos fragment');
    return FutureBuilder(
      future: productosProvider.getProducts(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (asyncSnapshot.hasError) {
          return Center(
            child: Text('Error: ${asyncSnapshot.error}'),
          );
        }

        if (!asyncSnapshot.hasData) {
          return Center(
            child: Text('No hay datos'),
          );
        }

        final productos = asyncSnapshot.data!;

        return ListView.builder(
          itemCount: productos.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemList(producto: productos[index]);
          },
        );
      },
    );
  }
}
