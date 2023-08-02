import 'dart:convert';

import 'package:actsafe/global/link_header.dart';
import 'package:actsafe/global/sha256_converter.dart';
import 'package:actsafe/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../global/validate.dart';
import '../../dataprivacy/dataprivacy_screen.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  late SharedPreferences prefs;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isId = true;
  bool isPassword = true;

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
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
              ),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Text(
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
                    onChanged: (value) {
                      setState(() {
                        isId = Validate().validateStudentId(value);
                      });
                    },
                    decoration: InputDecoration(
                      label: const Text('ID Number'),
                      border: const OutlineInputBorder(),
                      errorText:
                          isId == true ? null : "Please enter your ID Number",
                    ),
                    controller: usernameController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        if (passwordController.text == "") {
                          isPassword = false;
                        } else {
                          isPassword = true;
                        }
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      border: const OutlineInputBorder(),
                      errorText: isPassword == true
                          ? null
                          : "Please enter your password",
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
    prefs = await SharedPreferences.getInstance();

    try {
      var url = Uri.parse(link_header);
      var response = await http.post(url, body: {
        "state": "state_login",
        "id_number": usernameController.text,
        "password": sha256Encode(passwordController.text),
      });
      final utf = utf8.decode(response.bodyBytes);
      final json = jsonDecode(utf);
      final result = json['status'];
      print(json);

      if (result == 'Success') {
        Map userData = {
          'id_number': json['id'],
          'device_id': json['device_id'],
          'first_name': json['first_name'],
          'last_name': json['last_name'],
          'user_type': json['user_type'],
          'is_active': json['is_active'],
        };

        prefs.setString('user_data', jsonEncode(userData));

        showSuccessMessage(context, message: "Login successful!");
        Navigator.of(context).pushReplacementNamed(DataPrivacyScreen.routeName);
      } else if (result == 'Invalid account') {
        showErrorMessage(context, message: "Account does not exist");
      }
    } catch (err) {
      showErrorMessage(context, message: "Connection Error");
      print(err);
    }
  }
}
