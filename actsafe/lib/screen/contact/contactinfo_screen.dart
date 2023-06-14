import 'package:actsafe/screen/contact/components/cinfo_form.dart';
import 'package:flutter/material.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Information"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ContactForm(),
      ),
    );
  }
}
