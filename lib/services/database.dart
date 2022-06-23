import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rebeg/models/brewsdata.dart';

class DatabaseServices {
  final db = FirebaseFirestore.instance.collection('brews');
  // DatabaseServices() {
  //   db.snapshots().listen(
  //     (event) {
  //       // print('Listened Data : ');
  //       List<Map<String, dynamic>> data;
  //       for (var singleDoc in event.docs) {
  //         print(singleDoc.data()['cups']);
  //       }
  //     },
  //     onError: (err) => print(err.toString()),
  //   );
  // }
  CollectionReference get brews {
    return db;
  }

  Future addData({required BrewData brewData, required String uid}) async {
    // FirebaseFirestore.instance.
    final data = <String, dynamic>{
      'sugar': brewData.sugar,
      'name': brewData.name,
      'strength': brewData.strength,
    };
    await db.doc(uid).set(data);
  }
}
