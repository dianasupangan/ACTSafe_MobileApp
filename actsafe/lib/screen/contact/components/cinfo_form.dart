import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  //add controller

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
            // controller: loanIdController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Email Address'),
              border: OutlineInputBorder(),
            ),
            // controller: loanIdController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Guardian Name'),
              border: OutlineInputBorder(),
            ),
            // controller: loanIdController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Relationship with Guardian'),
              border: OutlineInputBorder(),
            ),
            // controller: loanIdController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Guardian Phone No.'),
              border: OutlineInputBorder(),
            ),
            // controller: loanIdController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Guardian Email Address'),
              border: OutlineInputBorder(),
            ),
            // controller: loanIdController,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(
              50,
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.green.shade600,
          ),
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
