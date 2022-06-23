import 'package:flutter/material.dart';

class CartItems extends ChangeNotifier {
  List items = <String>['soap', 'watch'];
  void addItem(final String newItem) {
    items.add(newItem);
    notifyListeners();
  }
}
