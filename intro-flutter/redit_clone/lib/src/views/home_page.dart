import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reddit'),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              DrawerHeader(
                child: Container(
                  color: Colors.red,
                ),
              ),
              Text(
                'olii',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'olii',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'olii',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'olii',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'olii',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'olii',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'olii',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'olii',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'olii',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'olii',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'olii',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text('Holaaaaaaaa'),
      ),
    );
  }
}
