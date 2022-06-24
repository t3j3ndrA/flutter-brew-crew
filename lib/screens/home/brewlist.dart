import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:rebeg/models/brewsdata.dart';

class BrewList extends StatelessWidget {
  const BrewList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final brewsList = Provider.of<AllBrewsData>(context).brewsList;
    return Container(
      child: ListView.builder(
        itemCount: brewsList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor:
                    Colors.brown[brewsList[index]['strength'] ?? 100],
              ),
              title: Text('${brewsList[index]['name']}'),
              subtitle: Text('Takes ${brewsList[index]['sugar']}'),
            ),
          );
        },
      ),
    );
  }
}
