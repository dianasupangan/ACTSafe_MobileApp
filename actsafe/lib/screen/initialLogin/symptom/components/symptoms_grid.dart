import 'dart:convert';

import 'package:actsafe/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../../global/link_header.dart';
import '../../../../model/user.dart';
import '../../../../utils/snackbar_helper.dart';

class SymptomGrid extends StatefulWidget {
  const SymptomGrid({super.key});

  @override
  State<SymptomGrid> createState() => _SymptomGridState();
}

class _SymptomGridState extends State<SymptomGrid> {
  bool bodyache = false;
  bool breathShort = false;
  bool diarrhea = false;
  bool dryCough = false;
  bool fatigue = false;
  bool fever = false;
  bool headache = false;
  bool lossTandS = false;
  bool runnyNose = false;
  bool sorethroat = false;
  bool none = false;

  String bodyacheA = "";
  String breathShortA = "";
  String diarrheaA = "";
  String dryCoughA = "";
  String fatigueA = "";
  String feverA = "";
  String headacheA = "";
  String lossTandSA = "";
  String runnyNoseA = "";
  String sorethroatA = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: [
              //Bodyache
              Card(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/symptoms/bodyache.png',
                    height: 125,
                    width: 125,
                    alignment: Alignment.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bodyache",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: bodyache,
                        onChanged: (value) {
                          bodyache = !bodyache;
                          if (bodyache == true) {
                            setState(() {
                              bodyacheA = "Yes";
                              none = false;
                            });
                          } else if (bodyache == false) {
                            setState(() {
                              bodyacheA = "No";
                            });
                          }
                        },
                      )
                    ],
                  ),
                ]),
              ),
              //Breathing Shortness
              Card(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/symptoms/breathShort.png',
                    height: 125,
                    width: 125,
                    alignment: Alignment.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Breathing\nShortness ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: breathShort,
                        onChanged: (value) {
                          breathShort = !breathShort;
                          if (breathShort == true) {
                            setState(() {
                              breathShortA = "Yes";
                              none = false;
                            });
                          } else if (breathShort == false) {
                            setState(() {
                              breathShortA = "No";
                            });
                          }
                        },
                      )
                    ],
                  ),
                ]),
              ),
              //Diarrhea
              Card(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/symptoms/diarrhea.png',
                    height: 125,
                    width: 125,
                    alignment: Alignment.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Diarrhea",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: diarrhea,
                        onChanged: (value) {
                          diarrhea = !diarrhea;
                          if (diarrhea == true) {
                            setState(() {
                              diarrheaA = "Yes";
                              none = false;
                            });
                          } else if (diarrhea == false) {
                            setState(() {
                              diarrheaA = "No";
                            });
                          }
                        },
                      )
                    ],
                  ),
                ]),
              ),
              //Dry Cough
              Card(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/symptoms/dryCough.png',
                    height: 125,
                    width: 125,
                    alignment: Alignment.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dry Cough",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: dryCough,
                        onChanged: (value) {
                          dryCough = !dryCough;
                          if (dryCough == true) {
                            setState(() {
                              dryCoughA = "Yes";
                              none = false;
                            });
                          } else if (dryCough == false) {
                            setState(() {
                              dryCoughA = "No";
                            });
                          }
                        },
                      )
                    ],
                  ),
                ]),
              ),
              //Fatigue
              Card(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/symptoms/fatigue.png',
                    height: 125,
                    width: 125,
                    alignment: Alignment.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Fatigue",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: fatigue,
                        onChanged: (value) {
                          fatigue = !fatigue;
                          if (fatigue == true) {
                            setState(() {
                              fatigueA = "Yes";
                              none = false;
                            });
                          } else if (fatigue == false) {
                            setState(() {
                              fatigueA = "No";
                            });
                          }
                        },
                      )
                    ],
                  ),
                ]),
              ),
              //Fever
              Card(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/symptoms/fever.png',
                    height: 125,
                    width: 125,
                    alignment: Alignment.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Fever",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: fever,
                        onChanged: (value) {
                          fever = !fever;
                          if (fever == true) {
                            setState(() {
                              feverA = "Yes";
                              none = false;
                            });
                          } else if (fever == false) {
                            setState(() {
                              feverA = "No";
                            });
                          }
                        },
                      )
                    ],
                  ),
                ]),
              ),
              //Headache
              Card(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/symptoms/headache.png',
                    height: 125,
                    width: 125,
                    alignment: Alignment.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Headache",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: headache,
                        onChanged: (value) {
                          headache = !headache;
                          if (headache == true) {
                            setState(() {
                              headacheA = "Yes";
                              none = false;
                            });
                          } else if (headache == false) {
                            setState(() {
                              headacheA = "No";
                            });
                          }
                        },
                      )
                    ],
                  ),
                ]),
              ),
              //Loss of Taste & Smell
              Card(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/symptoms/lossTandS.png',
                    height: 125,
                    width: 125,
                    alignment: Alignment.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Loss of Taste\n& Smell",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: lossTandS,
                        onChanged: (value) {
                          lossTandS = !lossTandS;
                          if (lossTandS == true) {
                            setState(() {
                              lossTandSA = "Yes";
                              none = false;
                            });
                          } else if (lossTandS == false) {
                            setState(() {
                              lossTandSA = "No";
                            });
                          }
                        },
                      )
                    ],
                  ),
                ]),
              ),
              //Runny Nose
              Card(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/symptoms/runnyNose.png',
                    height: 125,
                    width: 125,
                    alignment: Alignment.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Runny Nose",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: runnyNose,
                        onChanged: (value) {
                          runnyNose = !runnyNose;
                          if (runnyNose == true) {
                            setState(() {
                              runnyNoseA = "Yes";
                              none = false;
                            });
                          } else if (runnyNose == false) {
                            setState(() {
                              runnyNoseA = "No";
                            });
                          }
                        },
                      )
                    ],
                  ),
                ]),
              ),
              //Sore Throat
              Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/symptoms/sorethroat.png',
                      height: 125,
                      width: 125,
                      alignment: Alignment.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sore Throat",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Checkbox(
                          value: sorethroat,
                          onChanged: (value) {
                            sorethroat = !sorethroat;
                            if (sorethroat == true) {
                              setState(() {
                                sorethroatA = "Yes";
                                none = false;
                              });
                            } else if (sorethroat == false) {
                              setState(() {
                                sorethroatA = "No";
                              });
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("NONE"),
                      Checkbox(
                        value: none,
                        onChanged: (value) {
                          setState(() {
                            none = !none;

                            if (none == true) {
                              bodyache = false;
                              breathShort = false;
                              diarrhea = false;
                              dryCough = false;
                              fatigue = false;
                              fever = false;
                              headache = false;
                              lossTandS = false;
                              runnyNose = false;
                              sorethroat = false;

                              bodyacheA = "No";
                              breathShortA = "No";
                              diarrheaA = "No";
                              dryCoughA = "No";
                              fatigueA = "No";
                              feverA = "No";
                              headacheA = "No";
                              lossTandSA = "No";
                              runnyNoseA = "No";
                              sorethroatA = "No";
                            }
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  submitSymptom();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void submitSymptom() async {
    print('Fetch');

    //access provider
    final userData = Provider.of<User>(context, listen: false);
    var url = Uri.parse(link_header);
    var response = await http.post(url, body: {
      "state": "state_initial_symptoms",
      "id_number": userData.items.first.idNumber.toString(),
      "fever": feverA,
      "dry_cough": dryCoughA,
      "fatigue": fatigueA,
      "bodyaches": bodyacheA,
      "runny_nose": runnyNoseA,
      "sore_throat": sorethroatA,
      "breath_shortness": breathShortA,
      "diarrhea": diarrheaA,
      "headache": headacheA,
      "loss_smell_taste": lossTandSA,
    });
    final utf = utf8.decode(response.bodyBytes);
    final json = jsonDecode(utf);

    final result = json['status'];
    print("hi: $result");

    if (result == 'Success') {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      showSuccessMessage(context, message: "Symptoms Form Submitted");
    } else {
      showErrorMessage(context, message: "Submission Failed");
    }
    print('Fetch users completed');
  }
}
