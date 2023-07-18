import 'dart:convert';

import 'package:actsafe/screen/dataprivacy/dataprivacy_screen.dart';
import 'package:actsafe/screen/home/home_screen.dart';
import 'package:actsafe/screen/login/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late SharedPreferences prefs;

  @override
  void initState() {
    checkActiveStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ACTSafe'),
      // ),
      body: SingleChildScrollView(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login_header.jpg"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter),
          ),
          child: Container(
              alignment: Alignment.bottomCenter, child: const LogInForm()),
        ),
      ),
    );
  }

  void checkActiveStatus() async {
    prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('user_data') == true) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }
}
