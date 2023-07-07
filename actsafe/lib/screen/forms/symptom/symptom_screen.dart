import 'package:actsafe/screen/forms/symptom/symptoms_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

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
        title: Text("Symptoms"),
      ),
      body: SymptomGrid(),
    );
  }
}
