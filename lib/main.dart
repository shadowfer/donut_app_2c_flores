import 'package:donut_app_2c_flores/pages/login_page.dart';
import 'package:donut_app_2c_flores/pages/home_page.dart'; // <-- Importa aquí tu HomePage
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'donut_app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) =>
            const HomePage(), // <-- AQUI defines la ruta /home
      },
    );
  }
}
