import 'package:flutter/material.dart';

class DataPrivacyNotes extends StatelessWidget {
  const DataPrivacyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              'Data Privacy Notice',
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
                'The individual\'s right to privacy is respected by the researchers. We are obligated to abide by the Data Privacy Act of 2012, and we are committed to maintaining the privacy of the personal information  you supply (RA 10173). You agree to the collecting and use of your information in accordance with this Privacy Notice by responding to this survey. You will be needed to provide some of your personal data into this survey form, as it is vital for the research we are doing. Without your consent, the researchers will not share the information provided here. In the effort to stop the COVID-19 virus from spreading,ACTSafe stands with the rest of the world. As part of our standard campus access controls, we are requiring this Health Declaration Form from all visitors.',
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
