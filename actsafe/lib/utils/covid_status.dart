import 'dart:convert';

import 'package:actsafe/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../global/api_key.dart';
import '../global/link_header.dart';

class CovidStatusWidget extends StatefulWidget {
  const CovidStatusWidget({super.key});

  @override
  State<CovidStatusWidget> createState() => _CovidStatusWidgetState();
}

class _CovidStatusWidgetState extends State<CovidStatusWidget> {
  late SharedPreferences prefs;
  String exposureStatus = "";
  String infectionStatus = "";

  @override
  void initState() {
    fetchStatus();
    super.initState();
  }

  void fetchStatus() async {
    prefs = await SharedPreferences.getInstance();
    final userData = jsonDecode(prefs.getString('user_data')!) as Map;

    try {
      var url = Uri.parse(link_header);
      var response = await http.post(url, body: {
        "state": "state_check_health_declaration",
        "api_key": apiKey(),
        "id_number": userData['id_number'].toString(),
      });
      final utf = utf8.decode(response.bodyBytes);
      final json = jsonDecode(utf);
      final result = json['status'];

      if (result == 'Success') {
        setState(() {
          exposureStatus = json['exposed'];
          infectionStatus = json['covid_infection_status'];
        });
      }
    } catch (err) {
      showErrorMessage(context, message: "Connection Error");
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return covidStatus(exposureStatus, infectionStatus);
  }

  Widget covidStatus(String exposureStatus, String infectionStatus) {
    if (infectionStatus == "No" && exposureStatus == "No") {
      return notInfected();
    } else if (exposureStatus == "Yes" && infectionStatus == "No") {
      return exposedIndicator();
    } else if (infectionStatus == "Yes") {
      return positiveIndicator();
    } else {
      return Container();
    }
  }
}

Widget positiveIndicator() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 12,
        width: 12,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
      const Text(
        " Positive",
        style: TextStyle(
          color: Colors.red,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget exposedIndicator() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 12,
        width: 12,
        decoration: const BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
      ),
      const Text(
        " Exposed",
        style: TextStyle(
          color: Colors.orange,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget notInfected() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 12,
        width: 12,
        decoration: const BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
      ),
      const Text(
        " Not Infected",
        style: TextStyle(
          color: Colors.green,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
