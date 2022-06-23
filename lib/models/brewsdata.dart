import 'package:flutter/cupertino.dart';
import 'package:rebeg/screens/home/brewlist.dart';

class BrewData {
  String sugar;
  String name;
  int strength;
  BrewData({required this.sugar, required this.name, required this.strength});
}

class AllBrewsData extends ChangeNotifier {
  List<Map<String, dynamic>> brewsList = [];
  void setNewBrewData(List<Map<String, dynamic>> newList) {
    brewsList = newList;
    notifyListeners();
  }
}
