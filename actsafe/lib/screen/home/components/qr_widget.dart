import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class QR_Widget extends StatefulWidget {
  // final String data;
  const QR_Widget({super.key});

  @override
  State<QR_Widget> createState() => _QR_WidgetState();
}

class _QR_WidgetState extends State<QR_Widget> {
  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: '1234567890',
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}
