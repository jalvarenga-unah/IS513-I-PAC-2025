import 'package:firebase_app/create_movie_page.dart';
import 'package:firebase_app/home_page.dart';
import 'package:firebase_app/login_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart'
    show FirebaseMessaging;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// void main() => runApp(const MyApp());

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  messaging
      .requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  )
      .then((settings) {
    print('User granted permission: ${settings.authorizationStatus}');
  });

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // FirebaseMessaging.instance.getToken().then((token) {
  //   print('Token: $token');
  // });

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('oliiii!!!!!');
  //   print('Message data: ${message.data}');

  //   // mostrar una push local

  //   if (message.notification != null) {

  //     print('Message also contained a notification: ${message.notification}');
  //   }
  // });
  runApp(MyApp());
}

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
        '/create_movie': (context) => CreateMoviePage(),
        '/login': (context) => LoginPage()
      },
    );
  }
}
