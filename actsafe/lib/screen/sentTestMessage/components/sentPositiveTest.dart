import 'package:flutter/material.dart';

class SentPositiveTest extends StatelessWidget {
  const SentPositiveTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time_filled_rounded,
                color: Colors.grey,
              ),
              Text(
                'PROCESSING',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.grey),
              ),
            ],
          ),
          const Text(
            'Thank you for submitting your Covid test result!',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey,
              fontSize: 17.0,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Continue to Homepage',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
