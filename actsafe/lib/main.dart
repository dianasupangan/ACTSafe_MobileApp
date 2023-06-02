import 'package:actsafe/screen/home/home_screen.dart';
import 'package:actsafe/screen/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.white,
      ),
      title: 'ACTSafe',
      initialRoute: '/',
      routes: {
        '/': (context) => const LogInScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}