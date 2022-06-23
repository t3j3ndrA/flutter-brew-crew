import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rebeg/models/myUser.dart';

class Authenticate {
  // MyUser myusr = MyUser();
  Future<String> signInAnon() async {
    try {
      final UserCredential = await FirebaseAuth.instance.signInAnonymously();
      final User = UserCredential.user;
      if (User != null) {
        return User.uid;
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  Future<String> signOut() async {
    await FirebaseAuth.instance.signOut();

    return '';
  }

  Future<Map> registerUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // print(credential.toString());
      if (credential != null) {
        return {'success': true, 'uid': credential.user!.uid, 'message': null};
      }
      return {
        'success': true,
        'uid': credential.user!.uid,
        'message': 'Invalid Email Adress!'
      };
      // return credential.toString();
    } on FirebaseAuthException catch (e) {
      return {'success': false, 'uid': null, 'message': e.code};
    }
  }

  Future<Map<String, dynamic>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return {
        'success': true,
        'uid': credential.user!.uid,
        'message': 'logged in successfuly'
      };
    } on FirebaseAuthException catch (e) {
      return {'success': false, 'uid': null, 'message': e.code};
    }
  }
}
