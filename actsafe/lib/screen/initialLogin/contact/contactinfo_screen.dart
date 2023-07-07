import 'package:actsafe/screen/initialLogin/contact/components/cinfo_form.dart';
import 'package:flutter/material.dart';

class InitialContactInfoScreen extends StatelessWidget {
  static const routeName = '/initial-contactinfo-screen';
  const InitialContactInfoScreen({super.key});

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
