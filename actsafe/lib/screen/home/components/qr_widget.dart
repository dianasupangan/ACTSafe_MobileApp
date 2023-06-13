import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

import '../../../model/user.dart';

class QR_Widget extends StatefulWidget {
  // final String data;
  const QR_Widget({super.key});

  @override
  State<QR_Widget> createState() => _QR_WidgetState();
}

class _QR_WidgetState extends State<QR_Widget> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<User>(context, listen: false);
    return QrImageView(
      //get id Number for QR
      data: userData.items.first.idNumber.toString(),
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}
