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

    Navigator.of(ctx).pushNamed(
      HomeScreen.routeName,
      arguments: enteredUsername,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ACTSafe'),
      // ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
            child: Image.asset(
              'assets/images/logo.png',
              height: 300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: TextField(
              decoration: const InputDecoration(
                label: Text('ID Number'),
                border: OutlineInputBorder(),
              ),
              controller: usernameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: TextField(
              decoration: const InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(),
              ),
              controller: passwordController,
              onSubmitted: (_) => logIn(context),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: ElevatedButton(
              onPressed: () => logIn(context),
              child: const Text('LOG IN'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(
                  50,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
