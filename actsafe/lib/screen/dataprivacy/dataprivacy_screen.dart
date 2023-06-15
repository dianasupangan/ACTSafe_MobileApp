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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            DataPrivacyNotes(),
            InformationCollected(),
            DataRetention(),
            Agreement(),
          ],
        ),
      ),
    );
  }
}
