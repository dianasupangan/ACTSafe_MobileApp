import 'package:flutter/material.dart';

class UploadInstructions extends StatefulWidget {
  const UploadInstructions({super.key});

  @override
  State<UploadInstructions> createState() => _UploadInstructionsState();
}

class _UploadInstructionsState extends State<UploadInstructions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Instructions:",
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "1",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Take a photo of your Covid Test Result.",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "2",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Upload to Google Drive",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "3",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Right click the uploaded file.",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "4",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Click Share.",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "5",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Choose \"Anyone with the link\" from the\nGeneral Access options.",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "6",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Copy link, paste in the textfield, then submit.",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
