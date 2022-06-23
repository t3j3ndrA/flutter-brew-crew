import 'package:flutter/cupertino.dart';

class BrewData {
  String sugar;
  String cups;
  int strength;
  BrewData({required this.sugar, required this.cups, required this.strength});
}

class AllBrewsData extends ChangeNotifier {
  List<BrewData> brewsList = [];
}
