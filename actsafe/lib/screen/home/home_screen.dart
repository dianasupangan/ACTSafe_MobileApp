import 'package:actsafe/global/drawer.dart';
import 'package:actsafe/screen/home/components/qr_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      drawer: Drawer(
        child: MenuDrawer(),
      ),
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              alignment: Alignment.center,
              child: const QR_Widget(),
            ),
            const Text('Welcome!'),
          ],
        ),
      ),
    );
  }
}
