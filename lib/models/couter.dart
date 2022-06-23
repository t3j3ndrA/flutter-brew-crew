import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int countValue = 0;
  void incrementCount() {
    countValue++;
    notifyListeners();
  }

  void decrementCount() {
    countValue--;
    notifyListeners();
  }

  void resetCount() {
    countValue = 0;
    notifyListeners();
  }
}
