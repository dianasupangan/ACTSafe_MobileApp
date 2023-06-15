import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  //add controller
  final phoneNumController = TextEditingController();
  final emailAddController = TextEditingController();
  final guardianNameController = TextEditingController();
  final guardianRelController = TextEditingController();
  final guardianPhoneNumController = TextEditingController();
  final guardianEmailAddController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Phone Number'),
              border: OutlineInputBorder(),
            ),
            controller: phoneNumController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Email Address'),
              border: OutlineInputBorder(),
            ),
            controller: emailAddController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Guardian Name'),
              border: OutlineInputBorder(),
            ),
            controller: guardianNameController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Relationship with Guardian'),
              border: OutlineInputBorder(),
            ),
            controller: guardianRelController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Guardian Phone No.'),
              border: OutlineInputBorder(),
            ),
            controller: guardianPhoneNumController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Guardian Email Address'),
              border: OutlineInputBorder(),
            ),
            controller: guardianEmailAddController,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            contactInfo();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(
              50,
            ),
          ),
          child: const Text("Submit"),
        ),
      ],
    );
  }

  Future<void> contactInfo() async {}
}
