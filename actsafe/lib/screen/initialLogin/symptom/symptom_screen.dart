import 'package:actsafe/screen/initialLogin/symptom/components/symptoms_grid.dart';
import 'package:flutter/material.dart';

class InitialSymptomsScreen extends StatelessWidget {
  static const routeName = '/initial-symptom-screen';
  const InitialSymptomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Symptoms"),
      ),
      body: const SymptomGrid(),
    );
  }
}
