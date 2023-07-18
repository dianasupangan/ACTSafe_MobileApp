import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../global/link_header.dart';
import '../../../../global/validate.dart';
import '../../../../utils/snackbar_helper.dart';

class CovidTestForm extends StatefulWidget {
  const CovidTestForm({super.key});

  @override
  State<CovidTestForm> createState() => _CovidTestFormState();
}

class _CovidTestFormState extends State<CovidTestForm> {
  late SharedPreferences prefs;
  String infectionData = "";
  final linkController = TextEditingController();
  bool isLink = true;

  @override
  void initState() {
    covidStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                isLink = Validate().validateGoogleDriveLink(value);
              });
            },
            decoration: InputDecoration(
              label: const Text('Google Drive Photo link'),
              border: const OutlineInputBorder(),
              errorText:
                  isLink == true ? null : "Please enter the google drive link",
            ),
            controller: linkController,
            keyboardType: TextInputType.url,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: ElevatedButton(
            onPressed: () {
              if (linkController.text.isEmpty && isLink == false) {
                showErrorMessage(context,
                    message: "Please complete enter valid link");
              } else {
                if (linkController.text.isNotEmpty && isLink == true) {
                  if (infectionData == "Yes") {
                    submitNegativeCovidTest();
                  } else if (infectionData == "No") {
                    submitPositiveCovidTest();
                  }
                } else {
                  showErrorMessage(context, message: "Please enter valid link");
                }
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(
                50,
              ),
            ),
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }

  void covidStatus() async {
    prefs = await SharedPreferences.getInstance();
    final json = jsonDecode(prefs.getString('user_data')!) as Map;

    setState(() {
      infectionData = json['covidStatus'].toString();
    });
  }

  void submitPositiveCovidTest() async {
    prefs = await SharedPreferences.getInstance();
    final userData = jsonDecode(prefs.getString('user_data')!) as Map;

    try {
      var url = Uri.parse(link_header);
      var response = await http.post(url, body: {
        "state": "state_send_positive_test",
        "id_number": userData['id_number'].toString(),
        "photo_link": linkController.text,
      });
      final utf = utf8.decode(response.bodyBytes);
      final json = jsonDecode(utf);
      final result = json['status'];
      print("hi: $json");
      if (result == 'Success') {
        Navigator.of(context).pop();
        showSuccessMessage(context, message: "Positive Covid Test Submitted");
      } else if (result == 'Failed') {
        showErrorMessage(context, message: "Submission Failed");
      }
    } catch (err) {
      showErrorMessage(context, message: "Connection error");
    }
  }

  void submitNegativeCovidTest() async {
    prefs = await SharedPreferences.getInstance();
    final userData = jsonDecode(prefs.getString('user_data')!) as Map;

    try {
      var url = Uri.parse(link_header);
      var response = await http.post(url, body: {
        "state": "state_send_negative_test",
        "id_number": userData['id_number'].toString(),
        "photo_link": linkController.text,
      });
      final utf = utf8.decode(response.bodyBytes);
      final json = jsonDecode(utf);
      final result = json['status'];
      print("hi: $json");
      if (result == 'Success') {
        Navigator.of(context).pop();
        showSuccessMessage(context, message: "Negative Covid Test Submitted");
      } else if (result == 'Failed') {
        showErrorMessage(context, message: "Submission Failed");
      }
    } catch (err) {
      showErrorMessage(context, message: "Connection error");
    }
  }
}
