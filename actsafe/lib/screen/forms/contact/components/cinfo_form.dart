import 'dart:convert';

import 'package:actsafe/global/link_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../../global/validate.dart';
import '../../../../model/user.dart';
import '../../../../utils/snackbar_helper.dart';

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

  bool isPhoneNum = true;
  bool isEmail = true;
  bool isGFName = true;
  bool isGLName = true;
  bool isSalutaion = true;
  bool isGRel = true;
  bool isGPhoneNum = true;
  bool isGEmail = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                isPhoneNum = Validate().validateMobNum(value);
              });
            },
            decoration: InputDecoration(
              label: Text('Phone Number'),
              border: OutlineInputBorder(),
              errorText: isPhoneNum == true
                  ? null
                  : "Please enter your 11-digit phone number",
            ),
            controller: phoneNumController,
            keyboardType: TextInputType.phone,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                isEmail = Validate().validateEmail(value);
              });
            },
            decoration: InputDecoration(
              label: Text('Email Address'),
              border: OutlineInputBorder(),
              errorText: isEmail == true ? null : "Please enter your email",
            ),
            controller: emailAddController,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                isGFName = Validate().validateName(value);
              });
            },
            decoration: InputDecoration(
              label: Text('Guardian Firstname'),
              border: OutlineInputBorder(),
              errorText: isGFName == true
                  ? null
                  : "Please enter your guardian's firstname",
            ),
            controller: guardianFirstNameController,
            keyboardType: TextInputType.name,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                isGLName = Validate().validateName(value);
              });
            },
            decoration: InputDecoration(
              label: Text('Guardian Lastname'),
              border: OutlineInputBorder(),
              errorText: isGLName == true
                  ? null
                  : "Please enter your guardian's lastname",
            ),
            controller: guardianLastNameController,
            keyboardType: TextInputType.name,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                isSalutaion = Validate().validateSalutation(value);
              });
            },
            decoration: InputDecoration(
              label: Text('Guardian Salutation'),
              border: OutlineInputBorder(),
              errorText: isSalutaion == true
                  ? null
                  : "Please enter your guardian's salutation",
            ),
            controller: salutationController,
            keyboardType: TextInputType.name,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                isGRel = value.isEmpty ? false : true;
              });
            },
            decoration: InputDecoration(
              label: Text('Relationship with Guardian'),
              border: OutlineInputBorder(),
              errorText: isGRel == true
                  ? null
                  : "Please enter your relationship with your guardian",
            ),
            controller: guardianRelController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                isGPhoneNum = Validate().validateMobNum(value);
              });
            },
            decoration: InputDecoration(
              label: Text('Guardian Phone No.'),
              border: OutlineInputBorder(),
              errorText: isGPhoneNum == true
                  ? null
                  : "Please enter your guardian's valid phone number",
            ),
            controller: guardianPhoneNumController,
            keyboardType: TextInputType.phone,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                isGEmail = Validate().validateEmail(value);
              });
            },
            decoration: InputDecoration(
              label: Text('Guardian Email Address'),
              border: OutlineInputBorder(),
              errorText: isGEmail == true
                  ? null
                  : "Please enter your guardian's valid phone number",
            ),
            controller: guardianEmailAddController,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (isPhoneNum == true &&
                isEmail == true &&
                isGFName == true &&
                isGLName == true &&
                isSalutaion == true &&
                isGPhoneNum == true &&
                isGEmail == true &&
                phoneNumController.text.isNotEmpty &&
                emailAddController.text.isNotEmpty &&
                guardianFirstNameController.text.isNotEmpty &&
                guardianLastNameController.text.isNotEmpty &&
                salutationController.text.isNotEmpty &&
                guardianRelController.text.isNotEmpty &&
                guardianPhoneNumController.text.isNotEmpty &&
                guardianEmailAddController.text.isNotEmpty) {
              submitContactInfo();
            } else {
              showErrorMessage(context,
                  message: "Please complete the form with valid entries");
            }
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
    var url = Uri.parse(link_header);
    var response = await http.post(
      url,
      body: {
        "state": "state_update_contact_info",
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
