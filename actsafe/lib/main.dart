import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      title: 'ACTSafe',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ACTSafe'),
      // ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 120),
              child: Image.asset(
                'assets/images/logo.png',
                height: 300,
              ),
            ),
            Container(
              width: 350,
              child: Column(
                children: <Widget>[
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('ID Number'),
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('Password'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('LOG IN'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
