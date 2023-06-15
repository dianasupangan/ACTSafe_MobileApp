import 'package:actsafe/screen/healthdec/components/healthdec_form.dart';
import 'package:flutter/material.dart';

class HealthDeclarationScreen extends StatelessWidget {
  const HealthDeclarationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Declaration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: HealthDecForm(),
      ),
    );
  }
}
