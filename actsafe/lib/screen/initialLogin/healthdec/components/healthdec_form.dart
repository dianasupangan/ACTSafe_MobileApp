import 'dart:convert';

import 'package:actsafe/screen/initialLogin/symptom/symptom_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../global/api_key.dart';
import '../../../../global/link_header.dart';
import '../../../../utils/snackbar_helper.dart';

class HealthDecForm extends StatefulWidget {
  const HealthDecForm({super.key});

  @override
  State<HealthDecForm> createState() => _HealthDecFormState();
}

class _HealthDecFormState extends State<HealthDecForm> {
  late SharedPreferences prefs;
  bool q1 = false;
  bool q2 = false;
  bool q3 = false;

  String contactInfected = 'No';
  String traveledOverseas = 'No';
  String contactOverseasTravel = 'No';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Text(
                      "Have you been in close contact with persons in quarantine/probable case of COVID-19?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: CupertinoSwitch(
                      value: q1,
                      onChanged: (value) {
                        q1 = value;
                        if (q1 == true) {
                          setState(() {
                            contactInfected = 'Yes';
                          });
                        } else if (q1 == false) {
                          setState(() {
                            contactInfected = 'No';
                          });
                        }
                      },
                      thumbColor: CupertinoColors.white,
                      activeColor: CupertinoColors.activeGreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Text(
                      "Have you been traveling for the past few weeks overseas?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: CupertinoSwitch(
                      value: q2,
                      onChanged: (value) {
                        q2 = value;
                        if (q2 == true) {
                          setState(() {
                            traveledOverseas = 'Yes';
                          });
                        } else if (q2 == false) {
                          setState(() {
                            traveledOverseas = 'No';
                          });
                        }
                      },
                      thumbColor: CupertinoColors.white,
                      activeColor: CupertinoColors.activeGreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Text(
                      "Have you ever been in contact with covid-19 positive while traveling?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: CupertinoSwitch(
                      value: q3,
                      onChanged: (value) {
                        q3 = value;
                        if (q3 == true) {
                          setState(() {
                            contactOverseasTravel = 'Yes';
                          });
                        } else if (q3 == false) {
                          setState(() {
                            contactOverseasTravel = 'No';
                          });
                        }
                      },
                      thumbColor: CupertinoColors.white,
                      activeColor: CupertinoColors.activeGreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ElevatedButton(
            onPressed: () {
              submitHealthDeclaration();
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }

  void submitHealthDeclaration() async {
    prefs = await SharedPreferences.getInstance();
    final userData = jsonDecode(prefs.getString('user_data')!) as Map;

    try {
      var url = Uri.parse(link_header);
      var response = await http.post(
        url,
        body: {
          "state": "state_initial_health_dec",
          "api_key": apiKey(),
          "id_number": userData['id_number'].toString(),
          "contact_infected": contactInfected,
          "traveled_overseas": traveledOverseas,
          "contact_overseas_travel": contactOverseasTravel,
        },
      );
      final utf = utf8.decode(response.bodyBytes);
      final json = jsonDecode(utf);
      final result = json['status'];

      if (result == 'Success') {
        Navigator.of(context)
            .pushReplacementNamed(InitialSymptomsScreen.routeName);
        showSuccessMessage(context, message: "Health Declaration Submitted");
      } else {
        showErrorMessage(context, message: "Submission Failed");
      }
    } catch (err) {
      showErrorMessage(context, message: "Connection error");
    }
  }
}
