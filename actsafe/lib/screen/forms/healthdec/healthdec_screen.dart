import 'package:actsafe/screen/forms/healthdec/components/healthdec_form.dart';
import 'package:flutter/material.dart';

class HealthDeclarationScreen extends StatelessWidget {
  static const routeName = '/healthdec-screen';
  const HealthDeclarationScreen({super.key});

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
