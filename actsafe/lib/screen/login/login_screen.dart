import 'package:actsafe/screen/home/home_screen.dart';
import 'package:actsafe/screen/login/components/login_form.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void logIn(BuildContext ctx) {
    final enteredUsername = usernameController.text;

    Navigator.of(ctx).pushReplacementNamed(
      HomeScreen.routeName,
      arguments: enteredUsername,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: Text('ACTSafe'),
      // ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login_header.jpg"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter),
        ),
        child: LogInForm(),
      ),
    );
  }
}
