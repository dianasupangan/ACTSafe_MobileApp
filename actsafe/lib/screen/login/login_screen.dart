import 'package:actsafe/screen/login/components/login_form.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  void logIn(BuildContext ctx) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ACTSafe'),
      // ),
      body: SingleChildScrollView(
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login_header.jpg"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter),
          ),
          child:
              Container(alignment: Alignment.bottomCenter, child: LogInForm()),
        ),
      ),
    );
  }
}
