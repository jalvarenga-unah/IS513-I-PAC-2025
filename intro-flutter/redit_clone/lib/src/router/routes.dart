import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redit_clone/src/models/producto.dart';
import 'package:redit_clone/src/views/detalle_producto_page.dart';
import 'package:redit_clone/src/views/home_page.dart';
import 'package:redit_clone/src/views/login_page.dart';

final router = GoRouter(
  initialLocation: '/productos',
  redirect: (context, state) {
    //validar si el usuario esta logueado y si la ruta es diferente a login
  },
  routes: [
    GoRoute(
      path: '/productos',
      name: 'productos',
      builder: (context, settings) => HomePage(),
      routes: [
        GoRoute(
          path: '/:productoId', // /productos/4
          name: 'detalle-producto',
          builder: (BuildContext context, GoRouterState settings) {
            final id = settings.pathParameters['productoId'];

            final extras = settings.extra as Producto;
            print(extras);

            return DetalleProductoPage(
              id: '$id',
              producto: extras,
            );
          },
        )
      ],
    ),
    GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, settings) => LoginPage())
  ],
);
