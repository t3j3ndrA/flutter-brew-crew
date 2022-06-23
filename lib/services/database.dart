import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rebeg/models/brewsdata.dart';

class DatabaseServices {
  final db = FirebaseFirestore.instance.collection('brews');
  DatabaseServices() {
    db.snapshots().listen(
      (event) {
        print('Listened Data : ');
        for (var singleDoc in event.docs) {
          print(singleDoc.data()['cups']);
        }
      },
      onError: (err) => print(err.toString()),
    );
  }

  Future addData({required BrewData brewData, required String uid}) async {
    // FirebaseFirestore.instance.
    final data = <String, dynamic>{
      'sugar': brewData.sugar,
      'cups': brewData.cups,
      'strength': brewData.strength,
    };
    await db.doc(uid).set(data);
  }
}
