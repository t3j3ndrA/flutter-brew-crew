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
    return Container(
      child: ListView.builder(
        itemCount: Provider.of<AllBrewsData>(context).brewsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${Provider.of<AllBrewsData>(context).brewsList[index]['name']}'),
          );
        },
      ),
    );
  }
}
