import 'package:flutter/material.dart';

class conto extends ChangeNotifier {
  int val = 10;

  int get value => val;

  void updateValue(int newValue) {
    val = newValue;
    notifyListeners();
  }
}
