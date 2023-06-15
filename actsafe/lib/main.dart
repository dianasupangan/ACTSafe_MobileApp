import 'package:actsafe/model/user.dart';
import 'package:actsafe/screen/healthdec/healthdec_screen.dart';
import 'package:actsafe/screen/home/home_screen.dart';
import 'package:actsafe/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => User(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.green.shade200,
              onPrimary: Colors.green.shade900,
              secondary: Colors.green.shade700,
              onSecondary: Colors.white,
              background: Colors.green,
              onBackground: Colors.black,
              error: Colors.red,
              onError: Colors.white,
              surface: Colors.green.shade200,
              onSurface: Colors.green.shade900),
        ),
        title: 'ACTSafe',
        initialRoute: '/',
        routes: {
          '/': (context) => const HealthDeclarationScreen(),
          // '/': (context) => const LogInScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
