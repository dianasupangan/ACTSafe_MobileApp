import 'package:actsafe/utils/covid_status.dart';
import 'package:flutter/material.dart';

class InfectionStatus extends StatefulWidget {
  const InfectionStatus({super.key});

  @override
  State<InfectionStatus> createState() => _InfectionStatusState();
}

class _InfectionStatusState extends State<InfectionStatus> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Covid Infection Status: ",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            CovidStatusWidget()
          ],
        ),
      ),
    );
  }
}
