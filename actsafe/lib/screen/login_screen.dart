import 'package:actsafe/data/user_data.dart';
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
  final userData = USER_INFO.toList();

  void logIn(BuildContext ctx) {
    final enteredUsername = usernameController.text;
    final enteredPassword = passwordController.text;

    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      return;
    } else if (enteredUsername.isNotEmpty || enteredPassword.isNotEmpty) {
      for (int i = 0; i > userData.length; i++) {
        if (enteredUsername == userData[i].username &&
            enteredPassword == userData[i].password) {
          Navigator.of(ctx).pushNamed(
            HomeScreen.routeName,
          );
        } else {
          continue;
        }
      }
    }
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
                  TextField(
                    decoration: const InputDecoration(
                      label: Text('ID Number'),
                    ),
                    controller: usernameController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      label: Text('Password'),
                    ),
                    controller: passwordController,
                    onSubmitted: (_) => logIn(context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () => logIn(context),
                    child: const Text('LOG IN'),
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
