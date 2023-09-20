import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/methodes/provider.dart';
import 'package:storeapp/pages/signup.dart';
import 'package:storeapp/pages/splash.dart';
import 'package:storeapp/pages/welcome.dart';
import 'pages/home.dart';
import 'pages/login.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Mangment(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const Signup(),
        '/home': (context) => const Home(),
        '/welcome': (context) => const Welcome(),
        '/Splash': (context) => const Splash(),
      },
      home: const Splash(),
    );
  }
}
