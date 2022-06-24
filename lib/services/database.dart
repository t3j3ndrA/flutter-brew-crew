import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rebeg/models/brewsdata.dart';
import 'package:rebeg/models/myuserdata.dart';

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
  // Take provider.of<MyUserData>(context)
  // On listened variable I am going to fire and event from MyUserData class which extens ChangeNotifier
  // I will user Provider as a default values
  Future ListenForMyUserDataChange(
      {required MyUserData myUserData, required String uid}) async {
    db.doc(uid).snapshots().listen(
      (event) {
        final mapData = event.data() as Map<String, dynamic>;
        myUserData.name = mapData['name'];
        myUserData.strength = mapData['strength'];
        myUserData.sugars = mapData['sugar'];
        myUserData.updateMyUserdata();
      },
      onError: (error) => print("Listen failed: $error"),
    );
  }

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

  Future updateMyUserDataFromSettingsForm(
      {required MyUserData myUserData, required String uid}) async {
    final data = <String, dynamic>{
      'name': myUserData.name,
      'sugar': myUserData.sugars,
      'strength': myUserData.strength,
    };
    await db.doc(uid).set(data);
  }
}
