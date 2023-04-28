import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
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
              child: Image.network(
                'https://thumbs.dreamstime.com/b/welcome-concept-white-background-vector-illustration-141779560.jpg',
              ),
            ),
            Text('Welcome $username!'),
          ],
        ),
      ),
    );
  }
}
