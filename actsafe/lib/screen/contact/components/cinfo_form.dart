import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../model/user.dart';
import '../../../utils/snackbar_helper.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  //add controller
  final phoneNumController = TextEditingController();
  final emailAddController = TextEditingController();
  final guardianFirstNameController = TextEditingController();
  final guardianLastNameController = TextEditingController();
  final salutationController = TextEditingController();
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
              label: Text('Guardian Firstname'),
              border: OutlineInputBorder(),
            ),
            controller: guardianFirstNameController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Guardian Lastname'),
              border: OutlineInputBorder(),
            ),
            controller: guardianLastNameController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Guardian Salutation'),
              border: OutlineInputBorder(),
            ),
            controller: salutationController,
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
            submitContactInfo();
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

  void submitContactInfo() async {
    final userData = Provider.of<User>(context, listen: false);

    print('Submit');
    var url = Uri.parse("http://127.0.0.1/http/contact-info.php");
    var response = await http.post(
      url,
      body: {
        "id_number": userData.items.first.idNumber.toString(),
        "phone_number": phoneNumController.text,
        "email_address": emailAddController.text,
        "guardian_id": 'G-${userData.items.first.idNumber.toString()}',
        "first_name": guardianFirstNameController.text,
        "last_name": guardianLastNameController.text,
        "salutation": salutationController.text,
        "relationship": guardianRelController.text,
        "g_phone_number": guardianPhoneNumController.text,
        "g_email_address": guardianEmailAddController.text,
      },
    );
    final utf = utf8.decode(response.bodyBytes);
    final json = jsonDecode(utf);
    final result = json['status'];
    print("hi: $result");

    if (result == 'Success') {
      print('Fetch users completed');
      Navigator.of(context).pop();
      showSuccessMessage(context, message: "Contact Information Submitted");
    } else {
      showErrorMessage(context, message: "Submission Failed");
    }
  }
}
