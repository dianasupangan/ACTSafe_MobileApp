import 'package:actsafe/screen/home_screen.dart';
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
    // final enteredUsername = usernameController.text;
    // final enteredPassword = passwordController.text;

    // if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
    //   return;
    // }

    Navigator.of(ctx).pushNamed(
      HomeScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ACTSafe'),
      // ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 120),
              child: Image.asset(
                'assets/images/logo.png',
                height: 300,
              ),
            ),
            Container(
              width: 350,
              child: Column(
                children: <Widget>[
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('ID Number'),
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('Password'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () => logIn(context),
                    child: Text('LOG IN'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
