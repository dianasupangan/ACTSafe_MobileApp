import 'package:actsafe/model/user.dart';
import 'package:actsafe/screen/contact/contactinfo_screen.dart';
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
          primarySwatch: Colors.green,
          canvasColor: Colors.white,
        ),
        title: 'ACTSafe',
        initialRoute: '/',
        routes: {
          '/': (context) => const ContactInfoScreen(),
          // '/': (context) => const LogInScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
