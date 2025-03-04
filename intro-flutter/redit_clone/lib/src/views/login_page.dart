import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlutterLogo(
                  size: 150,
                ),
                TextField(
                  // maxLength: 200,
                  controller: userController,
                  maxLines: 1,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'ejem. plopez@mail.com',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // maxLength: 200,
                  controller: passwordController,
                  maxLines: 1,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'ejem. 1234',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.5,
                // ),
                ElevatedButton(
                  onPressed: () {
                    if (userController.text.trim().isEmpty) {
                      print('el usuario es obligatorio');
                      return;
                    }
                    print(userController.text);
                    print(passwordController.text);
                  },
                  child: Text('Inicar Sesión'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
