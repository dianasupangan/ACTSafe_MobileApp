import 'package:flutter/material.dart';

class InformationCollected extends StatelessWidget {
  const InformationCollected({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              'Information We Collect',
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
                'ActSafe collects users\' contact information such as names, phone numbers, address, guardians name and their relation, guardian’s phone number and email address. This information was provided by the institution that complies with the Data Privacy Act of  2012 (RA 10173) and shall be used in order for the government to develop regulations and take steps in response to the Covid19 epidemic, we utilize your information to prepare reports for it.',
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
