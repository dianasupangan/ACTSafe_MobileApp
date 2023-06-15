import 'package:actsafe/screen/dataprivacy/components/agree.dart';
import 'package:actsafe/screen/dataprivacy/components/data_retention.dart';
import 'package:actsafe/screen/dataprivacy/components/dataprivacy_notes.dart';
import 'package:actsafe/screen/dataprivacy/components/information_collected.dart';
import 'package:flutter/material.dart';

class DataPrivacyScreen extends StatelessWidget {
  const DataPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Privacy"),
      ),
      body: ListView(
        children: [
          Image.asset("assets/images/dataPrivacyPage.png"),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: const DataPrivacyNotes(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: const InformationCollected(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: const DataRetention(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: const Agreement(),
          ),
        ],
      ),
    );
  }
}
