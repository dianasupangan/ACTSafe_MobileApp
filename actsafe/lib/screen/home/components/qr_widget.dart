import 'dart:convert';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QR_Widget extends StatefulWidget {
  // final String data;
  const QR_Widget({super.key});

  @override
  State<QR_Widget> createState() => _QR_WidgetState();
}

class _QR_WidgetState extends State<QR_Widget> {
  late SharedPreferences prefs;
  String userId = "";
  @override
  void initState() {
    qrIdNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      //get id Number for QR
      data: userId,
      version: QrVersions.auto,
      size: 200.0,
    );
  }

  void qrIdNumber() async {
    prefs = await SharedPreferences.getInstance();
    final json = jsonDecode(prefs.getString('user_data')!) as Map;

    setState(() {
      userId = json['id_number'].toString();
      print(userId);
    });
  }
}
