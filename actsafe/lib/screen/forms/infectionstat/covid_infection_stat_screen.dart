import 'package:actsafe/screen/forms/infectionstat/components/infection_status_card.dart';
import 'package:actsafe/screen/forms/infectionstat/components/instruction.dart';
import 'package:actsafe/screen/forms/infectionstat/components/test_form.dart';
import 'package:flutter/material.dart';

class CovidInfectionStatusScreen extends StatefulWidget {
  static const routeName = '/covid-infection-status';
  const CovidInfectionStatusScreen({super.key});

  @override
  State<CovidInfectionStatusScreen> createState() =>
      _CovidInfectionStatusStateScreen();
}

class _CovidInfectionStatusStateScreen
    extends State<CovidInfectionStatusScreen> {
  //api

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid Infection Status"),
      ),
      body: SingleChildScrollView(
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              InfectionStatus(),
              CovidTestForm(),
              UploadInstructions(),
            ],
          ),
        ),
      ),
    );
  }
}
