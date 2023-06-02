import 'package:actsafe/screen/home/components/qr_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    //final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              alignment: Alignment.center,
              child: QR_Widget(),
            ),
            Text('Welcome!'),
          ],
        ),
      ),
    );
  }
}
