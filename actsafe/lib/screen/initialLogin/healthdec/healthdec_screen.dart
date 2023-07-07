import 'package:actsafe/screen/initialLogin/healthdec/components/healthdec_form.dart';
import 'package:flutter/material.dart';

class InitialHealthDeclarationScreen extends StatelessWidget {
  static const routeName = '/initial-healthdec-screen';
  const InitialHealthDeclarationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health Declaration"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: HealthDecForm(),
      ),
    );
  }
}
