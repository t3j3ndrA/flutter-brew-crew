import 'package:flutter/material.dart';

class MyUser extends ChangeNotifier {
  String uid = '';
  bool showSignIn = true;
  void updateUid(String newUid) {
    uid = newUid;
    notifyListeners();
  }

  void toggelBetweenSignInAndRegistrationPage() {
    showSignIn = !showSignIn;
    notifyListeners();
  }
}
