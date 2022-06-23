import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:rebeg/models/brewsdata.dart';
import 'package:rebeg/models/myUser.dart';
import 'package:rebeg/screens/home/brewlist.dart';
import 'package:rebeg/services/authServices.dart';
import 'package:rebeg/services/database.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  Authenticate authenticateServices = Authenticate();
  final db = DatabaseServices().brews;
  @override
  Widget build(BuildContext context) {
    void listenToDataChanges() {
      db.snapshots().listen((event) {
        List<Map<String, dynamic>> data = event.docs.map((e) {
          return e.data() as Map<String, dynamic>;
        }).toList();
        Provider.of<AllBrewsData>(context, listen: false).setNewBrewData(data);
      });
    }

    listenToDataChanges();
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[500],
          title: Text("Brew crew!"),
          actions: [
            IconButton(
              onPressed: () async {
                Provider.of<MyUser>(context, listen: false)
                    .updateUid(await authenticateServices.signOut());
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: BrewList());
  }
}
