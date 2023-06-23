import 'package:actsafe/global/routes.dart';
import 'package:actsafe/model/user.dart';
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
          routes: routes),
    );
  }
}
