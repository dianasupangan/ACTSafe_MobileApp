import 'package:flutter/material.dart';

class NoIntrenetConnection extends StatelessWidget {
  const NoIntrenetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            color: Colors.red,
          ),
          Text(
            'Please connect to the internet',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            'To view your current covid status and upload a new test.',
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
                'Return to Homepage',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
