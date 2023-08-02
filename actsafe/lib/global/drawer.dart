import 'dart:convert';

import 'package:actsafe/screen/forms/contact/contactinfo_screen.dart';
import 'package:actsafe/screen/forms/healthdec/healthdec_screen.dart';
import 'package:actsafe/screen/forms/infectionstat/covid_infection_stat_screen.dart';
import 'package:actsafe/screen/forms/symptom/symptom_screen.dart';
import 'package:actsafe/screen/noConnection/no_connection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/sentTestMessage/sentTestMessage.dart';
import 'link_header.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  late SharedPreferences prefs;
  bool isLogOut = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(),
          child: Image.asset("assets/images/header.png"),
        ),
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.airline_seat_individual_suite_outlined),
          title: const Text('COVID Infection Status'),
          onTap: () {
            testSubmmited();
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit_document),
          title: const Text('Health Declaration'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(HealthDeclarationScreen.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.checklist),
          title: const Text('Symptoms'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(SymptomsScreen.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.contact_page_outlined),
          title: const Text('Contact Info Update'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(ContactInfoScreen.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Log Out'),
          onTap: () {
            logOut();
          },
        ),
      ],
    );
  }

  void testSubmmited() async {
    print('Fetch');

    // access provider
    try {
      prefs = await SharedPreferences.getInstance();
      final userData = jsonDecode(prefs.getString('user_data')!) as Map;

      var url = Uri.parse(link_header);
      var response = await http.post(url, body: {
        "state": "state_check_if_test_submitted",
        "id_number": userData['id_number'],
      });
      final utf = utf8.decode(response.bodyBytes);
      final json = jsonDecode(utf);
      final result = json['test_submitted'];
      print("hi: $json");
      if (result == 'yes') {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(SentTestMessageScreen.routeName);
      } else if (result == 'none') {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(CovidInfectionStatusScreen.routeName);
      }
    } catch (err) {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(NoConnectionScreen.routeName);
    }
  }

  void logOut() async {
    prefs = await SharedPreferences.getInstance();

    await prefs.remove('user_data');

    await FlutterBlePeripheral().stop();

    setState(() {
      isLogOut = prefs.containsKey("user_data");
    });

    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed('/');
  }
}
