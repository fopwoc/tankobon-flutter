import 'package:flutter/material.dart';

class StateModel extends ChangeNotifier {
  String? _stateText;
  String? get stateText => _stateText;

  void setStateText(String? value) {
    _stateText = value;
    notifyListeners();
  }
}
