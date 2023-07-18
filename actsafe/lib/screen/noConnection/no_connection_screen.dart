import 'package:flutter/material.dart';

import 'components/no_internet_connection.dart';

class NoConnectionScreen extends StatelessWidget {
  static const routeName = '/no-connection';
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("No Internet"),
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: NoIntrenetConnection(),
      ),
    );
  }
}
