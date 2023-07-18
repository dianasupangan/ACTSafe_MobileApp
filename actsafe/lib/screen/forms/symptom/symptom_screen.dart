import 'package:actsafe/screen/forms/symptom/symptoms_grid.dart';
import 'package:flutter/material.dart';

class SymptomsScreen extends StatefulWidget {
  static const routeName = '/symptom-screen';
  const SymptomsScreen({super.key});

  @override
  State<SymptomsScreen> createState() => _SymptomsScreen();
}

bool _isChecked = false;

class _SymptomsScreen extends State<SymptomsScreen> {
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
