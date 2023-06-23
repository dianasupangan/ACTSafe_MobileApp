import 'package:actsafe/screen/contact/components/cinfo_form.dart';
import 'package:flutter/material.dart';

class ContactInfoScreen extends StatelessWidget {
  static const routeName = '/contactinfo-screen';
  const ContactInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Information"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: ContactForm(),
      ),
    );
  }
}
