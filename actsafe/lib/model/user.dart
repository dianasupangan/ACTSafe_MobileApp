import 'package:flutter/material.dart';

class UserInfo {
  final String idNumber;

  UserInfo({
    required this.idNumber,
  });
}

class User extends ChangeNotifier {
  final List<UserInfo> items = [];

  void add(
    String idNum,
  ) async {
    items.add(
      UserInfo(
        idNumber: idNum,
      ),
    );

    notifyListeners();
  }

  void clear() {
    items.clear();

    notifyListeners();
  }
}
