import 'package:actsafe/screen/contact/contactinfo_screen.dart';
import 'package:actsafe/screen/healthdec/healthdec_screen.dart';
import 'package:flutter/material.dart';

import '../screen/home/home_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(),
          child: Image.asset("assets/images/header.png"),
        ),
        ListTile(
          leading: Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Icon(Icons.airline_seat_individual_suite_outlined),
          title: const Text('COVID Infection Status'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(HealthDeclarationScreen.routeName);
          },
        ),
        ListTile(
          leading: Icon(Icons.checklist),
          title: const Text('Symptoms'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(HealthDeclarationScreen.routeName);
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_page_outlined),
          title: const Text('Contact Info Update'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(ContactInfoScreen.routeName);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: const Text('Log Out'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
      ],
    );
  }
}
