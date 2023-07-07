import 'dart:convert';

import 'package:actsafe/global/link_header.dart';
import 'package:actsafe/model/user.dart';
import 'package:actsafe/screen/dataprivacy/components/dataprivacy_notes.dart';
import 'package:actsafe/screen/home/home_screen.dart';
import 'package:actsafe/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../dataprivacy/dataprivacy_screen.dart';

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
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 375, 0, 0),
          child: SizedBox(
            height: 10,
            width: double.infinity,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
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
                    obscureText: true,
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
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(
                        50,
                      ),
                    ),
                    child: const Text('LOG IN'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void fetchUsers() async {
    print('Fetch');

    //access provider
    final userData = Provider.of<User>(context, listen: false);
    var url = Uri.parse(link_header);
    var response = await http.post(url, body: {
      "state": "state_login",
      "id_number": usernameController.text,
      "password": passwordController.text,
    });
    final utf = utf8.decode(response.bodyBytes);
    final json = jsonDecode(utf);
    final result = json['status'];
    print("hi: $json");

    if (result == 'Success') {
      final idNumber = json['id'];
      final firstName = json['first_name'];
      final lastName = json['last_name'];
      final userType = json['user_type'];
      final isActive = json['is_active'];

      userData.clear();
      userData.add(idNumber, firstName, lastName, userType, isActive);
      showSuccessMessage(context, message: "Login successful!");
      Navigator.of(context).pushReplacementNamed(DataPrivacyScreen.routeName);

      print('Fetch users completed');
    } else if (result == 'Invalid account') {
      showErrorMessage(context, message: "Account does not exist");
    }
  }
}

// 20230001
// vvn123456
