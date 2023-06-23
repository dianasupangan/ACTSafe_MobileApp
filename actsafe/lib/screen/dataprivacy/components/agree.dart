import 'package:actsafe/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class Agreement extends StatelessWidget {
  const Agreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            child: Text(
              'Agreement',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'By clicking the Agree button, I hereby give ACTSafe permission to gather and use the data specified here for the purpose of containing the COVID-19 infection. I am aware that RA 11469, and RA 10173, the Data Privacy Act of 2012, both safeguard my personal information and demand that I give accurate information.',
                style: TextStyle(),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(
                  50,
                ),
              ),
              child: const Text('Agree'),
            ),
          ),
        ],
      ),
    );
  }
}
