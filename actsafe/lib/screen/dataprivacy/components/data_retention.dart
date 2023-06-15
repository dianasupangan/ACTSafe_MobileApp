import 'package:flutter/material.dart';

class DataRetention extends StatelessWidget {
  const DataRetention({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              'Use, Share & Data Retention Practices',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'In order to enable the contact tracing of suspected, probable, and confirmed Covid19 patients, we may be obligated to provide the acquired data to the Institution in accordance with the mandate of RA 11332. We adhere to RA 11332\'s requirement that submission shall be made to its authorized individuals solely by providing the collected data. The data will only be used by ActSafe for a brief period of time. The information gathered will be kept for SIX (6) weeks before being safely and permanently erased.',
                style: TextStyle(),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
