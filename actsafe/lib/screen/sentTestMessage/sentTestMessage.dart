import 'package:actsafe/screen/sentTestMessage/components/sentPositiveTest.dart';
import 'package:flutter/material.dart';

class SentTestMessageScreen extends StatelessWidget {
  static const routeName = '/test-message-screen';
  const SentTestMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Processing"),
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SentPositiveTest(),
      ),
    );
  }
}
