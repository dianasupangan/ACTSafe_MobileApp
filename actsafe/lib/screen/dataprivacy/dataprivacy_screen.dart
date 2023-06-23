import 'package:actsafe/screen/dataprivacy/components/agree.dart';
import 'package:actsafe/screen/dataprivacy/components/data_retention.dart';
import 'package:actsafe/screen/dataprivacy/components/dataprivacy_notes.dart';
import 'package:actsafe/screen/dataprivacy/components/information_collected.dart';
import 'package:flutter/material.dart';

class DataPrivacyScreen extends StatelessWidget {
  static const routeName = '/dataprivacy-screen';
  const DataPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Privacy"),
      ),
      body: ListView(
        children: [
          Image.asset("assets/images/dataPrivacyPage.png"),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: DataPrivacyNotes(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: InformationCollected(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: DataRetention(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Agreement(),
          ),
        ],
      ),
    );
  }
}
