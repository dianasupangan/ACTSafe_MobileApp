import 'dart:convert';

import 'package:actsafe/model/user.dart';
import 'package:actsafe/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  Map<String, dynamic> users = {};
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
          child: SizedBox(
            height: 10,
            width: double.infinity,
          ),
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'Log In',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
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
            onSubmitted: (_) {},
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
            onPressed: () {
              fetchUsers();
              // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
            child: const Text('LOG IN'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(
                50,
              ),
            ),
          ),
        )
      ],
    );
  }

  void fetchUsers() async {
    print('Fetch');

    //access provider
    final userData = Provider.of<User>(context, listen: false);
    var url = Uri.parse("http://127.0.0.1/http/login.php");
    var response = await http.post(url, body: {
      "id_number": usernameController.text,
      "password": passwordController.text,
    });
    final utf = utf8.decode(response.bodyBytes);
    final json = jsonDecode(utf);
    final result = json['status'];
    print("hi: $result");

    if (result == 'Success') {
      final id_number = json['id'];
      final first_name = json['first_name'];
      final last_name = json['last_name'];
      final user_type = json['user_type'];
      userData.add(id_number, first_name, last_name, user_type);
      print(
          '${userData.items.first.firstName} ${userData.items.first.lastname} ${userData.items.first.idNumber} ${userData.items.first.userType}');
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
    print('Fetch users completed');
  }
}
