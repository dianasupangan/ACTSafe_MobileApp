import 'package:flutter/material.dart';

class UserInfo {
  final String idNumber;
  final String firstName;
  final String lastname;
  final String userType;

  UserInfo({
    required this.idNumber,
    required this.firstName,
    required this.lastname,
    required this.userType,
  });
}

class User extends ChangeNotifier {
  final List<UserInfo> items = [];

  void add(
    String idNum,
    String fName,
    String lName,
    String uType,
  ) async {
    items.add(
      UserInfo(
        idNumber: idNum,
        firstName: fName,
        lastname: lName,
        userType: uType,
      ),
    );

    notifyListeners();
  }

  void clear() {
    items.clear();

    notifyListeners();
  }
}
