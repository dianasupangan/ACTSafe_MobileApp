import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HealthDecForm extends StatefulWidget {
  const HealthDecForm({super.key});

  @override
  State<HealthDecForm> createState() => _HealthDecFormState();
}

class _HealthDecFormState extends State<HealthDecForm> {
  bool q1 = false;
  bool q2 = false;
  bool q3 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "Have you been in close contact with persons in quarantine/probable case of COVID-19?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: CupertinoSwitch(
                      value: q1,
                      onChanged: (value) {
                        q1 = value;
                        setState(
                          () {},
                        );
                      },
                      thumbColor: CupertinoColors.white,
                      activeColor: CupertinoColors.activeGreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "Have you been traveling for the past few weeks overseas?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: CupertinoSwitch(
                      value: q2,
                      onChanged: (value) {
                        q2 = value;
                        setState(
                          () {},
                        );
                      },
                      thumbColor: CupertinoColors.white,
                      activeColor: CupertinoColors.activeGreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "Have you ever been in contact with covid-19 positive while traveling?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: CupertinoSwitch(
                      value: q3,
                      onChanged: (value) {
                        q3 = value;
                        setState(
                          () {},
                        );
                      },
                      thumbColor: CupertinoColors.white,
                      activeColor: CupertinoColors.activeGreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
