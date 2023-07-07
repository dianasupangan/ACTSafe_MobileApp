import 'package:flutter/material.dart';

class CovidStatusInfo {
  final String covidStatus;

  CovidStatusInfo({
    required this.covidStatus,
  });
}

class CovidStatus extends ChangeNotifier {
  final List<CovidStatusInfo> items = [];

  void add(
    String cStatus,
  ) async {
    items.add(
      CovidStatusInfo(
        covidStatus: cStatus,
      ),
    );

    notifyListeners();
  }

  void clear() {
    items.clear();

    notifyListeners();
  }
}
